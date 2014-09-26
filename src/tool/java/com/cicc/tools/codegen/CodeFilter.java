package com.cicc.tools.codegen;

import java.util.HashSet;
import java.util.Set;

public class CodeFilter {
	
	public static Set<String> outOfBoxTypeSet = new HashSet<String>();
	public static Set<String> blackListProperties = new HashSet<String>();
	
	static {
		blackListProperties.add("cacheKey");
		blackListProperties.add("class");
		blackListProperties.add("path");
	}
	
	public static boolean needImport(String propertyType) {
		if(propertyType == null)
			return true;
		else if(propertyType.indexOf("java.lang.") == 0)
			return false;
		else
			return true;
	}
	
	public static boolean isEnable(String propertyName) {
		if(blackListProperties.contains(propertyName))
			return false;
		else
			return true;
	}

}