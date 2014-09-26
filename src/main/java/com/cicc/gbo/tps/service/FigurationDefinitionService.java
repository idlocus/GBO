package com.cicc.gbo.tps.service;

import java.lang.reflect.InvocationTargetException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.collections.MapUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cicc.gaf.dao.GenericDao;
import com.cicc.gaf.pagesort.Pagination;
import com.cicc.gbo.tps.model.Fee;
import com.cicc.gbo.tps.model.FigurationDefinition;
import com.cicc.gbo.tps.model.TemplateFeeLink;
import com.cicc.gbo.tps.model.Trade;
import com.cicc.gbo.core.service.BaseServiceImpl;

@Service
public class FigurationDefinitionService extends BaseServiceImpl {
	@Autowired
	GenericDao genericDao;
	@Autowired
	FeeService feeService;
	@Autowired
	TemplateFeeLinkService templateFeeLinkService;
	
	public Long create(FigurationDefinition figurationDefinition) {
		return (Long) genericDao.save(figurationDefinition);
	}
	
	public void update(FigurationDefinition figurationDefinition) {
		genericDao.update(figurationDefinition);
	}
	
	public void delete(Long id) {
		FigurationDefinition figurationDefinition = genericDao.get(FigurationDefinition.class, id);
		genericDao.delete(figurationDefinition);
	}
	
	public FigurationDefinition read(Long id) {
		return genericDao.get(FigurationDefinition.class, id);
	}

	public List<FigurationDefinition> listByExample(FigurationDefinition figurationDefinition,Pagination initJqgridPagination) {
		List<FigurationDefinition> figurationDefinitionList = genericDao.queryByExample(FigurationDefinition.class, figurationDefinition, initJqgridPagination);
		return figurationDefinitionList;
	}
	
	public List<FigurationDefinition> loadAll() {
		return genericDao.loadAll(FigurationDefinition.class);
	}

	public Collection<FigurationDefinition> getQualifiedFigurationDefinitionListByTrade(Trade trade) {
		// get trades template id
		String templateId = trade.getTemplateId();
		
		List<TemplateFeeLink> templateFeeLinkList = templateFeeLinkService.loadByTemplateId(templateId);
		List<Fee> feeList = feeService.loadByTemplateFeeLink(templateFeeLinkList);
		// get all figuration definition, account level and exchange level
		List<String> feeIdList = new ArrayList<String>();
		for (Fee fee : feeList) {
			feeIdList.add(fee.getFeeId());
		}
		List<FigurationDefinition> figurationDefinitionList = new ArrayList<FigurationDefinition>();
		List<FigurationDefinition> allFigurationDefinitionList = null;
		if (CollectionUtils.isNotEmpty(feeIdList)) {
			allFigurationDefinitionList= this.loadAll();
			
			for(FigurationDefinition figurationDefinition : allFigurationDefinitionList){
				String feeId = figurationDefinition.getFeeId();
				Fee fee = feeService.loadByFeeId(feeId);
				if(fee != null && feeIdList.contains(feeId)){
					figurationDefinition.setFeeId(feeId);
					figurationDefinition.setFeeCode(fee.getFeeCode());
					figurationDefinitionList.add(figurationDefinition);
				}
			}
			if(CollectionUtils.isNotEmpty(figurationDefinitionList)){
				return getQualifiedFigurationDefinitionList(trade, figurationDefinitionList);
			}
		}
		
		return null;
	}
	

	public Collection<FigurationDefinition> getQualifiedFigurationDefinitionList(
			Trade trade, Collection<FigurationDefinition> figurationDefinitionList) {
		// In theory there are only one rule satisfied the trade
		// we only get the one with bigger priority
		Collection<FigurationDefinition> qualifiedFigurationDefinitionCollection = null;
		FigurationDefinition tradeFigurationDefinition = new FigurationDefinition();
		try {
			BeanUtils.copyProperties(tradeFigurationDefinition, trade);
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		HashMap<String, FigurationDefinition> feeFigurationDefinitionHashMap = new HashMap<String, FigurationDefinition>();
		
		for (FigurationDefinition figurationDefinition : figurationDefinitionList) {
			if (validateFigurationDefinition(trade,
					figurationDefinition, tradeFigurationDefinition)) {
				String feeCode = figurationDefinition.getFeeCode();
				FigurationDefinition qualifiedFigurationDefine = feeFigurationDefinitionHashMap.get(feeCode);
				
				if (qualifiedFigurationDefine == null) {
					feeFigurationDefinitionHashMap.put(feeCode, figurationDefinition);
				} else {
					if (qualifiedFigurationDefine.getPriority() < figurationDefinition
							.getPriority()) {
						feeFigurationDefinitionHashMap.put(feeCode, figurationDefinition);						
					}
				}
			}
		}
		if (MapUtils.isNotEmpty(feeFigurationDefinitionHashMap)) {
			qualifiedFigurationDefinitionCollection = feeFigurationDefinitionHashMap.values();
		}
		return qualifiedFigurationDefinitionCollection;
	}
	
	public boolean validateFigurationDefinition(Trade trade,
			FigurationDefinition figurationDefinition,
			FigurationDefinition tradeFigurationDefinition) {

		// String accountId = "ALL";
		if (StringUtils.isNotBlank(figurationDefinition.getAccountId())) {
			if (!figurationDefinition.getAccountId().equals(
					FigurationDefinition.CHECK_PASS)
					&& !figurationDefinition.getAccountId().equals(
							tradeFigurationDefinition.getAccountId())) {
				return false;
			}
		}
		// String accountOwnerType = "ALL";// Firm, Client, Broker
		if (StringUtils.isNotBlank(figurationDefinition.getAccountOwnerType())) {
			if (!figurationDefinition.getAccountOwnerType().equals(
					FigurationDefinition.CHECK_PASS)
					&& !figurationDefinition.getAccountOwnerType().equals(
							tradeFigurationDefinition.getAccountOwnerType())) {
				return false;
			}
		}
		// String accountType = "ALL";// DVP, Custodian
		if (StringUtils.isNotBlank(figurationDefinition.getAccountType())) {
			if (!figurationDefinition.getAccountType().equals(
					FigurationDefinition.CHECK_PASS)
					&& !figurationDefinition.getAccountType().equals(
							tradeFigurationDefinition.getAccountType())) {
				return false;
			}
		}
		// String accountCategory = "ALL";// Institution, Person
		if (StringUtils.isNotBlank(figurationDefinition.getAccountCategory())) {
			if (!figurationDefinition.getAccountCategory().equals(
					FigurationDefinition.CHECK_PASS)
					&& !figurationDefinition.getAccountCategory().equals(
							tradeFigurationDefinition.getAccountCategory())) {
				return false;
			}
		}
		// String tradeExchangeId = "ALL";// NYSE, SS, SZ
		if (StringUtils.isNotBlank(figurationDefinition.getTradeExchangeId())) {
			if (!figurationDefinition.getTradeExchangeId().equals(
					FigurationDefinition.CHECK_PASS)
					&& !figurationDefinition.getTradeExchangeId().equals(
							tradeFigurationDefinition.getTradeExchangeId())) {
				return false;
			}
		}
		// String listExchangeId = "ALL";// NYSE, SS, SZ
		if (StringUtils.isNotBlank(figurationDefinition.getListExchangeId())) {
			if (!figurationDefinition.getListExchangeId().equals(
					FigurationDefinition.CHECK_PASS)
					&& !figurationDefinition.getListExchangeId().equals(
							tradeFigurationDefinition.getListExchangeId())) {
				return false;
			}
		}
		// String tradeCurrencyId = "ALL";
		if (StringUtils.isNotBlank(figurationDefinition.getTradingCurrency())) {
			if (!figurationDefinition.getTradingCurrency().equals(
					FigurationDefinition.CHECK_PASS)
					&& !figurationDefinition.getTradingCurrency().equals(
							tradeFigurationDefinition.getTradingCurrency())) {
				return false;
			}
		}
		// String settlementCurrencyId = "ALL";
		if (StringUtils.isNotBlank(figurationDefinition.getSettlementCurrency())) {
			if (!figurationDefinition.getSettlementCurrency().equals(
					FigurationDefinition.CHECK_PASS)
					&& !figurationDefinition.getSettlementCurrency()
							.equals(tradeFigurationDefinition
									.getSettlementCurrency())) {
				return false;
			}
		}

		// String side = "ALL";// B, S, SS, SE, BC
		if (StringUtils.isNotBlank(figurationDefinition.getSide())) {
			if (!figurationDefinition.getSide().equals(
					FigurationDefinition.CHECK_PASS)
					&& !figurationDefinition.getSide().equals(
							tradeFigurationDefinition.getSide())) {
				return false;
			}
		}
		// String productType = "ALL";// Stock, ETF, Bond, Future
		if (StringUtils.isNotBlank(figurationDefinition.getProductType())) {
			if (!figurationDefinition.getProductType().equals(
					FigurationDefinition.CHECK_PASS)
					&& !figurationDefinition.getProductType().equals(
							tradeFigurationDefinition.getProductType())) {
				return false;
			}
		}
		// String productId = "ALL";
		if (StringUtils.isNotBlank(figurationDefinition.getProductId())) {
			if (!figurationDefinition.getProductId().equals(
					FigurationDefinition.CHECK_PASS)
					&& !figurationDefinition.getProductId().equals(
							tradeFigurationDefinition.getProductId())) {
				return false;
			}
		}
		// String businessStrategy = "ALL";// Agency, Prop Trading, Market
		// marker, Program trading
		if (StringUtils.isNotBlank(figurationDefinition.getBusinessStrategy())) {
			if (!figurationDefinition.getBusinessStrategy().equals(
					FigurationDefinition.CHECK_PASS)
					&& !figurationDefinition.getBusinessStrategy().equals(
							tradeFigurationDefinition.getBusinessStrategy())) {
				return false;
			}
		}

		// String transactionChannel = "ALL";// Mobile, GUI, manually, email
		if (StringUtils
				.isNotBlank(figurationDefinition.getTransactionChannel())) {
			if (!figurationDefinition.getTransactionChannel().equals(
					FigurationDefinition.CHECK_PASS)
					&& !figurationDefinition.getTransactionChannel().equals(
							tradeFigurationDefinition.getTransactionChannel())) {
				return false;
			}
		}
		// String transactionManagementName = "ALL";// GMO
		if (StringUtils.isNotBlank(figurationDefinition
				.getTransactionManagementSystem())) {
			if (!figurationDefinition.getTransactionManagementSystem().equals(
					FigurationDefinition.CHECK_PASS)
					&& !figurationDefinition.getTransactionManagementSystem()
							.equals(tradeFigurationDefinition
									.getTransactionManagementSystem())) {
				return false;
			}
		}
		// String traderId = "ALL";
		if (StringUtils.isNotBlank(figurationDefinition.getTraderId())) {
			if (!figurationDefinition.getTraderId().equals(
					FigurationDefinition.CHECK_PASS)
					&& !figurationDefinition.getTraderId().equals(
							tradeFigurationDefinition.getTraderId())) {
				return false;
			}
		}
		// String salesId = "ALL";
		if (StringUtils.isNotBlank(figurationDefinition.getSalesId())) {
			if (!figurationDefinition.getSalesId().equals(
					FigurationDefinition.CHECK_PASS)
					&& !figurationDefinition.getSalesId().equals(
							tradeFigurationDefinition.getSalesId())) {
				return false;
			}
		}
		// String orderLocation = "ALL";// where the order is placed
		if (StringUtils.isNotBlank(figurationDefinition.getOrderLocation())) {
			if (!figurationDefinition.getOrderLocation().equals(
					FigurationDefinition.CHECK_PASS)
					&& !figurationDefinition.getOrderLocation().equals(
							tradeFigurationDefinition.getOrderLocation())) {
				return false;
			}
		}
		// String accountLocation = "ALL";// where the account client
		// location(GST)
		if (StringUtils.isNotBlank(figurationDefinition.getAccountLocation())) {
			if (!figurationDefinition.getAccountLocation().equals(
					FigurationDefinition.CHECK_PASS)
					&& !figurationDefinition.getAccountLocation().equals(
							tradeFigurationDefinition.getAccountLocation())) {
				return false;
			}
		}
		// String measurement = "ALL";// quantity, price, amount (Tiered
		// Commission)
		if (StringUtils.isNotBlank(figurationDefinition.getMeasurement())
				&& !figurationDefinition.getMeasurement().equals(
						FigurationDefinition.MEASUREMENT_CHECK_PASS)) {
			// get measurement value
			BigDecimal lowerLimit = figurationDefinition.getLowerLimit();
			BigDecimal upperLimit = figurationDefinition.getUpperLimit();
			String measurementString;
			try {
				measurementString = BeanUtils.getProperty(trade,
						figurationDefinition.getMeasurement());
				if(StringUtils.isNotBlank(measurementString)){
					BigDecimal measurementValue = new BigDecimal(measurementString);
					if (measurementValue.compareTo(upperLimit) > 0
							|| measurementValue.compareTo(lowerLimit) <= 0) {
						return false;
					}
					else{
						//do nothing
					}

				}
				else{
					return false;
				}
			} catch (IllegalAccessException e) {
				e.printStackTrace();
				return false;
			} catch (InvocationTargetException e) {
				e.printStackTrace();
				return false;
			} catch (NoSuchMethodException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return false;
			}
		}
		return true;
	}

}
