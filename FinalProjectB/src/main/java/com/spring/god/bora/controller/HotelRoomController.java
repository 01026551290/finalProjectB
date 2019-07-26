package com.spring.god.bora.controller;

import java.util.HashMap;
import java.util.List;

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

import com.spring.god.bora.model.HotelRoomVO;
import com.spring.god.bora.service.InterHotelRoomService;

@Component
@Controller
public class HotelRoomController {
	
	@Autowired
	private InterHotelRoomService service;

	// === 검색어 입력시 자동글 완성하기 3 ===
	@RequestMapping(value="autosearch/wordSearchView.go", method= {RequestMethod.GET}, produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String wordSearchShow(HttpServletRequest request) {
		
		String searchWord = request.getParameter("searchWord");
		
		List<String> wordNameList = null;
		List<String> wordAddrList = null;
		
		if(searchWord!="") {
			wordNameList = service.wordNameSearchView(searchWord);
			wordAddrList = service.wordAddrSearchView(searchWord);
		}
		
		JSONArray jsonArr = new JSONArray();

		if(wordNameList != null) {
			for(String name : wordNameList) {
				JSONObject jsonObj = new JSONObject();
				jsonObj.put("name", name);
				
				jsonArr.put(jsonObj);
			}
		}

		if(wordAddrList != null) {
			for(String addr : wordAddrList) {
				JSONObject jsonObj = new JSONObject();
				jsonObj.put("addr", addr);
				
				jsonArr.put(jsonObj);
			}
		}
		String result = jsonArr.toString();
		
		return result;
	}
		
	// === 숙소보여주기(최신숙소) === 
	@RequestMapping(value="view/accommodationList.go", method= {RequestMethod.GET})
	public ModelAndView accommodationList(HttpServletRequest request, ModelAndView mv) {
		
		
		List<HotelRoomVO> hotelList = service.getlist();
		
		mv.addObject("hotelList", hotelList);
		mv.setViewName("board/accomodation.tiles1");
		
		return mv;
	}
	
	
	// === 결제 전 페이지 ===
	@RequestMapping(value="/accommodationInfo.go", method= {RequestMethod.GET})
	public String accommodationInfo() {
		return "bora/accomodationInfo.tiles1";
	}
	
	
}
