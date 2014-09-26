package com.cicc.tools.codegen;

import java.io.File;
import java.io.PrintWriter;
import java.util.List;

import org.apache.velocity.Template;
import org.apache.velocity.VelocityContext;
import org.apache.velocity.app.Velocity;

public class VelocityHelper {

	private static String NO_PACKAGE = "NoPackage";
	
	private static Template template4sql;
	private static Template template4controller;
	private static Template template4detail;
	private static Template template4list;
	private static Template template4service;
	private static Template template4xml;
	private static Template template4Validate;
	private static Template template4Upload;

	static {
		try{
			Velocity.init();
			Velocity.addProperty(Velocity.ENCODING_DEFAULT, "utf-8");
			Velocity.addProperty(Velocity.INPUT_ENCODING, "utf-8");
			Velocity.addProperty(Velocity.OUTPUT_ENCODING, "utf-8");
			template4sql = Velocity.getTemplate("code_template/sql.vm");
			template4controller = Velocity.getTemplate("code_template/controller.vm");
			template4detail = Velocity.getTemplate("code_template/detail.vm");
			template4list = Velocity.getTemplate("code_template/list.vm");
			template4service = Velocity.getTemplate("code_template/service.vm");
			template4xml = Velocity.getTemplate("code_template/xml.vm");
			template4Validate = Velocity.getTemplate("code_template/validate.vm");
			template4Upload = Velocity.getTemplate("code_template/upload.vm");
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public static void generate4controller(BeanDesc beanDesc, String systemName) {

		VelocityContext context = new VelocityContext();

		context.put("beanDesc", beanDesc);
		
		String targetFile = beanDesc.getTargetClassName() + "Controller.java";
		
		String fileName = null;

		try {
			if(beanDesc.getTargetPackage().equals(NO_PACKAGE)){
				fileName = "src/main/java/com/cicc/" + systemName +"/controller/" + targetFile;
			} else {
				File dirFile = new File("src/main/java/com/cicc/" + systemName +"/" + beanDesc.getTargetPackage() + "/" + "controller/");
				if(!dirFile.exists()){
					dirFile.mkdirs();
				}
				fileName = "src/main/java/com/cicc/" + systemName + "/" + beanDesc.getTargetPackage() + "/" + "controller/" + targetFile;
			}
			
			File file = new File(fileName);				
			if(file.exists()){
				fileName = fileName + ".temp";
			}
			
			PrintWriter writer = null;
			writer = new PrintWriter(new File(fileName));

			template4controller.merge(context, writer);

			writer.flush();
			writer.close();

		} catch(Exception e) {
			e.printStackTrace();
		}

	}
	
	public static void generate4service(BeanDesc beanDesc, String systemName) {

		VelocityContext context = new VelocityContext();

		context.put("beanDesc", beanDesc);
		
		String targetFile = beanDesc.getTargetClassName() + "Service.java";
		
		String fileName = null;

		try {
			if(beanDesc.getTargetPackage().equals(NO_PACKAGE)){
				fileName = "src/main/java/com/cicc/" + systemName + "/service/" + targetFile;
			} else {
				File dirFile = new File("src/main/java/com/cicc/" + systemName + "/" + beanDesc.getTargetPackage() + "/" + "service/");
				if(!dirFile.exists()){
					dirFile.mkdirs();
				}
				fileName = "src/main/java/com/cicc/" + systemName + "/" + beanDesc.getTargetPackage() + "/" + "service/" + targetFile;
			}
			
			File file = new File(fileName);				
			if(file.exists()){
				fileName = fileName + ".temp";
			}
			
			PrintWriter writer = null;
			writer = new PrintWriter(new File(fileName));

			template4service.merge(context, writer);

			writer.flush();
			writer.close();

		} catch(Exception e) {
			e.printStackTrace();
		}

	}
	
	public static void generate4sql(List<BeanDesc> beanDescList) {

		VelocityContext context = new VelocityContext();
		
		BeanDescList beanList = new BeanDescList(beanDescList);
		context.put("beanDescList", beanList);

		try {
			PrintWriter writer = null;
			writer = new PrintWriter(new File("src_output/" + "CodeGen.java"));

			template4sql.merge(context, writer);

			writer.flush();
			writer.close();

		} catch(Exception e) {
			e.printStackTrace();
		}

	}
	
	public static void generate4xml(BeanDesc beanDesc) {

		VelocityContext context = new VelocityContext();

		context.put("beanDesc", beanDesc);
		
		String targetFile = "xml" + beanDesc.getTargetClassName() + "List.ftl";
		
		String fileName = null;

		try {
			File dirFile = new File("WebContent/WEB-INF/views/" + beanDesc.getLowercaseTargetClassName() + "/");
			if (!dirFile.exists()) {
				dirFile.mkdir();
			}
			fileName = "WebContent/WEB-INF/views/" + beanDesc.getLowercaseTargetClassName() + "/" + targetFile;
			
			File file = new File(fileName);				
			if(file.exists()){
				fileName = fileName + ".temp";
			}
			
			PrintWriter writer = null;
			writer = new PrintWriter(new File(fileName));

			template4xml.merge(context, writer);

			writer.flush();
			writer.close();

		} catch(Exception e) {
			e.printStackTrace();
		}

	}
	
	public static void generate4detail(BeanDesc beanDesc) {

		VelocityContext context = new VelocityContext();

		context.put("beanDesc", beanDesc);
		
		String targetFile = beanDesc.getLowercaseTargetClassName() + "Detail.ftl";
		
		String fileName = null;

		try {
			fileName = "WebContent/WEB-INF/views/" + beanDesc.getLowercaseTargetClassName() + "/" + targetFile;
			
			File file = new File(fileName);				
			if(file.exists()){
				fileName = fileName + ".temp";
			}
			
			PrintWriter writer = null;
			writer = new PrintWriter(new File(fileName));

			template4detail.merge(context, writer);

			writer.flush();
			writer.close();

		} catch(Exception e) {
			e.printStackTrace();
		}

	}
	
	public static void generate4list(BeanDesc beanDesc) {

		VelocityContext context = new VelocityContext();

		context.put("beanDesc", beanDesc);
		
		String targetFile = beanDesc.getLowercaseTargetClassName() + "List.ftl";
		
		String fileName = null;

		try {
			fileName = "WebContent/WEB-INF/views/" + beanDesc.getLowercaseTargetClassName() + "/" + targetFile;
			
			File file = new File(fileName);				
			if(file.exists()){
				fileName = fileName + ".temp";
			}
			
			PrintWriter writer = null;
			writer = new PrintWriter(new File(fileName));

			template4list.merge(context, writer);

			writer.flush();
			writer.close();

		} catch(Exception e) {
			e.printStackTrace();
		}

	}

	public static void generate4Validate(BeanDesc beanDesc) {
		VelocityContext context = new VelocityContext();

		context.put("beanDesc", beanDesc);
		
		String targetFile = beanDesc.getLowercaseTargetClassName() + "Validate.ftl";
		
		String fileName = null;

		try {
			fileName = "WebContent/WEB-INF/views/" + beanDesc.getLowercaseTargetClassName() + "/" + targetFile;
			
			File file = new File(fileName);				
			if(file.exists()){
				fileName = fileName + ".temp";
			}
			
			PrintWriter writer = null;
			writer = new PrintWriter(new File(fileName));

			template4Validate.merge(context, writer);

			writer.flush();
			writer.close();

		} catch(Exception e) {
			e.printStackTrace();
		}
		
	}

	public static void generate4Upload(BeanDesc beanDesc) {
		VelocityContext context = new VelocityContext();

		context.put("beanDesc", beanDesc);
		
		String targetFile = beanDesc.getLowercaseTargetClassName() + "Upload.ftl";
		
		String fileName = null;

		try {
			fileName = "WebContent/WEB-INF/views/" + beanDesc.getLowercaseTargetClassName() + "/" + targetFile;
			
			File file = new File(fileName);				
			if(file.exists()){
				fileName = fileName + ".temp";
			}
			
			PrintWriter writer = null;
			writer = new PrintWriter(new File(fileName));

			template4Upload.merge(context, writer);

			writer.flush();
			writer.close();

		} catch(Exception e) {
			e.printStackTrace();
		}
		
	}
			
}

