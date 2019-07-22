package com.spring.god.bora.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class BoraController {

	////////////////////////////////////////////////////////////////////////////////////////////
	// 날씨 XML
	@RequestMapping(value="/weatherXML.go", method= {RequestMethod.GET})
	public String weatherXML() {
		// XML만(정보) 보여주기 때문에 tiles 사용하지 않아도 됨 
		return "tiles1/bora/xml/weatherXML";
		//	/FinalProjectB/src/main/webapp/WEB-INF/views/tiles1/bora/xml/weatherXML.jsp 파일을 생성한다.
	}
	
	
}
