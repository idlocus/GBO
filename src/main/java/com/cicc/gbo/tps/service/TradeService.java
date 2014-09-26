package com.cicc.gbo.tps.service;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cicc.gaf.dao.GenericDao;
import com.cicc.gaf.pagesort.Pagination;
import com.cicc.gbo.core.service.BaseServiceImpl;
import com.cicc.gbo.core.shared.ProcessConstants;
import com.cicc.gbo.core.shared.RecordRemarkConstants;
import com.cicc.gbo.core.shared.RecordStatus;
import com.cicc.gbo.tps.model.Trade;

@Service
public class TradeService extends BaseServiceImpl {
	@Autowired
	GenericDao genericDao;
	
	public Long create(Trade trade) {
		return (Long) genericDao.save(trade);
	}
	
	public void update(Trade trade) {
		genericDao.update(trade);
	}
	
	public void delete(Long id) {
		Trade trade = genericDao.get(Trade.class, id);
		genericDao.delete(trade);
	}
	
	public Trade read(Long id) {
		return genericDao.get(Trade.class, id);
	}

	public List<Trade> listByExample(Trade trade,Pagination initJqgridPagination) {
		List<Trade> tradeList = genericDao.queryByExample(Trade.class, trade, initJqgridPagination);
		return tradeList;
	}

	public void createAndUpdate(Trade trade) {
		String identifier = getIdentifier(Trade.class);
		trade.setInternalRecordId(identifier);
		
		List<Trade> activeList = this.queryParentTrades(trade);
		if (CollectionUtils.isNotEmpty(activeList)) {
			//String parentTradeId = Trade.class.getSimpleName();
			for (Trade activeTrade : activeList) {
				activeTrade.setRecordStatus(RecordStatus.INACTIVE.name());
				activeTrade.setRecordRemark(RecordRemarkConstants.UPDATE_RECORD);
				activeTrade.setChildRecordId(identifier);
				//parentTradeId += ProcessConstants.SPLIT_CHARACTER + activeTrade.getEntityId().toString();
				trade.setParentRecordId(activeTrade.getInternalRecordId());
				genericDao.update(activeTrade);
			}
			//trade.setParentRecordId(parentTradeId);
		}
		genericDao.save(trade);
	}
	
	public void createAndUpdate(Collection<Trade> tradeList) {
		if (CollectionUtils.isNotEmpty(tradeList)) {
			List<Trade> allActiveList = new ArrayList<Trade>();
			
			for (Trade trade : tradeList) {
				String identifier = getIdentifier(Trade.class);
				trade.setInternalRecordId(identifier);
				
				List<Trade> activeList = this.queryParentTrades(trade);
				if (CollectionUtils.isNotEmpty(activeList)) {
					//String parentTradeId = Trade.class.getSimpleName();
					for (Trade activeTrade : activeList) {
						activeTrade.setRecordStatus(RecordStatus.INACTIVE.name());
						activeTrade.setRecordRemark(RecordRemarkConstants.UPDATE_RECORD);
						activeTrade.setChildRecordId(identifier);
						//parentTradeId += ProcessConstants.SPLIT_CHARACTER + activeTrade.getEntityId().toString();
						trade.setParentRecordId(activeTrade.getInternalRecordId());
					}
					//trade.setParentRecordId(parentTradeId);
					allActiveList.addAll(activeList);
				}
			}
			for (Trade item : allActiveList) {
				genericDao.update(item);
			}
			for (Trade item : tradeList) {
				genericDao.save(item);
			}
		}
	}
	
	public List<Trade> queryParentTrades(Trade trade) {
		String fields[] = {ProcessConstants.EXTERNAL_RECORD_ID, ProcessConstants.TEMPLATE_ID, ProcessConstants.RECORD_STATUS};
		Object values[] = {trade.getExternalRecordId(), trade.getTemplateId(), RecordStatus.ACTIVE.name()};
		return genericDao.query(Trade.class, fields, values);
	}
}
