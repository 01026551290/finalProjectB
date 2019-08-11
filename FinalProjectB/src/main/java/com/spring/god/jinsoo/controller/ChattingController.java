package com.spring.god.jinsoo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

//=== #173. (웹채팅관련4) ===

@Controller
public class ChattingController {

	@RequestMapping(value="/admin_chatting.go", method= {RequestMethod.GET}) 
	public String multichat(HttpServletRequest request, HttpServletResponse response) { 
		
		return "tiles1/jinsoo/chatting/multichat";
	}
	
}




