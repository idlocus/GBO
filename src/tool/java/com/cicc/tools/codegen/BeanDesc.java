package com.cicc.tools.codegen;

import java.beans.BeanInfo;
import java.beans.IntrospectionException;
import java.beans.Introspector;
import java.beans.PropertyDescriptor;
import java.lang.annotation.Annotation;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.format.annotation.NumberFormat;

import com.cicc.gaf.datadictionary.Dictionary;
import com.cicc.gaf.datadictionary.RemoteAutoCompletion;
import com.cicc.gaf.validation.DateValidation;
import com.cicc.gaf.validation.NumberValidation;
import com.cicc.gaf.validation.SizeValidation;

public class BeanDesc {

	String targetPackage;
	String staticTargetPackage;
	String uppercaseTargetPackage;
	String targetClassName;
	String staticTargetClassName;
	String lowercaseTargetClassName;

	String sourceClassName;
	String sourceClassSimpleName;
	List<PropertyDesc> propertyList;
	Integer annoPropertyCount;
	
	Set<String> importClassSet;

	public BeanDesc(Class<?> c, String targetPackage) throws NoSuchFieldException, SecurityException {
		try {					
			BeanInfo beanInfo = Introspector.getBeanInfo(c);
			this.sourceClassName = beanInfo.getBeanDescriptor().getBeanClass().getName();
			this.sourceClassSimpleName = beanInfo.getBeanDescriptor().getBeanClass().getSimpleName();
			
			this.targetPackage = targetPackage;
			this.staticTargetPackage = getStaticName(targetPackage);
			this.uppercaseTargetPackage = getUppercaseName(targetPackage);
			this.targetClassName = this.sourceClassSimpleName.replaceAll("SDO", "Object");			
			this.staticTargetClassName = getStaticName(targetClassName);			
			this.lowercaseTargetClassName = getLowercaseName(targetClassName);

			PropertyDescriptor[] propertyDesc = beanInfo.getPropertyDescriptors();
			propertyList = new ArrayList<PropertyDesc>(propertyDesc.length+10);
			
			importClassSet = new HashSet<String>();

			Integer annoPropertyNum = 0;
			for (PropertyDescriptor pd : propertyDesc) {
				String propertyName = pd.getName();
				String propertySimpleType = pd.getPropertyType().getSimpleName();
				String propertySimpleType4Hmb = null;
				String propertySimpleType4Db = null;
				String propertyAlign4ftl = null;
				
				if(propertySimpleType.equals("Date")){
					propertySimpleType4Hmb = "java.util.Date";
				}else{
					propertySimpleType4Hmb = getLowercaseName(propertySimpleType);
				}				
				
				if(propertySimpleType.equals("Double")){
					propertySimpleType4Db = "NUMBER";
					propertyAlign4ftl = "right";
				}else if(propertySimpleType.equals("Boolean") || propertySimpleType.equals("boolean")){
					propertySimpleType4Db = "NUMBER";
					propertyAlign4ftl = "center";
				}else if(propertySimpleType.equals("String")){
					propertySimpleType4Db = "VARCHAR2(1000)";
					propertyAlign4ftl = "left";
				}else if(propertySimpleType.equals("Date")){
					propertySimpleType4Db = "DATE";
					propertyAlign4ftl = "center";
				}else if(propertySimpleType.equals("Long")){
					propertySimpleType4Db = "NUMBER";
					propertyAlign4ftl = "center";
				}else if(propertySimpleType.equals("Integer")){
					propertySimpleType4Db = "NUMBER";
					propertyAlign4ftl = "center";
				}else if(propertySimpleType.equals("BigDecimal")){
					propertySimpleType4Db = "NUMBER";
					propertyAlign4ftl = "center";
				}
					
				String propertyFullType = pd.getPropertyType().getName();
				boolean needImport = CodeFilter.needImport(propertyFullType);
				if(needImport)
					importClassSet.add(propertyFullType);

				if(CodeFilter.isEnable(propertyName)) {
					Method method = pd.getReadMethod();
					Annotation[] annotations = method.getAnnotations();
					if((!propertyName.equals("entityId")) &&(!propertyName.equals("versionNumber"))&&(!propertyName.equals("createdBy"))&&(!propertyName.equals("insertTime"))&&(!propertyName.equals("updatedBy"))&&(!propertyName.equals("lastUpdateTime"))&&(annotations.length != 0)&&(!((annotations.length == 1)&&(annotations[0].annotationType().getSimpleName().equals("Dictionary"))))){
						annoPropertyNum++;
					}
					List<AnnotationDesc> annoDescList = new ArrayList<AnnotationDesc>();
					Boolean hasDict = false;
					Boolean hasNumFormat = false;
					String pattern = "";
					DictionaryDesc dictDesc = null;
					AutoCompleteDesc autoCompleteDesc = null;
					Boolean hasRemoteAutoComplete = false;
					
					Dictionary da = method.getAnnotation(Dictionary.class);
					if(da != null){
						hasDict = true;
						String categoryName = da.categoryName();
						String tableName = da.tableName();
						String keyColumnName = da.keyColumnName();
						String[] valueColumnName = da.valueColumnName();
						
						dictDesc= new DictionaryDesc(categoryName, tableName, keyColumnName, valueColumnName);
					    
						if(categoryName == null || categoryName.isEmpty()){
							RemoteAutoCompletion remoteAuto = method.getAnnotation(RemoteAutoCompletion.class);
							if(remoteAuto != null){
								int minLength = remoteAuto.minLength()!=0?remoteAuto.minLength():1;
								int maxRows = remoteAuto.maxRows()!=0?remoteAuto.maxRows():50;
								String url = "${contextPath}/app/datadictionary?";
								if(tableName != null && !tableName.isEmpty()){
									url = url + "tableName=" + tableName;
								}
								if(keyColumnName != null && !keyColumnName.isEmpty()){
									url = url + "&keyColumnName=" + keyColumnName;
								}
								if(valueColumnName != null && valueColumnName.length != 0){
									url = url + "&valueColumnName=" + valueColumnName[0];
								}
								url = url + "&maxRows=" + maxRows;
 
								autoCompleteDesc = new AutoCompleteDesc(url, minLength, maxRows);
								hasRemoteAutoComplete = true;
							}
							
						}
					
					
					}

					NumberFormat numFormat = method.getAnnotation(NumberFormat.class);
					if(numFormat != null){
						hasNumFormat = true;
						pattern = method.getAnnotation(NumberFormat.class).pattern();							
					}
					
					
					
					for(Annotation anno : annotations){
						String annoName = anno.annotationType().getSimpleName();
						if("RequiredValidation".equals(annoName)){
							  AnnotationDesc annoDesc = getAnnotationDesc("required", "true");
							  annoDescList.add(annoDesc);
						}
						if("UrlValidation".equals(annoName)){
							  AnnotationDesc annoDesc = getAnnotationDesc("url", "true");
							  annoDescList.add(annoDesc);
						}
						if("EmailValidation".equals(annoName)){
							  AnnotationDesc annoDesc = getAnnotationDesc("email", "true");
							  annoDescList.add(annoDesc);
						}
						if("SizeValidation".equals(annoName)){
							Integer min = method.getAnnotation(SizeValidation.class).minLength();
							Integer max = method.getAnnotation(SizeValidation.class).maxLength();
							if(min != -1){
								  AnnotationDesc annoDesc = getAnnotationDesc("minlength", min.toString());
								  annoDescList.add(annoDesc);
							}
							if(max != -1){
								  AnnotationDesc annoDesc = getAnnotationDesc("maxlength", max.toString());
								  annoDescList.add(annoDesc);
							}
						}
                        if("DateValidation".equals(annoName)){
							String format = method.getAnnotation(DateValidation.class).format();
							AnnotationDesc annoDesc = getAnnotationDesc("dateISO", "true");
							annoDescList.add(annoDesc);
                        }
						if("NumberValidation".equals(annoName)){
							Integer precision = method.getAnnotation(NumberValidation.class).precision();
							Double minDouble = method.getAnnotation(NumberValidation.class).min();
							Double maxDouble = method.getAnnotation(NumberValidation.class).max();
							//Boolean isDigits = method.getAnnotation(NumberValidation.class).digits();
							if(precision != -1){
								AnnotationDesc annoDesc = getAnnotationDesc("decimals", precision.toString());
								annoDescList.add(annoDesc);
							}
							if(minDouble != -1.0){
								AnnotationDesc annoDesc = getAnnotationDesc("minDouble", minDouble.toString());
								annoDescList.add(annoDesc);
							}
							if(maxDouble != -1.0){
								AnnotationDesc annoDesc = getAnnotationDesc("maxDouble", maxDouble.toString());
								annoDescList.add(annoDesc);
							}
					/*		if(isDigits){
								AnnotationDesc annoDesc = getAnnotationDesc("digits", "true");
								annoDescList.add(annoDesc);
							}*/
							AnnotationDesc annoDesc = getAnnotationDesc("number", "true");
							annoDescList.add(annoDesc);
						}

					}
                    
					
					PropertyDesc p = new PropertyDesc(propertyName, propertySimpleType, propertySimpleType4Hmb, propertySimpleType4Db, propertyFullType, propertyAlign4ftl, needImport, annoDescList, hasDict, dictDesc, hasNumFormat, pattern, hasRemoteAutoComplete, autoCompleteDesc);
					propertyList.add(p);
				}
				
			}
			this.annoPropertyCount = annoPropertyNum;

		} catch (IntrospectionException e) {
			e.printStackTrace();
		}
	}
	
	private AnnotationDesc getAnnotationDesc(String key, String value) {
		  AnnotationDesc annoDesc = new AnnotationDesc();
		  annoDesc.setKey(key);
		  annoDesc.setValue(value);
		  return annoDesc;
	}

	public String getLowercaseName(String s) {//lowercase: only first letter
		String r = "";
		
		r = s.substring(0, 1).toLowerCase() + s.substring(1, s.length());			
		
		return r;
	}

	public static String getUppercaseName(String s) {//uppercase: only first letter
		String r = "";
		
		r = s.substring(0, 1).toUpperCase() + s.substring(1, s.length());			
		
		return r;
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
	
	public String getTargetPackage() {
		return targetPackage;
	}

	public void setTargetPackage(String targetPackage) {
		this.targetPackage = targetPackage;
	}

	public String getStaticTargetPackage() {
		return staticTargetPackage;
	}

	public void setStaticTargetPackage(String staticTargetPackage) {
		this.staticTargetPackage = staticTargetPackage;
	}

	public String getTargetClassName() {
		return targetClassName;
	}

	public String getUppercaseTargetPackage() {
		return uppercaseTargetPackage;
	}

	public void setUppercaseTargetPackage(String uppercaseTargetPackage) {
		this.uppercaseTargetPackage = uppercaseTargetPackage;
	}

	public void setTargetClassName(String targetClassName) {
		this.targetClassName = targetClassName;
	}

	public String getStaticTargetClassName() {
		return staticTargetClassName;
	}

	public void setStaticTargetClassName(String staticTargetClassName) {
		this.staticTargetClassName = staticTargetClassName;
	}

	public String getLowercaseTargetClassName() {
		return lowercaseTargetClassName;
	}

	public void setLowercaseTargetClassName(String lowercaseTargetClassName) {
		this.lowercaseTargetClassName = lowercaseTargetClassName;
	}

	public String getSourceClassName() {
		return sourceClassName;
	}

	public void setSourceClassName(String sourceClassName) {
		this.sourceClassName = sourceClassName;
	}

	public List<PropertyDesc> getPropertyList() {
		return propertyList;
	}

	public void setPropertyList(List<PropertyDesc> propertyList) {
		this.propertyList = propertyList;
	}
	
	public String getSourceClassSimpleName() {
		return sourceClassSimpleName;
	}
	
	public void setSourceClassSimpleName(String sourceClassSimpleName) {
		this.sourceClassSimpleName = sourceClassSimpleName;
	}

	public Set<String> getImportClassSet() {
		return importClassSet;
	}

	public void setImportClassSet(Set<String> importClassSet) {
		this.importClassSet = importClassSet;
	}

	public Integer getAnnoPropertyCount() {
		return annoPropertyCount;
	}

	public void setAnnoPropertyCount(Integer annoPropertyCount) {
		this.annoPropertyCount = annoPropertyCount;
	}

}
