package com.cicc.gbo.core.utils;

import java.util.BitSet;
import java.util.List;

import org.apache.commons.collections.CollectionUtils;

/**
 * @author Guo Hua
 * @version 上午10:01:00 2014年7月8日 
 */
public class BitSetUtils {
	
	private static final int FIELD_LENGTH = 256;
	
	
	
	public static int getFieldLength() {
		return FIELD_LENGTH;
	}

	public static BitSet formatToBitSet(String s) throws Exception {
		BitSet t = new BitSet();
	    int lastBitIndex = s.length() - 1;
	    int i = lastBitIndex;
	    while ( i >= 0) {
	        if ( s.charAt(i) == '1'){
	            t.set(lastBitIndex - i);            
	            i--;
	        }
	        else if (s.charAt(i) == '0') {
	            i--;  
	        } else {
	        	throw new Exception("Format To BitSet Wrong: " + s);
	        }
	    }
	    return t;
	}
	
	public static String formatToString(BitSet bs) throws Exception {
		String result = "";
	    int lastBitIndex = bs.length() - 1;
	    int i = lastBitIndex;
	    while ( i >= 0) {
	    	if ( bs.get(i)) {
	    		result += "1";
	    		i--;
	    	}
	    	else if (!bs.get(i)) {
	    		result += "0";
	    		i--;
	    	} else {
	    		throw new Exception("Format To String Wrong:" + bs);
	    	}
	    }
		return result;
	}
	
	public static String bitSetAnd(String value1, String value2) {
		try {
			BitSet bt_result = BitSetUtils.formatToBitSet(value1);
			BitSet bt = BitSetUtils.formatToBitSet(value2);
			bt_result.and(bt);
			return BitSetUtils.formatToString(bt_result);
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return "";
	}
	
	public static String bitSetOr(String value1, String value2) {
		try {
			BitSet bt_result = BitSetUtils.formatToBitSet(value1);
			BitSet bt = BitSetUtils.formatToBitSet(value2);
			bt_result.or(bt);
			return BitSetUtils.formatToString(bt_result);
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return "";
	}
	
	public static String bitSetListAnd(List<String> list) {
		if (CollectionUtils.isNotEmpty(list)) {
			try {
				BitSet bt_result = BitSetUtils.formatToBitSet(list.get(0));
				for (int i = 1; i < list.size(); i++) {
					BitSet bt = BitSetUtils.formatToBitSet(list.get(i));
					bt_result.and(bt);
				}
				return BitSetUtils.formatToString(bt_result);
			} catch (Exception ex) {
				ex.printStackTrace();
			}
		}
		return "";
	}
}
