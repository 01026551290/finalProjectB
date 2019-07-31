package com.spring.god.bora.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tools.ant.taskdefs.SubAnt;
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
import com.spring.god.jiyoung.model.MemberVO;

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
		
	// === 예약확인페이지 ===
	@RequestMapping(value="/accommodationInfo.go", method= {RequestMethod.GET})
	public ModelAndView LoginCK_accommodationInfo(HttpServletRequest request, HttpServletResponse response, ModelAndView mv) {
		
		HashMap<String, String> paraMap = new HashMap<String, String>();
		
		paraMap.put("img", "Hno.jpg");
		paraMap.put("name", "켄싱턴리조트 서귀포");
		paraMap.put("address", "제주특별자치도 서귀포시 강정동 이어도로 684".substring(8));
		paraMap.put("checkIn", "20190801".substring(0,4)+"년 "+"20190801".substring(4,6)+"월 "+"20190801".substring(6)+"일");
		paraMap.put("checkOut", "20190802".substring(0,4)+"년 "+"20190802".substring(4,6)+"월 "+"20190802".substring(6)+"일");
		paraMap.put("nonight", String.valueOf(Integer.parseInt("20190802")-Integer.parseInt("20190801")+1));
		
		paraMap.put("productName", "트윈룸");
		paraMap.put("roomType", "2");
		paraMap.put("weekPrice", "140000");
		paraMap.put("svcPrice", String.valueOf((Integer.parseInt("140000")/10)));
		paraMap.put("totalPrice", String.valueOf((Integer.parseInt("140000")+Integer.parseInt("140000")/10)));
		paraMap.put("point", String.valueOf(Integer.parseInt("140000")/30));
		
		
		mv.addObject("paraMap", paraMap);
		mv.setViewName("bora/accomodationInfo.tiles1");
		return mv;
	}
	
	// === 예약확인페이지 에서 정보수정 ===
	@RequestMapping(value="/accomodationInfoMyEditEnd.go", method= {RequestMethod.POST})
	public String LoginCK_accomodationInfoMyEditEnd(HttpServletRequest request, HttpServletResponse response, MemberVO mvo) {
		
		String tel = request.getParameter("tel");
		String email = request.getParameter("email");
		
		int n = service.accomodationInfoMyEditEnd(mvo);
		
		mvo.setTel(tel);
		mvo.setEmail(email);
		
		String msg = "";
		if(n>0)
			msg = "회원정보 수정 성공!!";
		else
			msg = "회원정보 수정 실패!!";
		
		request.setAttribute("msg", msg);
		
		return "tiles1/msg";
	}
	
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// === 이용약관 ===
	@RequestMapping(value="/terms.go", method= {RequestMethod.GET})
	public String terms() {
		return "tiles1/bora/serviceGuideLine/terms";
	}
	
	// === 개인정보방침 ===
	@RequestMapping(value="/privacy_policy.go", method= {RequestMethod.GET})
	public String policy() {
		return "tiles1/bora/serviceGuideLine/privacy_policy";
	}
	
}
