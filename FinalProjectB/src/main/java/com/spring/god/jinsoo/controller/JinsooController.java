package com.spring.god.jinsoo.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.spring.god.jinsoo.model.JinsooadminVO;
import com.spring.god.jinsoo.service.InterJinsooService;


@Controller
public class JinsooController {
	
	@Autowired
	private InterJinsooService service;
	
	// 관리자 로그인페이지 만들기
	@RequestMapping(value="/adminLogin.go", method= {RequestMethod.GET} )
	public ModelAndView adminLogin(ModelAndView mv) {
		
		mv.setViewName("tiles1/jinsoo/manager/adminLogin");
		
		return mv;
	}
	// 관리자 로그인하기
	@RequestMapping(value="/adminLoginEnd.go", method= {RequestMethod.POST} )
	public ModelAndView adminLoginEnd(ModelAndView mv, HttpServletRequest request) {
		
		String seq = request.getParameter("seq");
		String pwd = request.getParameter("pwd");				
		
		HashMap<String,String> adminmap = new HashMap<String,String>();
		adminmap.put("seq", seq);
		adminmap.put("pwd", pwd);				
		
		JinsooadminVO adminvo = service.adminLogin(adminmap);
		
		HttpSession session = request.getSession();
		
			if(adminvo == null) {
			
			String msg = "아이디 또는 암호가 틀립니다.";
			String loc = "javascript:history.back()";
			
			
			mv.addObject("msg", msg);
			mv.addObject("loc", loc);
			mv.setViewName("tiles1/jinsoo/msg");
			
			}
						
			else {
				
				session.setAttribute("adminvo", adminvo);
				String msg = "로그인 되었습니다.";
				String loc = request.getContextPath()+"/manager.go";
				
				
				mv.addObject("msg", msg);
				mv.addObject("loc", loc);
				mv.setViewName("tiles1/jinsoo/msg");
			}
		
		return mv;
	}
	// 관리자 페이지 띄우기
	@RequestMapping(value="/manager.go", method= {RequestMethod.GET} )
	public ModelAndView manager(ModelAndView mv) {
		
		mv.setViewName("jinsoo/manager/adminHome.tiles1");
		
		return mv;
	}
	
	// 차트:  성별 JSON으로 얻어오기
	@RequestMapping(value="/genderJSON.go", method= {RequestMethod.GET}  , produces="text/plain;charset=UTF-8" )
	@ResponseBody
	public String genderJSON() {
		
		// 성별 JSON으로 얻어오기
		List<HashMap<String,String>> genderList =  service.getGenderCntList();
		
		JsonArray jsonArr = new JsonArray();
		
		if(genderList != null) {
			for(HashMap<String,String> map :genderList) {
				JsonObject jsonObj = new JsonObject();
				jsonObj.addProperty("GENDER", map.get("GENDER"));
				jsonObj.addProperty("CNT", map.get("CNT"));
				jsonObj.addProperty("PERCNT", map.get("PERCNT"));
				
				jsonArr.add(jsonObj);
			}
			
		}

		
		return new Gson().toJson(jsonArr);
	}
	
}
