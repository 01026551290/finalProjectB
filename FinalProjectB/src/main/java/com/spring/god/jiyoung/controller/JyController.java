package com.spring.god.jiyoung.controller;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@Component
public class JyController {
	@RequestMapping(value="/register.go", method= {RequestMethod.GET})
	public ModelAndView register(ModelAndView mv) {
		
		mv.setViewName("member/register.tiles1");
		return mv;
	}
}
