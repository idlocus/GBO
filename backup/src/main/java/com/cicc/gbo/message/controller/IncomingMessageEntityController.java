package com.cicc.gbo.message.controller;

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
import com.cicc.gbo.core.service.NonAuditableBaseService;
import com.cicc.gbo.message.model.IncomingMessageEntity;


@Controller
@RequestMapping(value = "/incomingMessageEntity")
public class IncomingMessageEntityController extends BaseController {

    public static Logger log = LoggerFactory.getLogger(IncomingMessageEntityController.class);
     
	@Autowired
	NonAuditableBaseService incomingMessageEntityService;
	
	@Autowired
	DataDictionaryService dataDictionaryService;
			
	@RequestMapping(method = RequestMethod.GET, value = "list")
	public String listIncomingMessageEntity(HttpServletRequest request, Model model) throws Exception {
		readGridSetting(request, model);
		clearComparatorList();
		addWebAttributes(model);
		return "incomingMessageEntity/incomingMessageEntityList";
	}
	
	@RequestMapping(method = RequestMethod.GET, value = "load")
	public String loadIncomingMessageEntity(HttpServletRequest request, @ModelAttribute("incomingMessageEntity") IncomingMessageEntity incomingMessageEntity, Model model) throws Exception {
		List<IncomingMessageEntity> incomingMessageEntityList = incomingMessageEntityService.listByExample(IncomingMessageEntity.class, incomingMessageEntity, initJqgridPagination(request, model));
		
		model.addAttribute("entityList", incomingMessageEntityList);				
		model.addAttribute("actionPagination", getActionPagination(request, model));
		return "incomingMessageEntity/xmlIncomingMessageEntityList";
	}
	
	@RequestMapping(method = RequestMethod.POST, value = "create")
	public String createIncomingMessageEntity(HttpServletRequest request, Model model) {
		model.addAttribute("incomingMessageEntity", new IncomingMessageEntity());
		addWebAttributes(model);
		return "incomingMessageEntity/incomingMessageEntityDetail";
	}
	
	@RequestMapping(method = RequestMethod.POST, value = "read/{id}")
	public String readIncomingMessageEntity(HttpServletRequest request, @PathVariable("id") Long id, Model model) {
		model.addAttribute("incomingMessageEntity", incomingMessageEntityService.read(IncomingMessageEntity.class, id));
		addWebAttributes(model);
		return "incomingMessageEntity/incomingMessageEntityDetail";
	}
	
	@RequestMapping(method = RequestMethod.POST, value = "update")
	public void updateIncomingMessageEntity(HttpServletResponse response, @ModelAttribute("incomingMessageEntity") IncomingMessageEntity incomingMessageEntity, Model model) throws Exception {
		try{		
			Long id = incomingMessageEntity.getEntityId();
			if(id == null) {
				incomingMessageEntityService.create(incomingMessageEntity);
			} else {
				incomingMessageEntityService.update(incomingMessageEntity);
			}
		}catch(Exception e){
			log.error(e.getMessage(), e);
			response.getOutputStream().write(e.getMessage().getBytes("utf-8"));
		}
	}
	
	@RequestMapping(method = RequestMethod.POST, value = "delete/{id}")
	@ResponseBody
	public void deleteIncomingMessageEntity(HttpServletResponse response, @PathVariable("id") String ids) throws Exception {
		String[]idArray = ids.split(",");
		for(String idStr : idArray){
			Long id = Long.valueOf(idStr);
			try{
				incomingMessageEntityService.delete(IncomingMessageEntity.class, id);
				response.getOutputStream().write(("[id:"  + idStr + "] Deleted Successfully!\n").getBytes("utf-8"));
			}catch(Exception e){
				log.error(e.getMessage(), e);
				response.getOutputStream().write(("Meet error when delete id:" + idStr + "--- " + e.getMessage() + "\n").getBytes("utf-8"));
			}
		}
	}
	
	@ModelAttribute
	public void getIncomingMessageEntity(@RequestParam(value = "id", defaultValue = "-1") Long id, Model model) {
		if (id != -1) {
			model.addAttribute("incomingMessageEntity", incomingMessageEntityService.read(IncomingMessageEntity.class, id));
		}
	}
	
	private void addWebAttributes(Model model) {
	}
	
	public String list(Model model){
		addWebAttributes(model);
		return "incomingMessageEntity/incomingMessageEntityList";
	}

}
