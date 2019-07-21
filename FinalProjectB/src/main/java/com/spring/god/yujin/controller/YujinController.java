package com.spring.god.yujin.controller;

import java.util.List;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


import com.spring.god.yujin.service.InterYujinService;

@Component
@Controller
public class YujinController {
	@Autowired	
	private InterYujinService service;
	
	
	@RequestMapping(value="/search.go", method= {RequestMethod.GET})
	public ModelAndView roomSearch(ServletRequest request,ModelAndView mv) {

		String searchWord = request.getParameter("searchWord");
		String CHECKIN = request.getParameter("CHECKIN");
		String CHECKOUT = request.getParameter("CHECKOUT");
		String adult = request.getParameter("adult");
		String children = request.getParameter("children");
		int per = 2;
		try {
			per = Integer.parseInt(adult)+(Integer.parseInt(children)/2);
		} catch (NumberFormatException e) {
		}
		
		
		mv.setViewName("room/roomSearch.tiles1");

		return mv;
	}
	
	@RequestMapping(value="/searchRoomMap.go", method= {RequestMethod.GET}, produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String wordSearchShow(HttpServletRequest request) {
		
		   List<String> list = service.searchRoom();
		   
		   JSONArray jsonArr = new JSONArray();
		   
		   if(list != null) {
			   for(String addr : list) {
				   JSONObject jsonObj = new JSONObject();
				   jsonObj.put("addr", addr);
				   jsonArr.put(jsonObj);
			   }
		   }
		   
		   String result = jsonArr.toString();
		   
		   return result;
	   }
	
	
}
