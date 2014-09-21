package com.cicc.gbo.core.process;

import java.util.ArrayList;
import java.util.List;

import com.cicc.gbo.core.capturer.Capturer;
import com.cicc.gbo.core.enricher.Enricher;
import com.cicc.gbo.core.figurator.Figurator;
import com.cicc.gbo.core.generator.Generator;
import com.cicc.gbo.core.model.ProcessObject;
import com.cicc.gbo.core.validator.Validator;

/**
 * @author Guo Hua
 * @version 下午2:43:38 2014年9月10日 
 */
public abstract class WorkFlowImpl implements WorkFlow {
	
	String workFlowName;
	Capturer capturer;
	List<Validator> validatorList = new ArrayList<Validator>();
	List<Enricher> enricherList = new ArrayList<Enricher>();
	List<Figurator> figuratorList = new ArrayList<Figurator>();
	List<Generator> generatorList = new ArrayList<Generator>();

	public String getWorkFlowName() {
		return workFlowName;
	}

	public void setWorkFlowName(String workFlowName) {
		this.workFlowName = workFlowName;
	}

	public Capturer getCapturer() {
		return capturer;
	}

	public void setCapturer(Capturer capturer) {
		this.capturer = capturer;
	}

	public List<Validator> getValidatorList() {
		return validatorList;
	}

	public void setValidatorList(List<Validator> validatorList) {
		this.validatorList = validatorList;
	}

	public List<Enricher> getEnricherList() {
		return enricherList;
	}

	public void setEnricherList(List<Enricher> enricherList) {
		this.enricherList = enricherList;
	}

	public List<Figurator> getFiguratorList() {
		return figuratorList;
	}

	public void setFiguratorList(List<Figurator> figuratorList) {
		this.figuratorList = figuratorList;
	}

	public List<Generator> getGeneratorList() {
		return generatorList;
	}

	public void setGeneratorList(List<Generator> generatorList) {
		this.generatorList = generatorList;
	}

	@Override
	public boolean isSuitable(ProcessObject processObject) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public void process(ProcessObject processObject) {
		if(capturer != null){
			capturer.capture(processObject);
		}
		else{
			//TODO throw exception
		}
		
		validate(processObject);

		enrich(processObject);
		
		generate(processObject);

		figure(processObject);
		
	}

	@Override
	public void validate(ProcessObject processObject) {
		for (Validator validator : validatorList) {
			validator.validate(processObject);
		}

	}

	@Override
	public void enrich(ProcessObject processObject) {
		for (Enricher enricher : enricherList) {
			enricher.enrich(processObject);
		}
	}

	@Override
	public void figure(ProcessObject processObject) {
		for (Figurator figurator : figuratorList) {
			figurator.figure(processObject);
		}
	}

	@Override
	public void generate(ProcessObject processObject) {
		for (Generator generator : generatorList) {
			generator.generate(processObject);
		}
	}

}
