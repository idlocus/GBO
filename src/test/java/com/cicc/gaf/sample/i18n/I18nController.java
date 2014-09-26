package com.cicc.gaf.sample.i18n;
 
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;

/*
 * example:http://localhost:8080/gaf/app/change
 */

@Controller
public class I18nController{
	
	@RequestMapping("/change")
	public ModelAndView changeLang(HttpServletRequest request,
            HttpServletResponse response){
        ModelAndView model = new ModelAndView("logon/index");
        return model;
	}
	
	@RequestMapping("/next")
	public ModelAndView nextLang(HttpServletRequest request,
            HttpServletResponse response){
        ModelAndView model = new ModelAndView("logon/next");
        return model;
	} 
}