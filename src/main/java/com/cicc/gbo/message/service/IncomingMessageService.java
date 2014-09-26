package com.cicc.gbo.message.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cicc.gaf.dao.GenericDao;
import com.cicc.gaf.pagesort.Pagination;
import com.cicc.gbo.core.service.BaseServiceImpl;
import com.cicc.gbo.message.model.IncomingMessage;

@Service
public class IncomingMessageService extends BaseServiceImpl {
	@Autowired
	GenericDao genericDao;
	
	public Long create(IncomingMessage incomingMessage) {
		return (Long) genericDao.save(incomingMessage);
	}
	
	public void update(IncomingMessage incomingMessage) {
		genericDao.update(incomingMessage);
	}
	
	public void delete(Long id) {
		IncomingMessage incomingMessage = genericDao.get(IncomingMessage.class, id);
		genericDao.delete(incomingMessage);
	}
	
	public IncomingMessage read(Long id) {
		return genericDao.get(IncomingMessage.class, id);
	}

	public List<IncomingMessage> listByExample(IncomingMessage incomingMessage,Pagination initJqgridPagination) {
		List<IncomingMessage> incomingMessageList = genericDao.queryByExample(IncomingMessage.class, incomingMessage, initJqgridPagination);
		return incomingMessageList;
	}

}
