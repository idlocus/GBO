package com.cicc.gaf.test.dao;

import javax.persistence.EntityManagerFactory;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Test {
	public static void main(String[] args) throws java.lang.Exception{
		  // TODO Auto-generated method stub
		  ApplicationContext ctx=new ClassPathXmlApplicationContext("spring.xml");
		  //MyDao action = (MyDao) ctx.getBean("DaoJDBCTemplateImple");
		  EntityManagerFactory emf = (EntityManagerFactory) ctx.getBean("emf");
	}
}
