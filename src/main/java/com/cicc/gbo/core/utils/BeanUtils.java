package com.cicc.gbo.core.utils;

import java.beans.PropertyDescriptor;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;

import org.springframework.beans.BeansException;
import org.springframework.beans.FatalBeanException;

/**
 * @author Guo Hua
 * @version 下午1:27:30 2014年9月23日 
 */
public class BeanUtils extends org.springframework.beans.BeanUtils {

	  public static void copyProperties(Object source, Object target) throws BeansException {
		  if (source == null || target == null) {
	
		  }
		  Class<?> actualEditable = target.getClass();
		  PropertyDescriptor[] targetPds = getPropertyDescriptors(actualEditable);
		  for (PropertyDescriptor targetPd : targetPds) {
			  if (targetPd.getWriteMethod() != null) {
				  PropertyDescriptor sourcePd = getPropertyDescriptor(source.getClass(), targetPd.getName());
				  if (sourcePd != null && sourcePd.getReadMethod() != null) {
					  try {
						  Method readMethod = sourcePd.getReadMethod();
						  if (!Modifier.isPublic(readMethod.getDeclaringClass().getModifiers())) {
							  readMethod.setAccessible(true);
						  }
						  Object value = readMethod.invoke(source);
	            		  if (value != null) {
	            			  Method writeMethod = targetPd.getWriteMethod();
				              if (!Modifier.isPublic(writeMethod.getDeclaringClass().getModifiers())) {
				                writeMethod.setAccessible(true);
				              }
				              writeMethod.invoke(target, value);
	            		  }
					  } catch (Throwable ex) {
						  throw new FatalBeanException("Could not copy properties from source to target", ex);
					  }
				  }
			  }
		  }
	  }
}
