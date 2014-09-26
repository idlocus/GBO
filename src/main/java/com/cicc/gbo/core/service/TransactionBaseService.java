package com.cicc.gbo.core.service;

import java.util.Collection;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cicc.gbo.core.exception.BusinessErrorCode;
import com.cicc.gbo.core.exception.BusinessException;
import com.cicc.gbo.core.model.TransactionBaseEntity;
import com.cicc.gbo.oms.model.Execution;
import com.cicc.gbo.oms.model.Order;
import com.cicc.gbo.oms.service.ExecutionService;
import com.cicc.gbo.oms.service.OrderService;
import com.cicc.gbo.tps.model.Figuration;
import com.cicc.gbo.tps.model.Trade;
import com.cicc.gbo.tps.service.FigurationService;
import com.cicc.gbo.tps.service.TradeService;

/**
 * @author Guo Hua
 * @version 上午9:49:07 2014年9月24日 
 */
@Service
public class TransactionBaseService extends BaseServiceImpl {
	
	@Autowired
	OrderService orderService;
	@Autowired
	ExecutionService executionService;
	@Autowired
	TradeService tradeService;
	@Autowired
	FigurationService figurationService;
	
	public <T extends TransactionBaseEntity> void createOrUpdate(T transactionBaseEntity) {
		
	}
	
	public <T extends TransactionBaseEntity> void createAndUpdate(T transactionBaseEntity) {
		try {
			if (transactionBaseEntity instanceof Order) {
				orderService.createAndUpdate((Order) transactionBaseEntity);
			} else if (transactionBaseEntity instanceof Execution) {
				executionService.createAndUpdate((Execution) transactionBaseEntity);
			} else if (transactionBaseEntity instanceof Trade) {
				tradeService.createAndUpdate((Trade) transactionBaseEntity);
			} else if (transactionBaseEntity instanceof Figuration) {
				figurationService.createAndUpdate((Figuration) transactionBaseEntity);
			} else {
				throw new BusinessException(BusinessErrorCode.UN_KNOWN_TYPE_IN_POST);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public <T extends TransactionBaseEntity> void createAndUpdate(Collection<T> transactionBaseList) {
		try {
			if (CollectionUtils.isNotEmpty(transactionBaseList)) {
				for (TransactionBaseEntity transactionBaseEntity : transactionBaseList) {
					this.createAndUpdate(transactionBaseEntity);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
