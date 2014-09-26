package com.cicc.gaf.datadictionary;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

import com.cicc.gaf.base.BaseModel;

/**
 * @author MuQiong
 * @version build time: Aug 5, 2014 11:17:48 AM
 * class description
 */
@Entity
@Table(name = "t_employee")
public class Employee extends BaseModel {

	/**
	 * 
	 */
	private static final long serialVersionUID = -8568561290775843569L;
	
	private String employeeId;
	private String name;
	private int age;
	private String sex;
	
	public Employee(String id, String name, int age, String sex){
		this.employeeId = id;
		this.name = name;
		this.age = age;
		this.sex = sex;
	}

	public void setEmployeeId(String employeeId){
		this.employeeId = employeeId;
	}
	
	public String getEmployeeId(){
		return employeeId;
	}
	
	public void setName(String name){
		this.name = name;
	}
	
	public String getName(){
		return name;
	}
	
	public void setAge(int age){
		this.age = age;
	}
	
	public int getAge(){
		return age;
	}
	
	public void setSex(String sex){
		this.sex = sex;
	}
	
	@Dictionary(categoryName= "sex")
	public String getSex(){
		return sex;
	}
	
	@Id
	@GeneratedValue(generator = "native")
	@GenericGenerator(name = "native", strategy = "native")
	@Column(name = "entity_id")
	public Long getEntityId() {
		return entityId;
	}

	public void setEntityId(Long id) {
		this.entityId = id;
	}
}
