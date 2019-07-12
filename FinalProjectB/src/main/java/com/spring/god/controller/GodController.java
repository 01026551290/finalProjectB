package com.spring.god.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Component
@Controller
public class GodController {

	@Autowired	// Type에 따라 알아서 Bean 을 주입해준다.
//	private InterBoardService service;
	
	@RequestMapping(value="/index.go", method= {RequestMethod.GET})
	public String index() {
		
		return "main/index.tiles1";
	}
	
}
