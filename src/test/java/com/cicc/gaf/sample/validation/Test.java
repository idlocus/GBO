package com.cicc.gaf.sample.validation;

import java.util.Date;

import com.cicc.gaf.validation.DateValidation;
import com.cicc.gaf.validation.EmailValidation;
import com.cicc.gaf.validation.RequiredValidation;
import com.cicc.gaf.validation.SizeValidation;
import com.cicc.gaf.validation.NumberValidation;
import com.cicc.gaf.validation.UrlValidation;

public class Test {
	
	private String myName;

	
	private String email;


	private Date transDate;


	private Date createDate;


	private String url;


	private String requiredUrl;


	private Integer myAge;


	private Integer amount;

	
	private Integer digits;
	
	@SizeValidation(maxLength = 100, minLength = 10)
	public String getMyName() {
		return myName;
	}

	public void setMyName(String myName) {
		this.myName = myName;
	}
	@EmailValidation
	@RequiredValidation
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	@DateValidation(format = "YYYY-MM-DD")
	public Date getTransDate() {
		return transDate;
	}

	public void setTransDate(Date transDate) {
		this.transDate = transDate;
	}
	@UrlValidation
	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}
	@NumberValidation
	@RequiredValidation
	@SizeValidation(minLength = 0, maxLength = 10)
	public Integer getMyAge() {
		return myAge;
	}
	
	public void setMyAge(Integer myAge) {
		this.myAge = myAge;
	}

	public void setRequiredUrl(String requiredUrl) {
		this.requiredUrl = requiredUrl;
	}
	@UrlValidation
	@SizeValidation(minLength = 0, maxLength = 10)
	public String getRequiredUrl() {
		return requiredUrl;
	}

	public void setAmount(Integer amount) {
		this.amount = amount;
	}

	public Integer getAmount() {
		return amount;
	}
	@DateValidation(format = "YYYY-MM-DD")
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public Date getCreateDate() {
		return createDate;
	}

}
