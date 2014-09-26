package com.cicc.tools.codegen;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.cicc.gaf.logger.Logger;
import com.cicc.gaf.logger.LoggerFactory;
import com.cicc.gaf.tradesample.model.TradeSample;
import com.cicc.gbo.message.model.IncomingMessage;
import com.cicc.gbo.oms.model.Execution;
import com.cicc.gbo.oms.model.Order;
import com.cicc.gbo.tps.model.ConditionField;
import com.cicc.gbo.tps.model.ConditionMap;
import com.cicc.gbo.tps.model.Fee;
import com.cicc.gbo.tps.model.Figuration;
import com.cicc.gbo.tps.model.FigurationDefinition;
import com.cicc.gbo.tps.model.TemplateFeeLink;
import com.cicc.gbo.tps.model.Trade;
import com.cicc.gbo.tps.model.Template;
import com.cicc.gbo.tps.model.Condition;

public class CodeGenHelper {
	public static Logger log = LoggerFactory
	.getLogger(CodeGenHelper.class);
	public static void main(String[] args) throws Exception{
		Map<String, Class<?>> objectMap = new HashMap<String, Class<?>>();
		
		String systemName = "gbo";
		objectMap.put("tps-TemplateFeeLink", TemplateFeeLink.class);
		//objectMap.put("tps-FigurationDefinition", FigurationDefinition.class);
		//objectMap.put("tps-TransactionEntity", TransactionEntity.class);
		generateCode(objectMap, systemName);
	}

	public static void generateCode(Map<String, Class<?>> objectMap, String systemName) throws Exception {
		
		List<BeanDesc> beanDescList = new ArrayList<BeanDesc>();
		for(String s : objectMap.keySet()){
			Class<?> targetClass = objectMap.get(s);
			String[] tempStr = s.split("-");
			String targetPackage = tempStr[0];
			BeanDesc beanDesc = new BeanDesc(targetClass, targetPackage);
			beanDescList.add(beanDesc);
//			
	        VelocityHelper.generate4controller(beanDesc, systemName);//initial code generation, can disabled when just changing the class properties.
			VelocityHelper.generate4service(beanDesc, systemName);//initial code generation, can disabled when just changing the class properties.
			
			VelocityHelper.generate4xml(beanDesc);
			VelocityHelper.generate4detail(beanDesc);
			VelocityHelper.generate4list(beanDesc);
			VelocityHelper.generate4Validate(beanDesc);
			VelocityHelper.generate4Upload(beanDesc);

		}
		VelocityHelper.generate4sql(beanDescList);
		log.info("Auto-generated finished!");
	}

}
