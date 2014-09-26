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
import com.cicc.gbo.core.shared.RecordStatus;
import com.cicc.gbo.tps.model.Fee;
import com.cicc.gbo.tps.model.TemplateFeeLink;

@Service
public class FeeService extends BaseServiceImpl {
	@Autowired
	GenericDao genericDao;
	
	public Long create(Fee fee) {
		return (Long) genericDao.save(fee);
	}
	
	public void update(Fee fee) {
		genericDao.update(fee);
	}
	
	public void delete(Long id) {
		Fee fee = genericDao.get(Fee.class, id);
		genericDao.delete(fee);
	}
	
	public Fee read(Long id) {
		return genericDao.get(Fee.class, id);
	}

	public List<Fee> listByExample(Fee fee,Pagination initJqgridPagination) {
		List<Fee> feeList = genericDao.queryByExample(Fee.class, fee, initJqgridPagination);
		return feeList;
	}
	
	public Fee loadByFeeId(String feeId) {
		String[] fields = {ProcessConstants.FEE_ID, ProcessConstants.RECORD_STATUS};
		Object[] values = {feeId, RecordStatus.ACTIVE.name()};
		return genericDao.query4SingleResult(Fee.class, fields, values);
	}
	
	public List<Fee> loadByTemplateFeeLink(Collection<TemplateFeeLink> templateFeeLinkList) {
		List<Fee> result = new ArrayList<Fee>();
		if (CollectionUtils.isNotEmpty(templateFeeLinkList)) {
			for (TemplateFeeLink templateFeeLink : templateFeeLinkList) {
				Fee fee = this.loadByFeeId(templateFeeLink.getFeeId());
				result.add(fee);
			}
		}
		return result;
	}

}
