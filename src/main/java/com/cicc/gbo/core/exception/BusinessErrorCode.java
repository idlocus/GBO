package com.cicc.gbo.core.exception;
/**
 * @author Guo Hua
 * @version 下午4:55:36 2014年9月22日 
 */
public enum BusinessErrorCode {
	CAPTURE_UN_KNOWN_TYPE("Unknown Transaction Type in Capture"), 	
	ENRICH_UN_KNOWN_TYPE("Unknown Transaction Type in Enricher"), 
	VALIDATE_UN_KNOWN_TYPE("Unknown Transaction Type in Validator"), 
	GENERATE_UN_KNOWN_TYPE("Unknown Transaction Type in Generator"),
	FIGURE_UN_KNOWN_TYPE("Unknown Transaction Type in Figurator"),
	UN_KNOWN_Template_IN_GENERATE("Couldn't Found suitable template in Generator"),
	UN_KNOWN_Template_IN_ENRICH("Couldn't Found suitable template in Enricher"),
	UN_KNOWN_Template_IN_FIGURATOR("Couldn't Found suitable template in Figurator");
	
	private String desc;
	
	BusinessErrorCode(String desc) {
		this.desc = desc;
	}
	
	public String getDescription() {
		return this.desc;
	}
}
