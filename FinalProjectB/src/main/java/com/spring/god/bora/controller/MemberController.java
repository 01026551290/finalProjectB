package com.spring.god.bora.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.god.bora.service.InterMemberService;
import com.spring.god.jiyoung.controller.GoogleMail;
import com.spring.god.jiyoung.model.MemberVO;
import com.spring.god.yujin.model.HistoryVO;

@Component
@Controller
public class MemberController {

	@Autowired
	private InterMemberService service;
	
	// === 예약확인페이지 ===
	@RequestMapping(value="/accommodationInfo.go")
	public ModelAndView LoginCK2_accommodationInfo(HttpServletRequest request, HttpServletResponse response, ModelAndView mv) {
		
		// 상세페이지에서 받아옴
		String largeCategoryontionCode = request.getParameter("largeCategoryontionCode");
		String productId = request.getParameter("productId");
		String img = request.getParameter("img");
		String name = request.getParameter("name");
		String address = request.getParameter("address");
		String checkIn = request.getParameter("checkIn");
		String checkOut = request.getParameter("checkOut");
		String productName = request.getParameter("productName");
		String roomType2 = request.getParameter("roomType2");
		String roomType3 = request.getParameter("roomType3");
		String weekPrice = request.getParameter("weekPrice");
		
		HashMap<String, String> paraMap = new HashMap<String, String>();
		
		paraMap.put("largeCategoryontionCode", largeCategoryontionCode);
		paraMap.put("img", img);
		paraMap.put("name", name);
		paraMap.put("address", address.substring(8));
		paraMap.put("checkInView", checkIn.substring(0,4)+"년 "+checkIn.substring(5,7)+"월 "+checkIn.substring(8)+"일");
		paraMap.put("checkOutView", checkOut.substring(0,4)+"년 "+checkOut.substring(5,7)+"월 "+checkOut.substring(8)+"일");
		paraMap.put("checkIn", checkIn);
		paraMap.put("checkOut", checkOut);
		paraMap.put("noNight", String.valueOf(Integer.parseInt(checkOut.substring(0,4)+checkOut.substring(5,7)+checkOut.substring(8))-Integer.parseInt(checkIn.substring(0,4)+checkIn.substring(5,7)+checkIn.substring(8))+1));
		paraMap.put("productId", productId);
		paraMap.put("productName", productName);
		paraMap.put("roomType", roomType3); // 수용인원 
		paraMap.put("weekPrice", weekPrice);
		paraMap.put("svcPrice", String.valueOf((Integer.parseInt(weekPrice)/10)));
		paraMap.put("totalPrice", String.valueOf((Integer.parseInt(weekPrice)+Integer.parseInt(weekPrice)/10)));
		paraMap.put("point", String.valueOf(Integer.parseInt(weekPrice)/30));
		
		
		mv.addObject("paraMap", paraMap);
		mv.setViewName("bora/accommodationInfo.tiles1");
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
	// === 결제완료 전 예약가능한지 조회 ===
	@RequestMapping(value="/reserveAddSelectLoginUser.go", produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String LoginCK2_reserveAddSelectLoginUser_index(HttpServletRequest request, HttpServletResponse response, HistoryVO hvo) {
		
		int n = service.reserveAddSelect(hvo);
		System.out.println("n의값:" + n);
		String result = "";
		JSONObject jsonObj = new JSONObject();
		
		if(n==1) {
			jsonObj.put("memberIdx", hvo.getMemberIdx());
			jsonObj.put("price", hvo.getPrice());
			jsonObj.put("msg", "OK");
			result = jsonObj.toString();
		}
		else {
			jsonObj.put("msg", "예약가능한 방이 없습니다. 다른 날짜를 선택해 주세요!!\n숙박 상세페이지로 넘어갑니다.");
			
			result = jsonObj.toString();
		}	
		return result;
	}

	// === 결제하기 ===
	@RequestMapping(value="/payEnd.go")
	public ModelAndView LoginCK2_payEnd_index(HttpServletRequest request, HttpServletResponse response, ModelAndView mv) {
		
		String largeCategoryontionCode = request.getParameter("largeCategoryontionCode");
		String fk_productId = request.getParameter("fk_productId");
		String img = request.getParameter("img");
		String name = request.getParameter("name");
		String address = request.getParameter("address");
		String checkIn = request.getParameter("checkIn");
		String checkOut = request.getParameter("checkOut");
		String productName = request.getParameter("productName");
		String roomType = request.getParameter("roomType");
		String weekPrice = request.getParameter("weekPrice");
		String point = request.getParameter("point");
		
		mv.addObject("largeCategoryontionCode", largeCategoryontionCode);
		mv.addObject("img", img);
		mv.addObject("name", name);
		mv.addObject("address", address);
		mv.addObject("checkInView", checkIn.substring(0,4)+"년 "+checkIn.substring(5,7)+"월 "+checkIn.substring(8)+"일");
		mv.addObject("checkOutView", checkOut.substring(0,4)+"년 "+checkOut.substring(5,7)+"월 "+checkOut.substring(8)+"일");
		mv.addObject("checkIn", checkIn);
		mv.addObject("checkOut", checkOut);
		mv.addObject("noNight", String.valueOf(Integer.parseInt(checkOut.substring(0,4)+checkOut.substring(5,7)+checkOut.substring(8))-Integer.parseInt(checkIn.substring(0,4)+checkIn.substring(5,7)+checkIn.substring(8))+1));
		mv.addObject("fk_productId", fk_productId);
		mv.addObject("productName", productName);
		mv.addObject("roomType", roomType);
		mv.addObject("weekPrice", weekPrice);
		mv.addObject("svcPrice", String.valueOf((Integer.parseInt(weekPrice)/10)));
		mv.addObject("totalPrice", String.valueOf((Integer.parseInt(weekPrice)+Integer.parseInt(weekPrice)/10)));
		mv.addObject("point", String.valueOf(Integer.parseInt(weekPrice)/30));
		
		
		mv.setViewName("tiles1/bora/paymentGateway");
		return mv;
		
	}

	// === 결제 후 예약 및 이메일보내기 ===
	@RequestMapping(value="/reserveAddInsertLoginUser.go", produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String LoginCK2_reserveAddInsertLoginUser_index(HttpServletRequest request, HttpServletResponse response, HistoryVO hvo) {
		
		HttpSession session = request.getSession();
		MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");
		String email = loginuser.getEmail();
		String memberName = loginuser.getName();
		
		String img = request.getParameter("img");
		String name = request.getParameter("name");
		String address = request.getParameter("address");
		String checkInView = request.getParameter("checkIn").substring(0,4)+"년 "+request.getParameter("checkIn").substring(5,7)+"월 "+request.getParameter("checkIn").substring(8)+"일";
		String checkOutView = request.getParameter("checkOut").substring(0,4)+"년 "+request.getParameter("checkOut").substring(5,7)+"월 "+request.getParameter("checkOut").substring(8)+"일";
		String noNight = String.valueOf(Integer.parseInt(request.getParameter("checkOut").substring(0,4)+request.getParameter("checkOut").substring(5,7)+request.getParameter("checkOut").substring(8))-Integer.parseInt(request.getParameter("checkIn").substring(0,4)+request.getParameter("checkIn").substring(5,7)+request.getParameter("checkIn").substring(8))+1);
		String productName = request.getParameter("productName");
		String roomType = request.getParameter("roomType"); // 수용인원 
		String weekPrice = request.getParameter("weekPrice");
		String svcPrice = String.valueOf((Integer.parseInt(request.getParameter("weekPrice"))/10));
		String totalPrice = String.valueOf((Integer.parseInt(request.getParameter("weekPrice"))+Integer.parseInt(request.getParameter("weekPrice"))/10));
		
		int m = service.reserveAddInsert(hvo);
		String result = "";
		JSONObject jsonObj = new JSONObject();
		GoogleMail mail = new GoogleMail();
		
		try {
			if(m==1) {
				jsonObj.put("msg", "결제 되었습니다.");
				result = jsonObj.toString();
					mail.sendmailReserve(email, memberName, img, name, address, checkInView, checkOutView, noNight, productName, roomType, weekPrice, svcPrice, totalPrice);
			}
			else {
				jsonObj.put("msg", "결제는 되었으나, 예약이 안되었으니 관리자에게 문의하세요.");
				
				result = jsonObj.toString();
			}	
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
}
