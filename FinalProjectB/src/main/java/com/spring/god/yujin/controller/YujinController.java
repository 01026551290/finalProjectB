package com.spring.god.yujin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Component
@Controller
public class YujinController {
	@Autowired	
	
	@RequestMapping(value="/search.go", method= {RequestMethod.GET})
	public String roomSearch() {
		
		return "room/roomSearch.tiles1";
	}
	
	
}
