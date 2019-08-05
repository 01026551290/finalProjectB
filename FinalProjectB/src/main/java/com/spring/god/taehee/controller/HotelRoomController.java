package com.spring.god.taehee.controller;


import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.spring.god.hyein.model.HotelRoomVO;
import com.spring.god.taehee.service.InterHotelRoomService;
import com.spring.god.yujin.model.HistoryVO;
import com.spring.god.yujin.model.ReviewVO;

@Controller
public class HotelRoomController {

		@Autowired	// Type에 따라 알아서 Bean 을 주입해준다.
		private InterHotelRoomService service;
		
		
		@RequestMapping(value="/product.go", method= {RequestMethod.GET})
		public ModelAndView product(HttpServletRequest request, ModelAndView mv) {
			
				
		     
			 String largeCategoryontionCode = request.getParameter("largeCategoryontionCode")!=null?request.getParameter("largeCategoryontionCode"):"";
			 String checkin_date = request.getParameter("checkin_date")!=null?request.getParameter("checkin_date"):"";
	         String checkout_date = request.getParameter("checkout_date")!=null?request.getParameter("checkout_date"):"";
	         String adult = request.getParameter("adult")!=null?request.getParameter("adult"):"0";
	         String children = request.getParameter("children")!=null?request.getParameter("children"):"0";
	         int per = 2;
	         try {
	            per = Integer.parseInt(adult)+(Integer.parseInt(children)/2);
	         } catch (NumberFormatException e) {
	            per = 2;
	         }
	         
	         mv.addObject("largeCategoryontionCode", largeCategoryontionCode);
	         mv.addObject("checkin_date",checkin_date);
	         mv.addObject("checkout_date",checkout_date);
	         mv.addObject("adult",Integer.parseInt(adult));
	         mv.addObject("children",Integer.parseInt(children));
			
	         
	        HashMap<String, String> paraMap = new HashMap<String,String>();
	        paraMap.put("largeCategoryontionCode", largeCategoryontionCode);
	        paraMap.put("checkin_date",checkin_date);
	        paraMap.put("checkout_date",checkout_date);
	        paraMap.put("per", String.valueOf(per));
	        
	        
	        List<HotelRoomVO> HotelRoomVO = service.getCheckInOutList(paraMap);
	        System.out.println(HotelRoomVO.size());
	        for(int i=0;i<HotelRoomVO.size();i++) {
	        	System.out.println(HotelRoomVO.get(i).getPicture());
	        	List<String> list = Arrays.asList(HotelRoomVO.get(i).getPicture().split(","));
	        	HotelRoomVO.get(i).setImgList(list);
	        }
	        
	        
	         
			HotelRoomVO hotelroomvo = null;
			HistoryVO historyvo = null;
//			List<HotelRoomVO> hotelroomList = null;
//			List<ReviewVO> reviewList = null;
			
			
			
			// 리스트페이지에서 호텔고유번호 largecategoryontioncode 을 가지고 숙소 정보 조회
			// -> 호텔정보 뿌려주기
			
			largeCategoryontionCode = request.getParameter("largeCategoryontionCode");
			hotelroomvo = service.getViewHotel(largeCategoryontionCode);
						
			mv.addObject("hotelroomvo", hotelroomvo);	
			
			// 리스트페이지에서 호텔고유번호 largecategoryontioncode 을 가지고 숙소소유의 객실 조회
			// -> 객실정보 //리스트 (한 호텔이 소유한 모든 객실이 들어와야해서)
	//		String FK_LARGECATEGORYCODE = request.getParameter("FK_LARGECATEGORYCODE");
			
//			hotelroomList = service.getHotelroomList(largeCategoryontionCode);
					
//			mv.addObject("hotelroomList", hotelroomList);		
			
//		    mv.addObject("historyvo", historyvo); 
		    mv.addObject("HotelRoomVO", HotelRoomVO); 
		     

		
		    
		     
			/*
			// 리뷰 보여주기
			String hotelidx = request.getParameter("hotelidx");
			System.out.println(hotelidx);
			reviewList = service.getReviewList(hotelidx);


			mv.addObject("reviewList", reviewList);
			*/
			
			mv.setViewName("taehee/hotelroomD.tiles1");
			return mv;

	}

}
