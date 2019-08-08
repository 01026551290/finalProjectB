package com.spring.god.bora.controller;

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

import com.spring.god.bora.model.HotelRoomVO;
import com.spring.god.bora.service.InterHotelRoomService;

@Component
@Controller
public class HotelRoomController {
	
	@Autowired
	private InterHotelRoomService service;

	// === 검색어 입력시 자동글 완성하기 3 ===
	@RequestMapping(value="/autosearch/wordSearchView.go", method= {RequestMethod.GET}, produces="text/plain;charset=UTF-8")
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
	
	// === 검색어 입력시 자동글 완성하기 4 ===
	@RequestMapping(value="/autosearch/wordSearchViewOnlyName.go", method= {RequestMethod.GET}, produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String wordSearchViewOnlyName(HttpServletRequest request) {
		
		String searchWord = request.getParameter("hotelName");
		
		List<String> wordNameList = null;
		
		if(searchWord!="") {
			wordNameList = service.wordNameSearchView(searchWord);
		}
		
		JSONArray jsonArr = new JSONArray();
		
		if(wordNameList != null) {
			for(String name : wordNameList) {
				JSONObject jsonObj = new JSONObject();
				jsonObj.put("name", name);
				
				jsonArr.put(jsonObj);
			}
		}
		String result = jsonArr.toString();
		
		return result;
	}
		
	
	// === 호텔조회수에 의한 실시간 검색어 ===
	@RequestMapping(value="/hotelViewsRealTime.go", method= {RequestMethod.GET}, produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String hotelViewsRealTime(HttpServletRequest request) {
		
		List<HotelRoomVO> hotelList = service.gethotelViewsRealTime();
		
		JSONArray jsonArr = new JSONArray();
		
		int cnt = 0;
		for(HotelRoomVO hotelRoomVO : hotelList) {
			cnt++;
			System.out.println(cnt);
			JSONObject jsonObj = new JSONObject();
			jsonObj.put("largecategoryontioncode", hotelRoomVO.getLargeCategoryontionCode());
			jsonObj.put("name", hotelRoomVO.getName());
			jsonObj.put("startcnt", hotelRoomVO.getstartcnt());
			
			jsonArr.put(jsonObj);
		}
		String result = jsonArr.toString();
		System.out.println(jsonArr);
		return result;
	}
	
}


















