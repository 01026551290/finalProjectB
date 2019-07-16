package com.spring.god.jinsoo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class JinsooController {
	
	@RequestMapping(value="/manager.go", method= {RequestMethod.GET} )
	public ModelAndView manager(ModelAndView mv) {
		
		mv.setViewName("jinsoo/manager/adminHome.tiles1");
		
		return mv;
	}
	
}
