package com.cicc.gbo.oms.service;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cicc.gaf.dao.GenericDao;
import com.cicc.gaf.pagesort.Pagination;
import com.cicc.gbo.core.service.BaseServiceImpl;
import com.cicc.gbo.core.shared.ProcessConstants;
import com.cicc.gbo.core.shared.RecordRemarkConstants;
import com.cicc.gbo.core.shared.RecordStatus;
import com.cicc.gbo.oms.model.Order;

@Service
public class OrderService extends BaseServiceImpl  {
	
	@Autowired
	GenericDao genericDao;
	
	public Long create(Order order) {
		String identifier = getIdentifier(Order.class);
		if (StringUtils.isEmpty(order.getInternalRecordId())) {
			order.setInternalRecordId(identifier);
		}
		if (StringUtils.isEmpty(order.getExternalRecordId())) {
			order.setExternalRecordId(identifier);
		}
		return (Long) genericDao.save(order);
	}
	
	public void update(Order order) {
		String identifier = getIdentifier(Order.class);
		
		Order originalOrder = genericDao.get(Order.class, order.getEntityId());
		originalOrder.setRecordStatus(RecordStatus.INACTIVE.name());
		originalOrder.setRecordRemark(RecordRemarkConstants.UPDATE_RECORD);
		originalOrder.setChildRecordId(identifier);
		
		order.setInternalRecordId(identifier);
		order.setParentRecordId(originalOrder.getInternalRecordId());
		
		genericDao.update(originalOrder);
		genericDao.save(order);
	}
	
	public void delete(Long id) {
		Order originalOrder = genericDao.get(Order.class, id);
		originalOrder.setRecordStatus(RecordStatus.INACTIVE.name());
		originalOrder.setRecordRemark(RecordRemarkConstants.DELETE_RECORD);
		
		genericDao.update(originalOrder);
	}
	
	public Order read(Long id) {
		return genericDao.get(Order.class, id);
	}

	public List<Order> listByExample(Order order,Pagination initJqgridPagination) {
		order.setRecordStatus(null);
		List<Order> orderList = genericDao.queryByExample(Order.class, order, initJqgridPagination);
		return orderList;
	}
	
	public List<Long> create(Collection<Order> orderList) {
		List<Long> ids = new ArrayList<Long>();
		if (CollectionUtils.isNotEmpty(orderList)) {
			for (Order order : orderList) {
				ids.add(this.create(order));
			}
		}
		return ids;
	}
	
	public void update(Collection<Order> orderList) {
		if (CollectionUtils.isNotEmpty(orderList)) {
			for (Order order : orderList) {
				this.update(order);
			}
		}
	}
	
	public void createAndUpdate(Order order) {
		String identifier = getIdentifier(Order.class);
		order.setInternalRecordId(identifier);
		
		List<Order> activeList = this.queryParentOrders(order);
		if (CollectionUtils.isNotEmpty(activeList)) {
			//String parentOrderId = Order.class.getSimpleName();
			for (Order activeOrder : activeList) {
				activeOrder.setRecordStatus(RecordStatus.INACTIVE.name());
				activeOrder.setRecordRemark(RecordRemarkConstants.UPDATE_RECORD);
				activeOrder.setChildRecordId(identifier);
				//parentOrderId += ProcessConstants.SPLIT_CHARACTER + activeOrder.getEntityId().toString();
				order.setParentRecordId(activeOrder.getInternalRecordId());
				genericDao.update(activeOrder);
			}
			//order.setParentRecordId(parentOrderId);
		}
		genericDao.save(order);
	}
	
	public void createAndUpdate(Collection<Order> orderList) {
		if (CollectionUtils.isNotEmpty(orderList)) {
			List<Order> allActiveList = new ArrayList<Order>();
			
			for (Order order : orderList) {
				String identifier = getIdentifier(Order.class);
				order.setInternalRecordId(identifier);
				
				List<Order> activeList = this.queryParentOrders(order);
				if (CollectionUtils.isNotEmpty(activeList)) {
					//String parentOrderId = Order.class.getSimpleName();
					for (Order activeOrder : activeList) {
						activeOrder.setRecordStatus(RecordStatus.INACTIVE.name());
						activeOrder.setRecordRemark(RecordRemarkConstants.UPDATE_RECORD);
						activeOrder.setChildRecordId(identifier);
						//parentOrderId += ProcessConstants.SPLIT_CHARACTER + activeOrder.getEntityId().toString();
						order.setParentRecordId(activeOrder.getInternalRecordId());
					}
					//order.setParentRecordId(parentOrderId);
					allActiveList.addAll(activeList);
				}
			}
			for (Order item : allActiveList) {
				genericDao.update(item);
			}
			for (Order item : orderList) {
				genericDao.save(item);
			}
		}
	}
	
	public List<Order> queryParentOrders(Order order) {
		String fields[] = {ProcessConstants.EXTERNAL_RECORD_ID, ProcessConstants.RECORD_STATUS};
		Object values[] = {order.getExternalRecordId(), RecordStatus.ACTIVE.name()};
		return genericDao.query(Order.class, fields, values);
	}

}
