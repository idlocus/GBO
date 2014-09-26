package com.cicc.tools.codegen;

public class DictionaryDesc {

	private String categoryName;
	private String tableName;
	private String keyColumnName;
	private String[] valueColumnName;

	private DictionaryDesc() {

	}

	public DictionaryDesc(String categoryName2, String tableName2,
			String keyColumnName2, String[] valueColumnName2) {

          this.categoryName = categoryName2;
          this.tableName = tableName2;
          this.keyColumnName = keyColumnName2;
          this.valueColumnName = valueColumnName2;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public String getTableName() {
		return tableName;
	}

	public void setTableName(String tableName) {
		this.tableName = tableName;
	}

	public String getKeyColumnName() {
		return keyColumnName;
	}

	public void setKeyColumnName(String keyColumnName) {
		this.keyColumnName = keyColumnName;
	}

	public String[] getValueColumnName() {
		return valueColumnName;
	}

	public void setValueColumnName(String[] valueColumnName) {
		this.valueColumnName = valueColumnName;
	}

}
