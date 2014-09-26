package com.cicc.gaf.test.model;

import javax.persistence.Access;
import javax.persistence.AccessType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

import com.cicc.gaf.base.BaseModel;
import com.cicc.gaf.datadictionary.Dictionary;

@Entity
@Table(name = "t_test_table")
public class TestEntity extends BaseModel {
	
	
	private String testName;
	
	@Access(AccessType.FIELD)
	private Long testId;

	@Column(name="test_name")
	@Dictionary(categoryName = "city")
	public String getTestName() {
		return testName;
	}

	public void setTestName(String testName) {
		this.testName = testName;
	}

	
	public Long getTestId() {
		return testId;
	}

	public void setTestId(Long testId) {
		this.testId = testId;
	}
	
	
	@Id
	@GeneratedValue(generator = "native")
	@GenericGenerator(name = "native", strategy = "native")
	public Long getEntityId() {
		return entityId;
	}

	public void setEntityId(Long entityId) {
		this.entityId = entityId;
	}

	
}
