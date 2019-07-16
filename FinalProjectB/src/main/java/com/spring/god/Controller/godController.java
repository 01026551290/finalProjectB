package com.spring.god.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class godController {

	@RequestMapping(value="/home.go", method= {RequestMethod.GET})
	public ModelAndView home(ModelAndView mv) {
		
		
		mv.setViewName("main/index.tiles1");
		
		return mv;
	}
	
}
