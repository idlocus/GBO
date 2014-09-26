package com.cicc.gaf.sample.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.cicc.gaf.logger.Logger;
import com.cicc.gaf.logger.LoggerFactory;
import com.cicc.gaf.logon.LogonStatus;
import com.cicc.gaf.logon.UserLogonInfo;
import com.cicc.gaf.logon.service.LogonService;
import com.cicc.gaf.menu.UserMenu;
import com.cicc.gaf.privileges.UserPrivileges;
import com.cicc.gaf.privileges.service.UserPrivilegesService;
import com.cicc.gaf.shared.GafRequest;
import com.cicc.gaf.shared.Constants;

@RestController
public class AccountController {

	public static Logger log = LoggerFactory.getLogger(AccountController.class);

	@Autowired
	LogonService logonService;
	
	@Autowired
	UserPrivileges userPrivileges;
	
	@Autowired
	UserMenu userMenu;
	
	@Autowired
	UserPrivilegesService userPrivilegesService;

	
	
	@RequestMapping(method = RequestMethod.GET, value = "/acount/statement")
	public ModelAndView sample2() {
		ModelAndView mav = new ModelAndView();
        mav.setViewName("sample/account");
        return mav;
	}
	
	@RequestMapping(method = RequestMethod.GET, value = "/acount/confirmation")
	public ModelAndView sample3() {
		ModelAndView mav = new ModelAndView();
        mav.setViewName("sample/account");
        return mav;
	}
	@RequestMapping(method = RequestMethod.GET, value = "/acount")
	public ModelAndView sample1() {
		ModelAndView mav = new ModelAndView();
        mav.setViewName("sample/account");
        return mav;
	}

}
