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
import com.cicc.gbo.oms.model.Order;


@Controller
@RequestMapping(value = "/order")
public class OrderController extends BaseController {

    public static Logger log = LoggerFactory.getLogger(OrderController.class);
     
	@Autowired
	AuditableBaseService orderService;
	
	@Autowired
	DataDictionaryService dataDictionaryService;
			
	@RequestMapping(method = RequestMethod.GET, value = "list")
	public String listOrder(HttpServletRequest request, Model model) throws Exception {
		readGridSetting(request, model);
		clearComparatorList();
		addWebAttributes(model);
		return "order/orderList";
	}
	
	@RequestMapping(method = RequestMethod.GET, value = "load")
	public String loadOrder(HttpServletRequest request, @ModelAttribute("order") Order order, Model model) throws Exception {
		List<Order> orderList = orderService.listByExample(Order.class, order, initJqgridPagination(request, model));
		
		model.addAttribute("entityList", orderList);				
		model.addAttribute("actionPagination", getActionPagination(request, model));
		return "order/xmlOrderList";
	}
	
	@RequestMapping(method = RequestMethod.POST, value = "create")
	public String createOrder(HttpServletRequest request, Model model) {
		model.addAttribute("order", new Order());
		addWebAttributes(model);
		return "order/orderDetail";
	}
	
	@RequestMapping(method = RequestMethod.POST, value = "read/{id}")
	public String readOrder(HttpServletRequest request, @PathVariable("id") Long id, Model model) {
		model.addAttribute("order", orderService.read(Order.class, id));
		addWebAttributes(model);
		return "order/orderDetail";
	}
	
	@RequestMapping(method = RequestMethod.POST, value = "update")
	public void updateOrder(HttpServletResponse response, @ModelAttribute("order") Order order, Model model) throws Exception {
		try{		
			Long id = order.getEntityId();
			if(id == null) {
				orderService.create(order);
			} else {
				orderService.update(order);
			}
		}catch(Exception e){
			log.error(e.getMessage(), e);
			response.getOutputStream().write(e.getMessage().getBytes("utf-8"));
		}
	}
	
	@RequestMapping(method = RequestMethod.POST, value = "delete/{id}")
	@ResponseBody
	public void deleteOrder(HttpServletResponse response, @PathVariable("id") String ids) throws Exception {
		String[]idArray = ids.split(",");
		for(String idStr : idArray){
			Long id = Long.valueOf(idStr);
			try{
				orderService.delete(Order.class, id);
				response.getOutputStream().write(("[id:"  + idStr + "] Deleted Successfully!\n").getBytes("utf-8"));
			}catch(Exception e){
				log.error(e.getMessage(), e);
				response.getOutputStream().write(("Meet error when delete id:" + idStr + "--- " + e.getMessage() + "\n").getBytes("utf-8"));
			}
		}
	}
	
	@ModelAttribute
	public void getOrder(@RequestParam(value = "id", defaultValue = "-1") Long id, Model model) {
		if (id != -1) {
			model.addAttribute("order", orderService.read(Order.class, id));
		}
	}
	
	private void addWebAttributes(Model model) {
	}
	
	public String list(Model model){
		addWebAttributes(model);
		return "order/orderList";
	}

}
