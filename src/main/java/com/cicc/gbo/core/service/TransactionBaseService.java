package com.cicc.gbo.core.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cicc.gaf.dao.GenericDao;
import com.cicc.gbo.core.model.TransactionBaseEntity;
import com.cicc.gbo.oms.model.Execution;
import com.cicc.gbo.oms.model.Order;
import com.cicc.gbo.oms.service.ExecutionService;
import com.cicc.gbo.oms.service.OrderService;

/**
 * @author Guo Hua
 * @version 上午9:49:07 2014年9月24日 
 */
@Service
public class TransactionBaseService extends BaseServiceImpl {
	
	@Autowired
	GenericDao genericDao;	
	@Autowired
	OrderService orderService;
	@Autowired
	ExecutionService executionService;
	
	public <T extends TransactionBaseEntity> void createOrUpdate(T transactionBaseEntity) {
		
	}
	
	public <T extends TransactionBaseEntity> void createAndUpdate(T transactionBaseEntity) {
		try {
			if (transactionBaseEntity instanceof Order) {
				orderService.createAndUpdate((Order) transactionBaseEntity);
			} else if (transactionBaseEntity instanceof Execution) {
				executionService.createAndUpdate((Execution) transactionBaseEntity);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public <T extends TransactionBaseEntity> List<T> loadAll(Class<T> entityClass) {
		return genericDao.loadAll(entityClass);
	}
}
