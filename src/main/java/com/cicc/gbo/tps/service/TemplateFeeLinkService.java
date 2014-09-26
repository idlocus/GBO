package com.cicc.gbo.tps.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cicc.gaf.dao.GenericDao;
import com.cicc.gaf.pagesort.Pagination;
import com.cicc.gbo.core.service.BaseServiceImpl;
import com.cicc.gbo.core.shared.ProcessConstants;
import com.cicc.gbo.core.shared.RecordStatus;
import com.cicc.gbo.tps.model.TemplateFeeLink;

@Service
public class TemplateFeeLinkService extends BaseServiceImpl {
	@Autowired
	GenericDao genericDao;
	
	public Long create(TemplateFeeLink templateFeeLink) {
		return (Long) genericDao.save(templateFeeLink);
	}
	
	public void update(TemplateFeeLink templateFeeLink) {
		genericDao.update(templateFeeLink);
	}
	
	public void delete(Long id) {
		TemplateFeeLink templateFeeLink = genericDao.get(TemplateFeeLink.class, id);
		genericDao.delete(templateFeeLink);
	}
	
	public TemplateFeeLink read(Long id) {
		return genericDao.get(TemplateFeeLink.class, id);
	}

	public List<TemplateFeeLink> listByExample(TemplateFeeLink templateFeeLink,Pagination initJqgridPagination) {
		List<TemplateFeeLink> templateFeeLinkList = genericDao.queryByExample(TemplateFeeLink.class, templateFeeLink, initJqgridPagination);
		return templateFeeLinkList;
	}
	
	public List<TemplateFeeLink> loadByTemplateId(String templateId) {
		String[] fields = {ProcessConstants.TEMPLATE_ID, ProcessConstants.RECORD_STATUS};
		Object[] values = {templateId, RecordStatus.ACTIVE.name()};
		return genericDao.query(TemplateFeeLink.class, fields, values);
	}

}
