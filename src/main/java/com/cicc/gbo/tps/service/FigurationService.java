package com.cicc.gbo.tps.service;

import java.lang.reflect.InvocationTargetException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cicc.gaf.dao.GenericDao;
import com.cicc.gaf.pagesort.Pagination;
import com.cicc.gbo.core.service.BaseServiceImpl;
import com.cicc.gbo.core.shared.ProcessConstants;
import com.cicc.gbo.core.shared.RecordRemarkConstants;
import com.cicc.gbo.core.shared.RecordStatus;
import com.cicc.gbo.tps.model.Figuration;
import com.cicc.gbo.tps.model.FigurationDefinition;
import com.cicc.gbo.tps.model.Trade;

@Service
public class FigurationService extends BaseServiceImpl {
	@Autowired
	GenericDao genericDao;
	@Autowired
	FigurationDefinitionService figurationDefinitionService;
	
	public Long create(Figuration figuration) {
		return (Long) genericDao.save(figuration);
	}
	
	public void update(Figuration figuration) {
		genericDao.update(figuration);
	}
	
	public void delete(Long id) {
		Figuration figuration = genericDao.get(Figuration.class, id);
		genericDao.delete(figuration);
	}
	
	public Figuration read(Long id) {
		return genericDao.get(Figuration.class, id);
	}

	public List<Figuration> listByExample(Figuration figuration,Pagination initJqgridPagination) {
		List<Figuration> figurationList = genericDao.queryByExample(Figuration.class, figuration, initJqgridPagination);
		return figurationList;
	}
	
	public List<Long> create(Collection<Figuration> figurationList) {
		List<Long> ids = new ArrayList<Long>();
		if (CollectionUtils.isNotEmpty(figurationList)) {
			for (Figuration figuration : figurationList) {
				ids.add(this.create(figuration));
			}
		}
		return ids;
	}
	
	public void createAndUpdate(Figuration figuration) {
		String identifier = getIdentifier(Figuration.class);
		figuration.setInternalRecordId(identifier);
		
		List<Figuration> activeList = this.queryParentFigurations(figuration);
		if (CollectionUtils.isNotEmpty(activeList)) {
			//String parentFigurationId = Figuration.class.getSimpleName();
			for (Figuration activeFiguration : activeList) {
				activeFiguration.setRecordStatus(RecordStatus.INACTIVE.name());
				activeFiguration.setRecordRemark(RecordRemarkConstants.UPDATE_RECORD);
				activeFiguration.setChildRecordId(identifier);
				//parentFigurationId += ProcessConstants.SPLIT_CHARACTER + activeFiguration.getEntityId().toString();
				figuration.setParentRecordId(activeFiguration.getInternalRecordId());
				genericDao.update(activeFiguration);
			}
			//figuration.setParentRecordId(parentFigurationId);
		}
		genericDao.save(figuration);
	}
	
	public void createAndUpdate(Collection<Figuration> figurationList) {
		if (CollectionUtils.isNotEmpty(figurationList)) {
			List<Figuration> allActiveList = new ArrayList<Figuration>();
			
			for (Figuration figuration : figurationList) {
				String identifier = getIdentifier(Figuration.class);
				figuration.setInternalRecordId(identifier);
				
				List<Figuration> activeList = this.queryParentFigurations(figuration);
				if (CollectionUtils.isNotEmpty(activeList)) {
					//String parentFigurationId = Figuration.class.getSimpleName();
					for (Figuration activeFiguration : activeList) {
						activeFiguration.setRecordStatus(RecordStatus.INACTIVE.name());
						activeFiguration.setRecordRemark(RecordRemarkConstants.UPDATE_RECORD);
						activeFiguration.setChildRecordId(identifier);
						//parentFigurationId += ProcessConstants.SPLIT_CHARACTER + activeFiguration.getEntityId().toString();
						figuration.setParentRecordId(activeFiguration.getInternalRecordId());
					}
					//figuration.setParentRecordId(parentFigurationId);
					allActiveList.addAll(activeList);
				}
			}
			for (Figuration item : allActiveList) {
				genericDao.update(item);
			}
			for (Figuration item : figurationList) {
				genericDao.save(item);
			}
		}
	}
	
	public List<Figuration> queryParentFigurations(Figuration figuration) {
		String fields[] = {ProcessConstants.TRANSACTION_ID, ProcessConstants.FEE_ID, ProcessConstants.RECORD_STATUS};
		Object values[] = {figuration.getTransactionId(), figuration.getFeeId(), RecordStatus.ACTIVE.name()};
		return genericDao.query(Figuration.class, fields, values);
	}

	public List<Figuration> getFiguration(Trade trade) {
		// get figuration definition list by template id
		Collection<FigurationDefinition> figurationDefinitionList = figurationDefinitionService.getQualifiedFigurationDefinitionListByTrade(trade);
		if (CollectionUtils.isNotEmpty(figurationDefinitionList)) {
			List<Figuration> figurationList = createFiguration(trade, figurationDefinitionList);			
			return figurationList;
		}
		return null;
	}
	private List<Figuration> createFiguration(Trade trade,
			Collection<FigurationDefinition> figurationDefinitionList) {
		// get the qualified figurationDefinitionList
		Collection<FigurationDefinition> qualifiedFigurationDefinitionList = figurationDefinitionService.getQualifiedFigurationDefinitionList(
				trade, figurationDefinitionList);
		List<Figuration> figurationList = new ArrayList<Figuration>();
		for (FigurationDefinition figurationDefinition : qualifiedFigurationDefinitionList) {

			Figuration figuration = new Figuration();
			try {
				BeanUtils.copyProperties(figuration, figurationDefinition);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} 
			
			figuration.setFeeId(figurationDefinition.getFeeId());
	
			figuration.setFeeCode(figurationDefinition.getFeeCode());
			figuration.setTransactionId(trade.getInternalRecordId());
			figuration.setTemplateId(trade.getTemplateId());
			figuration.setEntityId(null);
			figuration.setInternalRecordId(null);
			// calculate the value
			calculateFiguration(trade, figurationDefinition, figuration);

			figurationList.add(figuration);
		}
		return figurationList;
	}

	private void calculateFiguration(Trade trade,
			FigurationDefinition figurationDefinition, Figuration figuration) {
		try {
			String figurationBaseValueString = BeanUtils.getProperty(trade,
					figurationDefinition.getFigurationBase());
			if (StringUtils.isNotBlank(figurationBaseValueString)) {
				BigDecimal figurationBaseValue = new BigDecimal(
						figurationBaseValueString);
				BigDecimal figurationAmount = figurationBaseValue
						.multiply(figurationDefinition.getFigurationRate());
				// min max value check
				if (figurationDefinition.getMinAmount() != null) {
					if (figurationAmount.compareTo(figurationDefinition
							.getMinAmount()) < 0) {
						figurationAmount = figurationDefinition.getMinAmount();
					}
				}
				if (figurationDefinition.getMaxAmount() != null) {
					if (figurationAmount.compareTo(figurationDefinition
							.getMaxAmount()) > 0) {
						figurationAmount = figurationDefinition.getMaxAmount();
					}
				}
				// round up by precious

				figuration.setFigurationBaseValue(figurationBaseValue);
				figuration.setFigurationAmount(figurationAmount);
			}

		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (NoSuchMethodException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
