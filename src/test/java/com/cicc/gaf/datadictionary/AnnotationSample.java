package com.cicc.gaf.datadictionary;

import java.lang.reflect.Method;
import java.util.Map;

import com.cicc.gaf.datadictionary.service.DataDictionaryService;


public class AnnotationSample {

	private static DataDictionaryService dataDictionary;
	
	public static void main(String[] args){
		Employee employee = new Employee("13084","tengsp",29,"M");
		
		Method[] methods = Employee.class.getMethods();
		
		for(Method method : methods){
			Dictionary da = method.getAnnotation(Dictionary.class);
			if(da != null){
				String categoryName = da.categoryName();
				String tableName = da.tableName();
				String keyColumnName = da.keyColumnName();
				String[] valueColumnName = da.valueColumnName();
				if(categoryName != null && categoryName != ""){
					Map<String,Object> dataMap = dataDictionary.getMap(categoryName);
					//your logic
				}else if(valueColumnName.length == 1){
					Map<String,Object> dataMap = dataDictionary.getMap(tableName, keyColumnName, valueColumnName[0]);
				}else{
					Map<String,Object[]> dataMap = dataDictionary.getMap(tableName, keyColumnName, valueColumnName);

				}
			}
		}
	
	}
}
