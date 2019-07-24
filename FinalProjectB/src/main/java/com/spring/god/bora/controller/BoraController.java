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

import com.spring.god.bora.service.InterBoraService;

@Component
@Controller
public class BoraController {
	
	@Autowired
	private InterBoraService service;

	////////////////////////////////////////////////////////////////////////////////////////////
	// 날씨 XML
	@RequestMapping(value="/weatherXML.go", method= {RequestMethod.GET})
	public String weatherXML() {
		// XML만(정보) 보여주기 때문에 tiles 사용하지 않아도 됨 
		return "tiles1/bora/xml/weatherXML";
		//	/FinalProjectB/src/main/webapp/WEB-INF/views/tiles1/bora/xml/weatherXML.jsp 파일을 생성한다.
	}
	
	// === 검색어 입력시 자동글 완성하기 3 ===
	@RequestMapping(value="/wordSearchView.go", method= {RequestMethod.GET}, produces="text/plain;charset=UTF-8")
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
	
	
}
