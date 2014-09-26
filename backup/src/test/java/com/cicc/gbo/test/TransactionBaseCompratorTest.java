package com.cicc.gbo.test;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import com.cicc.gbo.core.utils.AuditableBaseComparator;
import com.cicc.gbo.oms.model.Order;

/**
 * @author Guo Hua
 * @version 下午5:45:03 2014年9月17日 
 */
public class TransactionBaseCompratorTest {
	
	public static void main(String args[]) {
		Order o1 = new Order();
		Order o2 = new Order();
		o1.setEntityId(new Long(1));
		o2.setEntityId(new Long(2));
		List<Order> list = new ArrayList<Order>();
		list.add(o2);
		list.add(o1);
		for (Order order: list) {
			System.out.println(order.getEntityId().toString());
		}
		Collections.sort(list, new AuditableBaseComparator<Order>());
		for (Order order: list) {
			System.out.println(order.getEntityId().toString());
		}
	}
}
