package com.cicc.tools.codegen;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class BeanDescList {
	
	List<BeanDesc> beanDescList;
	Set<String> packageSet;
	
	public BeanDescList(List<BeanDesc> list) {
		beanDescList = new ArrayList<BeanDesc>();
		packageSet = new HashSet<String>();
		
		for(BeanDesc b : list){
			beanDescList.add(b);
			packageSet.add(b.getUppercaseTargetPackage());
		}
		
	}

	public List<BeanDesc> getBeanDescList() {
		return beanDescList;
	}

	public void setBeanDescList(List<BeanDesc> beanDescList) {
		this.beanDescList = beanDescList;
	}

	public Set<String> getPackageSet() {
		return packageSet;
	}

	public void setPackageSet(Set<String> packageSet) {
		this.packageSet = packageSet;
	}

}
