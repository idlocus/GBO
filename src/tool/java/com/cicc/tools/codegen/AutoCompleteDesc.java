package com.cicc.tools.codegen;

public class AutoCompleteDesc {

	private int minLength;
	private int maxRows;
	private String url;

	public AutoCompleteDesc(String url2, int minLength2, int maxRows2) {
		this.url = url2;
		this.minLength = minLength2;
		this.maxRows = maxRows2;
	}

	public int getMinLength() {
		return minLength;
	}

	public void setMinLength(int minLength) {
		this.minLength = minLength;
	}

	public int getMaxRows() {
		return maxRows;
	}

	public void setMaxRows(int maxRows) {
		this.maxRows = maxRows;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}
	

}
