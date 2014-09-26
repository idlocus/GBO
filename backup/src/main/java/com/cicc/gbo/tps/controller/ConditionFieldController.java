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
import com.cicc.gbo.tps.model.ConditionField;


@Controller
@RequestMapping(value = "/conditionField")
public class ConditionFieldController extends BaseController {

    public static Logger log = LoggerFactory.getLogger(ConditionFieldController.class);
     
	@Autowired
	AuditableBaseService conditionFieldService;
	
	@Autowired
	DataDictionaryService dataDictionaryService;
			
	@RequestMapping(method = RequestMethod.GET, value = "list")
	public String listConditionField(HttpServletRequest request, Model model) throws Exception {
		readGridSetting(request, model);
		clearComparatorList();
		addWebAttributes(model);
		return "conditionField/conditionFieldList";
	}
	
	@RequestMapping(method = RequestMethod.GET, value = "load")
	public String loadConditionField(HttpServletRequest request, @ModelAttribute("conditionField") ConditionField conditionField, Model model) throws Exception {
		List<ConditionField> conditionFieldList = conditionFieldService.listByExample(ConditionField.class, conditionField, initJqgridPagination(request, model));
		
		model.addAttribute("entityList", conditionFieldList);				
		model.addAttribute("actionPagination", getActionPagination(request, model));
		return "conditionField/xmlConditionFieldList";
	}
	
	@RequestMapping(method = RequestMethod.POST, value = "create")
	public String createConditionField(HttpServletRequest request, Model model) {
		model.addAttribute("conditionField", new ConditionField());
		addWebAttributes(model);
		return "conditionField/conditionFieldDetail";
	}
	
	@RequestMapping(method = RequestMethod.POST, value = "read/{id}")
	public String readConditionField(HttpServletRequest request, @PathVariable("id") Long id, Model model) {
		model.addAttribute("conditionField", conditionFieldService.read(ConditionField.class, id));
		addWebAttributes(model);
		return "conditionField/conditionFieldDetail";
	}
	
	@RequestMapping(method = RequestMethod.POST, value = "update")
	public void updateConditionField(HttpServletResponse response, @ModelAttribute("conditionField") ConditionField conditionField, Model model) throws Exception {
		try{		
			Long id = conditionField.getEntityId();
			if(id == null) {
				conditionFieldService.create(conditionField);
			} else {
				conditionFieldService.update(conditionField);
			}
		}catch(Exception e){
			log.error(e.getMessage(), e);
			response.getOutputStream().write(e.getMessage().getBytes("utf-8"));
		}
	}
	
	@RequestMapping(method = RequestMethod.POST, value = "delete/{id}")
	@ResponseBody
	public void deleteConditionField(HttpServletResponse response, @PathVariable("id") String ids) throws Exception {
		String[]idArray = ids.split(",");
		for(String idStr : idArray){
			Long id = Long.valueOf(idStr);
			try{
				conditionFieldService.delete(ConditionField.class, id);
				response.getOutputStream().write(("[id:"  + idStr + "] Deleted Successfully!\n").getBytes("utf-8"));
			}catch(Exception e){
				log.error(e.getMessage(), e);
				response.getOutputStream().write(("Meet error when delete id:" + idStr + "--- " + e.getMessage() + "\n").getBytes("utf-8"));
			}
		}
	}
	
	@ModelAttribute
	public void getConditionField(@RequestParam(value = "id", defaultValue = "-1") Long id, Model model) {
		if (id != -1) {
			model.addAttribute("conditionField", conditionFieldService.read(ConditionField.class, id));
		}
	}
	
	private void addWebAttributes(Model model) {
	}
	
	public String list(Model model){
		addWebAttributes(model);
		return "conditionField/conditionFieldList";
	}

}
