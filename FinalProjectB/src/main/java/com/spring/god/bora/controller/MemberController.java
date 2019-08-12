package com.spring.god.bora.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
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
	@RequestMapping(value="/accommodationInfo.go", method= {RequestMethod.GET})
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
		paraMap.put("productId", productId);
		paraMap.put("productName", productName);
		paraMap.put("roomType", roomType3); // 수용인원 
		
		long noNight = 0;
		try { // String Type을 Date Type으로 캐스팅하면서 생기는 예외로 인해 여기서 예외처리 해주지 않으면 컴파일러에서 에러가 발생해서 컴파일을 할 수 없다.
	        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
	        // date1, date2 두 날짜를 parse()를 통해 Date형으로 변환.
	        Date FirstDate = format.parse(paraMap.get("checkIn"));
	        Date SecondDate = format.parse(paraMap.get("checkOut"));
	        
	        // Date로 변환된 두 날짜를 계산한 뒤 그 리턴값으로 long type 변수를 초기화 하고 있다.
	        // 연산결과 -950400000. long type 으로 return 된다.
	        long calDate = FirstDate.getTime() - SecondDate.getTime(); 
	        
	        // Date.getTime() 은 해당날짜를 기준으로1970년 00:00:00 부터 몇 초가 흘렀는지를 반환해준다. 
	        // 이제 24*60*60*1000(각 시간값에 따른 차이점) 을 나눠주면 일수가 나온다.
	        noNight = calDate / ( 24*60*60*1000); 
	 
	        noNight = Math.abs(noNight);
	        
        }
        catch(Exception e) {
	            e.printStackTrace();
        }
		paraMap.put("noNight", String.valueOf(noNight));
		paraMap.put("weekPrice", weekPrice);
		paraMap.put("totalPrice", String.valueOf((Integer.parseInt(weekPrice)+Integer.parseInt(weekPrice)/10)*(noNight-1)));
		paraMap.put("svcPrice", String.valueOf((Integer.parseInt(weekPrice)/10)));
		paraMap.put("point", String.valueOf(((Integer.parseInt(weekPrice)+Integer.parseInt(weekPrice)/10)*(noNight-1))/30));
		
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
		mv.addObject("fk_productId", fk_productId);
		mv.addObject("productName", productName);
		mv.addObject("roomType", roomType);
		
		long noNight = 0;
		try { // String Type을 Date Type으로 캐스팅하면서 생기는 예외로 인해 여기서 예외처리 해주지 않으면 컴파일러에서 에러가 발생해서 컴파일을 할 수 없다.
	        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
	        // date1, date2 두 날짜를 parse()를 통해 Date형으로 변환.
	        Date FirstDate = format.parse(checkIn);
	        Date SecondDate = format.parse(checkOut);
	        
	        // Date로 변환된 두 날짜를 계산한 뒤 그 리턴값으로 long type 변수를 초기화 하고 있다.
	        // 연산결과 -950400000. long type 으로 return 된다.
	        long calDate = FirstDate.getTime() - SecondDate.getTime(); 
	        
	        // Date.getTime() 은 해당날짜를 기준으로1970년 00:00:00 부터 몇 초가 흘렀는지를 반환해준다. 
	        // 이제 24*60*60*1000(각 시간값에 따른 차이점) 을 나눠주면 일수가 나온다.
	        noNight = calDate / ( 24*60*60*1000); 
	 
	        noNight = Math.abs(noNight);
	        
        }
        catch(Exception e) {
	            e.printStackTrace();
        }
		
		mv.addObject("noNight", String.valueOf(noNight));
		mv.addObject("weekPrice", weekPrice);
		mv.addObject("totalPrice", String.valueOf((Integer.parseInt(weekPrice)+Integer.parseInt(weekPrice)/10)*(noNight-1)));
		mv.addObject("svcPrice", String.valueOf((Integer.parseInt(weekPrice)/10)));
		mv.addObject("point", String.valueOf(((Integer.parseInt(weekPrice)+Integer.parseInt(weekPrice)/10)*(noNight-1))/30));
		
		
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
		String productName = request.getParameter("productName");
		String roomType = request.getParameter("roomType"); // 수용인원 
		String weekPrice = request.getParameter("weekPrice");
		String noNight = request.getParameter("noNight");
		String svcPrice = String.valueOf((Integer.parseInt(request.getParameter("weekPrice"))/10));
		String totalPrice = request.getParameter("price");
		
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
