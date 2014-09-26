package com.cicc.gbo.tps.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cicc.gaf.dao.GenericDao;
import com.cicc.gaf.pagesort.Pagination;
import com.cicc.gbo.core.service.BaseServiceImpl;
import com.cicc.gbo.core.shared.ProcessConstants;
import com.cicc.gbo.core.shared.RecordStatus;
import com.cicc.gbo.tps.model.Template;

@Service
public class TemplateService extends BaseServiceImpl {
	@Autowired
	GenericDao genericDao;
	
	public Long create(Template tradeTemplate) {
		return (Long) genericDao.save(tradeTemplate);
	}
	
	public void update(Template tradeTemplate) {
		genericDao.update(tradeTemplate);
	}
	
	public void delete(Long id) {
		Template tradeTemplate = genericDao.get(Template.class, id);
		genericDao.delete(tradeTemplate);
	}
	
	public Template read(Long id) {
		return genericDao.get(Template.class, id);
	}

	public List<Template> listByExample(Template tradeTemplate,Pagination initJqgridPagination) {
		List<Template> tradeTemplateList = genericDao.queryByExample(Template.class, tradeTemplate, initJqgridPagination);
		return tradeTemplateList;
	}
	
	public List<Template> loadAllByGroupId(String templateGroupId) {
		String[] fields = {ProcessConstants.TEMPLATE_GROUP_ID, ProcessConstants.RECORD_STATUS};
		Object[] values = {templateGroupId, RecordStatus.ACTIVE.name()};
		return genericDao.query(Template.class, fields, values);
	}

}
