package com.cicc.gbo.oms.controller;

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
import com.cicc.gbo.oms.model.Execution;


@Controller
@RequestMapping(value = "/execution")
public class ExecutionController extends BaseController {

    public static Logger log = LoggerFactory.getLogger(ExecutionController.class);
     
	@Autowired
	AuditableBaseService executionService;
	
	@Autowired
	DataDictionaryService dataDictionaryService;
			
	@RequestMapping(method = RequestMethod.GET, value = "list")
	public String listExecution(HttpServletRequest request, Model model) throws Exception {
		readGridSetting(request, model);
		clearComparatorList();
		addWebAttributes(model);
		return "execution/executionList";
	}
	
	@RequestMapping(method = RequestMethod.GET, value = "load")
	public String loadExecution(HttpServletRequest request, @ModelAttribute("execution") Execution execution, Model model) throws Exception {
		List<Execution> executionList = executionService.listByExample(Execution.class, execution, initJqgridPagination(request, model));
		
		model.addAttribute("entityList", executionList);				
		model.addAttribute("actionPagination", getActionPagination(request, model));
		return "execution/xmlExecutionList";
	}
	
	@RequestMapping(method = RequestMethod.POST, value = "create")
	public String createExecution(HttpServletRequest request, Model model) {
		model.addAttribute("execution", new Execution());
		addWebAttributes(model);
		return "execution/executionDetail";
	}
	
	@RequestMapping(method = RequestMethod.POST, value = "read/{id}")
	public String readExecution(HttpServletRequest request, @PathVariable("id") Long id, Model model) {
		model.addAttribute("execution", executionService.read(Execution.class, id));
		addWebAttributes(model);
		return "execution/executionDetail";
	}
	
	@RequestMapping(method = RequestMethod.POST, value = "update")
	public void updateExecution(HttpServletResponse response, @ModelAttribute("execution") Execution execution, Model model) throws Exception {
		try{		
			Long id = execution.getEntityId();
			if(id == null) {
				executionService.create(execution);
			} else {
				executionService.update(execution);
			}
		}catch(Exception e){
			log.error(e.getMessage(), e);
			response.getOutputStream().write(e.getMessage().getBytes("utf-8"));
		}
	}
	
	@RequestMapping(method = RequestMethod.POST, value = "delete/{id}")
	@ResponseBody
	public void deleteExecution(HttpServletResponse response, @PathVariable("id") String ids) throws Exception {
		String[]idArray = ids.split(",");
		for(String idStr : idArray){
			Long id = Long.valueOf(idStr);
			try{
				executionService.delete(Execution.class, id);
				response.getOutputStream().write(("[id:"  + idStr + "] Deleted Successfully!\n").getBytes("utf-8"));
			}catch(Exception e){
				log.error(e.getMessage(), e);
				response.getOutputStream().write(("Meet error when delete id:" + idStr + "--- " + e.getMessage() + "\n").getBytes("utf-8"));
			}
		}
	}
	
	@ModelAttribute
	public void getExecution(@RequestParam(value = "id", defaultValue = "-1") Long id, Model model) {
		if (id != -1) {
			model.addAttribute("execution", executionService.read(Execution.class, id));
		}
	}
	
	private void addWebAttributes(Model model) {
	}
	
	public String list(Model model){
		addWebAttributes(model);
		return "execution/executionList";
	}

}
