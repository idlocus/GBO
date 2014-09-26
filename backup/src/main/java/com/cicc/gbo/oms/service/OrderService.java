package com.cicc.gbo.oms.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cicc.gaf.dao.GenericDao;
import com.cicc.gaf.pagesort.Pagination;

import com.cicc.gbo.oms.model.Order;

@Service
public class OrderService {
	@Autowired
	GenericDao genericDao;
	
	public Long create(Order order) {
		return (Long) genericDao.save(order);
	}
	
	public void update(Order order) {
		genericDao.update(order);
	}
	
	public void delete(Long id) {
		Order order = genericDao.get(Order.class, id);
		genericDao.delete(order);
	}
	
	public Order read(Long id) {
		return genericDao.get(Order.class, id);
	}

	public List<Order> listByExample(Order order,Pagination initJqgridPagination) {
		List<Order> orderList = genericDao.queryByExample(Order.class, order, initJqgridPagination);
		return orderList;
	}

}
