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
import com.spring.god.jiyoung.model.MemberVO;
import com.spring.god.yujin.model.HistoryVO;

@Component
@Controller
public class MemberController {

	@Autowired
	private InterMemberService service;
	
	// === 예약확인페이지 ===
	@RequestMapping(value="/accommodationInfo.go", method= {RequestMethod.GET})
	public ModelAndView LoginCK_accommodationInfo(HttpServletRequest request, HttpServletResponse response, ModelAndView mv) {
		
		HashMap<String, String> paraMap = new HashMap<String, String>();
		
		paraMap.put("img", "Hno.jpg");
		paraMap.put("name", "켄싱턴리조트 서귀포");
		paraMap.put("address", "제주특별자치도 서귀포시 강정동 이어도로 684".substring(8));
		paraMap.put("checkInView", "20190807".substring(0,4)+"년 "+"20190807".substring(4,6)+"월 "+"20190807".substring(6)+"일");
		paraMap.put("checkOutView", "20190808".substring(0,4)+"년 "+"20190808".substring(4,6)+"월 "+"20190808".substring(6)+"일");
		paraMap.put("checkIn", "20190807");
		paraMap.put("checkOut", "20190808");
		paraMap.put("noNight", String.valueOf(Integer.parseInt("20190808")-Integer.parseInt("20190807")+1));
		
		paraMap.put("productId", "1001");
		paraMap.put("productName", "트윈룸");
		paraMap.put("roomType", "2");
		paraMap.put("weekPrice", "100");
		paraMap.put("svcPrice", String.valueOf((Integer.parseInt("100")/10)));
		paraMap.put("totalPrice", String.valueOf((Integer.parseInt("100")+Integer.parseInt("100")/10)));
		paraMap.put("point", String.valueOf(Integer.parseInt("100")/30));
		
		
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
	/*
	// === 결제완료 전 예약가능한지 조회 ===
	@RequestMapping(value="/reserveAddSelectLoginUser.go", method= {RequestMethod.POST})
	public String LoginCK2_reserveAddSelectLoginUser(HttpServletRequest request, HttpServletResponse response, HistoryVO hvo) {
		
		HttpSession session = request.getSession();
		MemberVO loginuser = (MemberVO)session.getAttribute("loginuser");
		int totalPrice = Integer.parseInt(request.getParameter("price"));
		System.out.println(hvo.getNoNight());
		System.out.println(hvo.getCheckIn());
		System.out.println(hvo.getCheckOut());
		
		int n = service.reserveAddSelect(hvo);
		System.out.println("n값:" + n);
		String msg = "";
		String loc = "";
		
		if(n==0) {
			msg = "예약가능한 방이 없습니다. 다른 날짜를 선택해 주세요!!";
		//	loc = "/god/product.go?largeCategoryontionCode="+hvo.getLargeCategoryOntionCode();
			// 다른 날짜 선택할수 있도록 상세페이지로 넘어가게 해줘야 함.
		}
		else {
			// 예약이 가능함
			msg = "예약가능합니다!! 결제창으로 넘어갑니다.";
			loc = "tiles1/bora/paymentConfirmPopup";
			if(m==0) {
				msg = "예약은 가능한데 실패했습니다!!!!(관리자에게 문의하세요.)";
				loc = "javascript:history.back()";
			}
			else {
				loc = request.getContextPath() + "/payEnd.go?idx="+loginuser.getIdx()+"&totalPrice="+totalPrice;
				System.out.println(totalPrice);
				
				int m = service.reserveAddInsert(hvo);
				msg = "예약 및 결제가 완료 되었습니다.";
				loc = "/god/index.go";
			}
			
		}
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		System.out.println(loc);
		return "tiles1/msg";
	}
	*/
	// === 결제완료 전 예약가능한지 조회 ===
	@RequestMapping(value="/reserveAddSelectLoginUser.go", method= {RequestMethod.POST}, produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String LoginCK2_reserveAddSelectLoginUser(HttpServletRequest request, HttpServletResponse response, HistoryVO hvo) {
		
		int n = service.reserveAddSelect(hvo);
		System.out.println(n);
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
		//	loc = "/god/product.go?largeCategoryontionCode="+hvo.getLargeCategoryOntionCode();
			
			result = jsonObj.toString();
		}	
		return result;
	}

	// === 결제하기 ===
	@RequestMapping(value="/payEnd.go", method= {RequestMethod.GET})
	public ModelAndView LoginCK2_payEnd(HttpServletRequest request, HttpServletResponse response, ModelAndView mv) {
		
		int totalPrice = Integer.parseInt(request.getParameter("totalPrice"));
		
		mv.addObject("totalPrice", totalPrice);
		mv.setViewName("tiles1/bora/paymentGateway");
		return mv;
	}

	// === 결제 후 예약하기 ===
	@RequestMapping(value="/reserveAddInsertLoginUser.go", method= {RequestMethod.POST})
	public String LoginCK2_reserveAddInsertLoginUser(HttpServletRequest request, HttpServletResponse response, HistoryVO hvo) {
		HttpSession session = request.getSession();
		MemberVO loginuser = (MemberVO)session.getAttribute("loginuser");
		
		int m = service.reserveAddInsert(hvo);
		m=0;
		String msg = "";
		String loc = "";
		if(m==1) {
			msg = loginuser.getNickName()+"님"+hvo.getPrice()+"원이 결제가 완료되었습니다.";
			loc = "/god/index.go";
		}
		else {
			msg = loginuser.getNickName()+"님"+hvo.getPrice()+"원이 결제가 실패되었습니다.\n관리자에게 문의하세요.";
			loc = "/god/index.go";
		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		
		return "tiles1/msg";
	}
	//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
}
