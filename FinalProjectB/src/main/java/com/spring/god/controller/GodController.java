package com.spring.god.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.spring.god.bora.model.HotelRoomVO;
import com.spring.god.bora.service.InterHotelRoomService;


@Component
@Controller
public class GodController {

	@Autowired
	private InterHotelRoomService service;
	
	// === 메인에 숙소보여주기(최신숙소) ===
	@RequestMapping(value="/index.go", method= {RequestMethod.GET})
	public ModelAndView accommodationList(HttpServletRequest request, ModelAndView mv) {
		
		List<HotelRoomVO> hotelList = service.getlist();
		
		mv.addObject("hotelList", hotelList);
		mv.setViewName("main/index.tiles1");
		return mv;
	}
	
}
