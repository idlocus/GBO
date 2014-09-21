package com.cicc.gbo.core.utils;

import java.util.Comparator;

import com.cicc.gbo.core.model.AuditableEntity;

/**
 * @author Guo Hua
 * @version 下午4:57:33 2014年9月17日 
 * @param <T>
 */
public class AuditableBaseComparator<T extends AuditableEntity> implements Comparator<T> {

	@Override
	public int compare(T o1, T o2) {
		Long entityIdLeft = o1.getEntityId();
		Long entityIdRight = o2.getEntityId();
		return entityIdLeft.compareTo(entityIdRight);
	}

}
