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
import com.cicc.gbo.tps.model.TradeTemplate;


@Controller
@RequestMapping(value = "/tradeTemplate")
public class TradeTemplateController extends BaseController {

    public static Logger log = LoggerFactory.getLogger(TradeTemplateController.class);
     
	@Autowired
	AuditableBaseService tradeTemplateService;
	
	@Autowired
	DataDictionaryService dataDictionaryService;
			
	@RequestMapping(method = RequestMethod.GET, value = "list")
	public String listTradeTemplate(HttpServletRequest request, Model model) throws Exception {
		readGridSetting(request, model);
		clearComparatorList();
		addWebAttributes(model);
		return "tradeTemplate/tradeTemplateList";
	}
	
	@RequestMapping(method = RequestMethod.GET, value = "load")
	public String loadTradeTemplate(HttpServletRequest request, @ModelAttribute("tradeTemplate") TradeTemplate tradeTemplate, Model model) throws Exception {
		List<TradeTemplate> tradeTemplateList = tradeTemplateService.listByExample(TradeTemplate.class, tradeTemplate, initJqgridPagination(request, model));
		
		model.addAttribute("entityList", tradeTemplateList);				
		model.addAttribute("actionPagination", getActionPagination(request, model));
		return "tradeTemplate/xmlTradeTemplateList";
	}
	
	@RequestMapping(method = RequestMethod.POST, value = "create")
	public String createTradeTemplate(HttpServletRequest request, Model model) {
		model.addAttribute("tradeTemplate", new TradeTemplate());
		addWebAttributes(model);
		return "tradeTemplate/tradeTemplateDetail";
	}
	
	@RequestMapping(method = RequestMethod.POST, value = "read/{id}")
	public String readTradeTemplate(HttpServletRequest request, @PathVariable("id") Long id, Model model) {
		model.addAttribute("tradeTemplate", tradeTemplateService.read(TradeTemplate.class, id));
		addWebAttributes(model);
		return "tradeTemplate/tradeTemplateDetail";
	}
	
	@RequestMapping(method = RequestMethod.POST, value = "update")
	public void updateTradeTemplate(HttpServletResponse response, @ModelAttribute("tradeTemplate") TradeTemplate tradeTemplate, Model model) throws Exception {
		try{		
			Long id = tradeTemplate.getEntityId();
			if(id == null) {
				tradeTemplateService.create(tradeTemplate);
			} else {
				tradeTemplateService.update(tradeTemplate);
			}
		}catch(Exception e){
			log.error(e.getMessage(), e);
			response.getOutputStream().write(e.getMessage().getBytes("utf-8"));
		}
	}
	
	@RequestMapping(method = RequestMethod.POST, value = "delete/{id}")
	@ResponseBody
	public void deleteTradeTemplate(HttpServletResponse response, @PathVariable("id") String ids) throws Exception {
		String[]idArray = ids.split(",");
		for(String idStr : idArray){
			Long id = Long.valueOf(idStr);
			try{
				tradeTemplateService.delete(TradeTemplate.class, id);
				response.getOutputStream().write(("[id:"  + idStr + "] Deleted Successfully!\n").getBytes("utf-8"));
			}catch(Exception e){
				log.error(e.getMessage(), e);
				response.getOutputStream().write(("Meet error when delete id:" + idStr + "--- " + e.getMessage() + "\n").getBytes("utf-8"));
			}
		}
	}
	
	@ModelAttribute
	public void getTradeTemplate(@RequestParam(value = "id", defaultValue = "-1") Long id, Model model) {
		if (id != -1) {
			model.addAttribute("tradeTemplate", tradeTemplateService.read(TradeTemplate.class, id));
		}
	}
	
	private void addWebAttributes(Model model) {
	}
	
	public String list(Model model){
		addWebAttributes(model);
		return "tradeTemplate/tradeTemplateList";
	}

}
