package com.cicc.gbo.tps.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cicc.gaf.controller.BaseController;
import com.cicc.gaf.datadictionary.service.DataDictionaryService;
import com.cicc.gaf.logger.Logger;
import com.cicc.gaf.logger.LoggerFactory;
import com.cicc.gbo.core.service.AuditableBaseService;
import com.cicc.gbo.tps.model.TransactionConditionTemplate;


@Controller
@RequestMapping(value = "/transactionConditionTemplate")
public class TransactionConditionTemplateController extends BaseController {

    public static Logger log = LoggerFactory.getLogger(TransactionConditionTemplateController.class);
     
	@Autowired
	AuditableBaseService transactionConditionTemplateService;
	
	@Autowired
	DataDictionaryService dataDictionaryService;
			
	@RequestMapping(method = RequestMethod.GET, value = "list")
	public String listTransactionConditionTemplate(HttpServletRequest request, Model model) throws Exception {
		readGridSetting(request, model);
		clearComparatorList();
		addWebAttributes(model);
		return "transactionConditionTemplate/transactionConditionTemplateList";
	}
	
	@RequestMapping(method = RequestMethod.GET, value = "load")
	public String loadTransactionConditionTemplate(HttpServletRequest request, @ModelAttribute("transactionConditionTemplate") TransactionConditionTemplate transactionConditionTemplate, Model model) throws Exception {
		List<TransactionConditionTemplate> transactionConditionTemplateList = transactionConditionTemplateService.listByExample(TransactionConditionTemplate.class, transactionConditionTemplate, initJqgridPagination(request, model));
		
		model.addAttribute("entityList", transactionConditionTemplateList);				
		model.addAttribute("actionPagination", getActionPagination(request, model));
		return "transactionConditionTemplate/xmlTransactionConditionTemplateList";
	}
	
	@RequestMapping(method = RequestMethod.POST, value = "create")
	public String createTransactionConditionTemplate(HttpServletRequest request, Model model) {
		model.addAttribute("transactionConditionTemplate", new TransactionConditionTemplate());
		addWebAttributes(model);
		return "transactionConditionTemplate/transactionConditionTemplateDetail";
	}
	
	@RequestMapping(method = RequestMethod.POST, value = "read/{id}")
	public String readTransactionConditionTemplate(HttpServletRequest request, @PathVariable("id") Long id, Model model) {
		model.addAttribute("transactionConditionTemplate", transactionConditionTemplateService.read(TransactionConditionTemplate.class, id));
		addWebAttributes(model);
		return "transactionConditionTemplate/transactionConditionTemplateDetail";
	}
	
	@RequestMapping(method = RequestMethod.POST, value = "update")
	public void updateTransactionConditionTemplate(HttpServletResponse response, @ModelAttribute("transactionConditionTemplate") TransactionConditionTemplate transactionConditionTemplate, Model model) throws Exception {
		try{		
			Long id = transactionConditionTemplate.getEntityId();
			if(id == null) {
				transactionConditionTemplateService.create(transactionConditionTemplate);
			} else {
				transactionConditionTemplateService.update(transactionConditionTemplate);
			}
		}catch(Exception e){
			log.error(e.getMessage(), e);
			response.getOutputStream().write(e.getMessage().getBytes("utf-8"));
		}
	}
	
	@RequestMapping(method = RequestMethod.POST, value = "delete/{id}")
	@ResponseBody
	public void deleteTransactionConditionTemplate(HttpServletResponse response, @PathVariable("id") String ids) throws Exception {
		String[]idArray = ids.split(",");
		for(String idStr : idArray){
			Long id = Long.valueOf(idStr);
			try{
				transactionConditionTemplateService.delete(TransactionConditionTemplate.class, id);
				response.getOutputStream().write(("[id:"  + idStr + "] Deleted Successfully!\n").getBytes("utf-8"));
			}catch(Exception e){
				log.error(e.getMessage(), e);
				response.getOutputStream().write(("Meet error when delete id:" + idStr + "--- " + e.getMessage() + "\n").getBytes("utf-8"));
			}
		}
	}
	
	@ModelAttribute
	public void getTransactionConditionTemplate(@RequestParam(value = "id", defaultValue = "-1") Long id, Model model) {
		if (id != -1) {
			model.addAttribute("transactionConditionTemplate", transactionConditionTemplateService.read(TransactionConditionTemplate.class, id));
		}
	}
	
	private void addWebAttributes(Model model) {
	}
	
	public String list(Model model){
		addWebAttributes(model);
		return "transactionConditionTemplate/transactionConditionTemplateList";
	}

}
