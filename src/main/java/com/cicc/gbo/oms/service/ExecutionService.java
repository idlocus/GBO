package com.cicc.gbo.oms.service;

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
import com.cicc.gbo.oms.model.Execution;

@Service
public class ExecutionService extends BaseServiceImpl {
	@Autowired
	GenericDao genericDao;
	
	public Long create(Execution execution) {
		return (Long) genericDao.save(execution);
	}
	
	public void update(Execution execution) {
		genericDao.update(execution);
	}
	
	public void delete(Long id) {
		Execution execution = genericDao.get(Execution.class, id);
		genericDao.delete(execution);
	}
	
	public Execution read(Long id) {
		return genericDao.get(Execution.class, id);
	}

	public List<Execution> listByExample(Execution execution,Pagination initJqgridPagination) {
		List<Execution> executionList = genericDao.queryByExample(Execution.class, execution, initJqgridPagination);
		return executionList;
	}

	public void createAndUpdate(Execution execution) {
		String identifier = getIdentifier(Execution.class);
		execution.setInternalRecordId(identifier);
		
		List<Execution> activeList = this.queryParentExecutions(execution);
		if (CollectionUtils.isNotEmpty(activeList)) {
			//String parentExecutionId = Execution.class.getSimpleName();
			for (Execution activeExecution : activeList) {
				activeExecution.setRecordStatus(RecordStatus.INACTIVE.name());
				activeExecution.setRecordRemark(RecordRemarkConstants.UPDATE_RECORD);
				activeExecution.setChildRecordId(identifier);
				//parentExecutionId += ProcessConstants.SPLIT_CHARACTER + activeExecution.getEntityId().toString();
				execution.setParentRecordId(activeExecution.getInternalRecordId());
				genericDao.update(activeExecution);
			}
			//execution.setParentRecordId(parentExecutionId);
		}
		genericDao.save(execution);
	}
	
	public void createAndUpdate(Collection<Execution> executionList) {
		if (CollectionUtils.isNotEmpty(executionList)) {
			List<Execution> allActiveList = new ArrayList<Execution>();
			
			for (Execution execution : executionList) {
				String identifier = getIdentifier(Execution.class);
				execution.setInternalRecordId(identifier);
				
				List<Execution> activeList = this.queryParentExecutions(execution);
				if (CollectionUtils.isNotEmpty(activeList)) {
					//String parentExecutionId = Execution.class.getSimpleName();
					for (Execution activeExecution : activeList) {
						activeExecution.setRecordStatus(RecordStatus.INACTIVE.name());
						activeExecution.setRecordRemark(RecordRemarkConstants.UPDATE_RECORD);
						activeExecution.setChildRecordId(identifier);
						//parentExecutionId += ProcessConstants.SPLIT_CHARACTER + activeExecution.getEntityId().toString();
						execution.setParentRecordId(activeExecution.getInternalRecordId());
					}
					//execution.setParentRecordId(parentExecutionId);
					allActiveList.addAll(activeList);
				}
			}
			for (Execution item : allActiveList) {
				genericDao.update(item);
			}
			for (Execution item : executionList) {
				genericDao.save(item);
			}
		}
	}
	
	public List<Execution> queryParentExecutions(Execution execution) {
		String fields[] = {ProcessConstants.EXTERNAL_RECORD_ID, ProcessConstants.RECORD_STATUS};
		Object values[] = {execution.getExternalRecordId(), RecordStatus.ACTIVE.name()};
		return genericDao.query(Execution.class, fields, values);
	}
}
