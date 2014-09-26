package com.cicc.tools.codegen;

import java.util.List;

public class PropertyDesc {
	
	private String name;
	private String simpleType;
	private String simpleType4Hmb;
	private String simpleType4Db;
	private String fullType;
	
	private String align4ftl;
	
	private String methodName;
	private String staticName;
	private String displayName;
	
	private List<AnnotationDesc> annoDescList;

	private Boolean hasDict;
	private DictionaryDesc dictDesc;
	
	private Boolean hasNumberFormat;
	private String numFormatPattern;
	
	private Boolean hasRemoteAutoComplete;
	private AutoCompleteDesc autoCompleteDesc;
	
	public PropertyDesc() {
		
	}

	public PropertyDesc(String name, String simpleType, String simpleType4Hmb, String simpleType4Db, String fullType, String align4ftl, boolean needImport, List<AnnotationDesc> annoDescList, Boolean hasDict, DictionaryDesc dictDesc, Boolean hasNumFormat, String pattern, Boolean hasRemoteAutoComplete, AutoCompleteDesc autoCompleteDesc) {
		this.name = name;
		this.simpleType = simpleType;
		this.simpleType4Hmb = simpleType4Hmb;
		this.simpleType4Db = simpleType4Db;
		this.fullType = fullType;
		this.align4ftl = align4ftl;
		this.methodName = Character.toUpperCase(name.charAt(0)) + name.substring(1);
		this.staticName = getStaticName(name);
		this.displayName = getPropertyDisplayName(name);
		this.annoDescList = annoDescList;
		this.hasDict = hasDict;
		this.dictDesc = dictDesc;
		this.hasNumberFormat = hasNumFormat;
		this.numFormatPattern = pattern;
		this.hasRemoteAutoComplete = hasRemoteAutoComplete;
		this.autoCompleteDesc = autoCompleteDesc;
	}
	
	public String getStaticName(String s) {
		String r = "";
		int head = 0;
		int i;
		for(i = 0 ; i < s.length(); i++) {
			if(Character.isUpperCase(s.charAt(i)) && i >0 )
				if(Character.isLowerCase(s.charAt(i-1))){
					if(head == 0)
						r = r + s.substring(head, i).toUpperCase();
					else
						r = r + "_" + s.substring(head, i).toUpperCase();
					head = i;
				}
		}
		if(head == 0)
			r = r + s.substring(head, i).toUpperCase();
		else
			r = r + "_" + s.substring(head, i).toUpperCase();
		
		return r;
	}
	
	public String getPropertyDisplayName(String s) {
		String r = "";
		String temp = Character.toUpperCase(s.charAt(0)) + s.substring(1);
		
		int head = 0;
		for(int i = 1 ; i < temp.length(); i++) {
			if(Character.isUpperCase(temp.charAt(i))){
				r = r + temp.substring(head, i) + " ";
				head = i;
			}				
		}
		
		if(head == 0){
			r = temp;
		} else {
			r = r + temp.substring(head);
		}
		
		return r;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSimpleType() {
		return simpleType;
	}
	public void setSimpleType(String simpleType) {
		this.simpleType = simpleType;
	}
	public String getSimpleType4Hmb() {
		return simpleType4Hmb;
	}

	public void setSimpleType4Hmb(String simpleType4Hmb) {
		this.simpleType4Hmb = simpleType4Hmb;
	}

	public String getSimpleType4Db() {
		return simpleType4Db;
	}

	public void setSimpleType4Db(String simpleType4Db) {
		this.simpleType4Db = simpleType4Db;
	}

	public String getFullType() {
		return fullType;
	}
	public void setFullType(String fullType) {
		this.fullType = fullType;
	}

	public String getAlign4ftl() {
		return align4ftl;
	}

	public void setAlign4ftl(String align4ftl) {
		this.align4ftl = align4ftl;
	}

	public String getMethodName() {
		return methodName;
	}

	public void setMethodName(String methodName) {
		this.methodName = methodName;
	}

	public String getStaticName() {
		return staticName;
	}

	public void setStaticName(String staticName) {
		this.staticName = staticName;
	}

	public String getDisplayName() {
		return displayName;
	}

	public void setDisplayName(String displayName) {
		this.displayName = displayName;
	}

	public Boolean getHasDict() {
		return hasDict;
	}

	public void setHasDict(Boolean hasDict) {
		this.hasDict = hasDict;
	}

	public DictionaryDesc getDictDesc() {
		return dictDesc;
	}

	public void setDictDesc(DictionaryDesc dictDesc) {
		this.dictDesc = dictDesc;
	}

	public List<AnnotationDesc> getAnnoDescList() {
		return annoDescList;
	}

	public void setAnnoDescList(List<AnnotationDesc> annoDescList) {
		this.annoDescList = annoDescList;
	}

	public Boolean getHasNumberFormat() {
		return hasNumberFormat;
	}

	public void setHasNumberFormat(Boolean hasNumberFormat) {
		this.hasNumberFormat = hasNumberFormat;
	}

	public String getNumFormatPattern() {
		return numFormatPattern;
	}

	public void setNumFormatPattern(String numFormatPattern) {
		this.numFormatPattern = numFormatPattern;
	}

	public Boolean getHasRemoteAutoComplete() {
		return hasRemoteAutoComplete;
	}

	public void setHasRemoteAutoComplete(Boolean hasRemoteAutoComplete) {
		this.hasRemoteAutoComplete = hasRemoteAutoComplete;
	}

	public AutoCompleteDesc getAutoCompleteDesc() {
		return autoCompleteDesc;
	}

	public void setAutoCompleteDesc(AutoCompleteDesc autoCompleteDesc) {
		this.autoCompleteDesc = autoCompleteDesc;
	}
	

}
