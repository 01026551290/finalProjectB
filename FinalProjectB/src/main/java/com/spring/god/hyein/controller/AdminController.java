package com.spring.god.hyein.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.spring.god.hyein.model.HotelRoomVO;
import com.spring.god.hyein.service.InterAdminService;

@Controller
public class AdminController {

	@Autowired 
	private InterAdminService service;
	
	@RequestMapping(value="/roomrg.go", method={RequestMethod.GET} )
	public ModelAndView roomRegistration(ModelAndView mv) {
		
		mv.setViewName("hyein/roomRg/roomrg.tiles1");
		
		return mv;
	}
	
	/*
	@RequestMapping(value="/roomrgEnd.go", method={RequestMethod.GET} )
	public ModelAndView roomRegistrationEnd(HttpServletRequest request, ModelAndView mv) {
		
		
		mv.setViewName("hyein/roomRg/roomrg2.tiles1");
		
		return mv;
	}
	*/
	
	@RequestMapping(value="/roomrgEnd.go", method={RequestMethod.GET} )
	public ModelAndView roomRegistrationEnd(HttpServletRequest request, HotelRoomVO hotelroomvo, ModelAndView mv) {
		
		System.out.println(hotelroomvo.getLseq());
		System.out.println(hotelroomvo.getName());
		System.out.println(hotelroomvo.getBusinessTel());
		System.out.println(hotelroomvo.getAddress());
		System.out.println(hotelroomvo.getInfo());
		System.out.println(hotelroomvo.getOntionType());
		System.out.println(hotelroomvo.getImg());
		
/*		int n = service.hotelAdd(hotelroomvo);
		
		mv.addObject("n", n);*/
		mv.setViewName("hyein/roomRg/roomrgEnd.tiles1");
		
		return mv;
		
	}
	
	
	@RequestMapping(value="/roomrg2.go", method={RequestMethod.GET} )
	public ModelAndView roomRegistration2(ModelAndView mv) {
		
		mv.setViewName("hyein/roomRg/roomrg2.tiles1");
		
		return mv;
	}
}
