package com.spring.god.taehee.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class TaeheeDatailController {



//		@Autowired	// Type에 따라 알아서 Bean 을 주입해준다.
//		private InterBoardService service;
		
		
		@RequestMapping(value="/product.go", method= {RequestMethod.GET})
		public ModelAndView product(ModelAndView mv) {
			
			mv.setViewName("taehee/THdetailP.tiles1");
			return mv;
	
	}

}
