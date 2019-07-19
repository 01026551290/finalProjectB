package com.spring.god.yujin.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Component
@Controller
public class YujinController {
	@Autowired	
	
	@RequestMapping(value="/search.go", method= {RequestMethod.GET})
	public String roomSearch(HttpServletRequest request) {
		return "room/roomSearch.tiles1";
	}
	
	@RequestMapping(value="/searchStoreMap.go", method= {RequestMethod.GET})
	public String roomSearchMap() {
		
		return "tiles1/room/storeGoogleMap";
	}
	
	@RequestMapping(value="/googleSearch.go", method= {RequestMethod.GET})
	public ModelAndView weatherXML(ModelAndView mv) {
		mv.addObject("searchWord","제주공항");
		mv.setViewName("xml/googleSearch");
		return mv;
	}
	
	
}
