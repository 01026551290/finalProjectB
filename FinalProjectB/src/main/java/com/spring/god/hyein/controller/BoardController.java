package com.spring.god.hyein.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.spring.god.common.FileManager;
import com.spring.god.hyein.service.InterBoardService;

@Component
@Controller
public class BoardController {
	
	@Autowired   // Type에 따라 알아서 Bean 을 주입해준다.
	private InterBoardService service;
	
	@Autowired
	private FileManager fileManager;
	
	// === #57. 글목록 보기 페이지 요청 ===
	@RequestMapping(value="/noticeList.go", method= {RequestMethod.GET})
	public ModelAndView noticeList(HttpServletRequest request, ModelAndView mv) {


		mv.setViewName("hyein/board/notice.tiles1");
		
		return mv;
	}
	
}
