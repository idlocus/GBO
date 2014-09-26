package com.cicc.gbo.core.process;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.collections.CollectionUtils;

import com.cicc.gbo.core.exception.BusinessErrorCode;
import com.cicc.gbo.core.exception.BusinessException;
import com.cicc.gbo.core.model.ProcessObject;

/**
 * @author Guo Hua
 * @version 下午2:43:38 2014年9月10日 
 */
public abstract class AbstractWorkFlow implements WorkFlow {
	
	String workFlowName;
	List<Processor> preProcessList = new ArrayList<Processor>();
	List<Processor> processList = new ArrayList<Processor>();
	List<Processor> postProcessList = new ArrayList<Processor>();

	public String getWorkFlowName() {
		return workFlowName;
	}

	public void setWorkFlowName(String workFlowName) {
		this.workFlowName = workFlowName;
	}
	
	
	public List<Processor> getPreProcessList() {
		return preProcessList;
	}

	public void setPreProcessList(List<Processor> preProcessList) {
		this.preProcessList = preProcessList;
	}

	public List<Processor> getPostProcessList() {
		return postProcessList;
	}

	public void setPostProcessList(List<Processor> postProcessList) {
		this.postProcessList = postProcessList;
	}

	public List<Processor> getProcessList() {
		return processList;
	}

	public void setProcessList(List<Processor> processList) {
		this.processList = processList;
	}

	@Override
	public boolean isSuitable(ProcessObject processObject) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public void process(ProcessObject processObject) {
		try {
			if (CollectionUtils.isNotEmpty(preProcessList)) {
				for (Processor processor : preProcessList) {
					processor.process(processObject);
				}
			}
			if (CollectionUtils.isNotEmpty(processList)) {
				for (Processor processor : processList) {
					processor.process(processObject);
				}	
			} else {
				throw new BusinessException(BusinessErrorCode.EMPTY_PROCESSOR_LIST);
			}
			if (CollectionUtils.isNotEmpty(postProcessList)) {
				for (Processor processor : postProcessList) {
					processor.process(processObject);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
