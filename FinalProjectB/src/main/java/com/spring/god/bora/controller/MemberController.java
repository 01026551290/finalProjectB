package com.spring.god.bora.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.spring.god.bora.service.InterHotelRoomService;
import com.spring.god.jiyoung.model.MemberVO;
import com.spring.god.yujin.model.HistoryVO;

@Component
@Controller
public class MemberController {

	@Autowired
	private InterHotelRoomService service;
	
	// === 예약확인페이지 ===
	@RequestMapping(value="/accommodationInfo.go", method= {RequestMethod.GET})
	public ModelAndView LoginCK_accommodationInfo(HttpServletRequest request, HttpServletResponse response, ModelAndView mv) {
		
		HashMap<String, String> paraMap = new HashMap<String, String>();
		
		paraMap.put("img", "Hno.jpg");
		paraMap.put("name", "켄싱턴리조트 서귀포");
		paraMap.put("address", "제주특별자치도 서귀포시 강정동 이어도로 684".substring(8));
		paraMap.put("checkIn", "20190801".substring(0,4)+"년 "+"20190801".substring(4,6)+"월 "+"20190801".substring(6)+"일");
		paraMap.put("checkOut", "20190802".substring(0,4)+"년 "+"20190802".substring(4,6)+"월 "+"20190802".substring(6)+"일");
		paraMap.put("noNight", String.valueOf(Integer.parseInt("20190802")-Integer.parseInt("20190801")+1));
		
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
	
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// === 결제하기 ===
	@RequestMapping(value="/payEnd.go", method= {RequestMethod.GET})
	public ModelAndView LoginCK2_payEnd(HttpServletRequest request, HttpServletResponse response, ModelAndView mv) {
		
		int totalPrice = Integer.parseInt(request.getParameter("totalPrice"));
		
		mv.addObject("totalPrice", totalPrice);
		mv.setViewName("tiles1/bora/paymentGateway");
		return mv;
	} 
	
	// === 결제완료 ===
	@RequestMapping(value="/reserveAddInsertLoginUser.go", method= {RequestMethod.POST})
	public String LoginCK2_reserveAddInsertLoginUser(HttpServletRequest request, HttpServletResponse response, HistoryVO hvo) {
		
		HttpSession session = request.getSession();
		MemberVO loginuser = (MemberVO)session.getAttribute("loginuser");
		
		
		
		return "tiles1/bora/paymentGateway";
	}
	
}
