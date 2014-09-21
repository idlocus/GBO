package com.cicc.gbo.tps.shared;
/**
 * @author Guo Hua
 * @version 下午7:18:27 2014年9月18日 
 */
public class NativeSqlConstants {

	public static final String ORIGINAL_RECORD_ID = "original_record_id";
	public static final String EXTERNAL_RECORD_ID = "external_record_id";
	public static final String RECORD_STATUS = "record_status";
	
	public static final String UPDATE_ALL_TRANSACTION_CONDITION_MP = "update GBO_TRANSACTION_CONDITION_MP" 
			+ " set original_record_id = ?, external_record_id = ?, record_status = ? "
			+ " where record_status = ?";
	
	public static final String QUERY_ALL_ACTIVE_TRANSACTION_CONDITION = "select * from "
			+ " GBO_TRANSACTION_CONDITION where record_status = 'ACTIVE'";

	public static final String QUERY_ALL_ACTIVE_TRANSACTION_CONDITION_VALUE = "select * from "
			+ " GBO_TRANSACTION_CONDITION_VALUE where record_status = 'ACTIVE'";
}
