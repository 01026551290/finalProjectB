package com.spring.god.taehee.controller;



import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.spring.god.hyein.model.HotelRoomVO;
import com.spring.god.jiyoung.model.MemberVO;
import com.spring.god.taehee.service.HotelRoomService;
import com.spring.god.taehee.service.InterHotelRoomService;
import com.spring.god.yujin.model.HistoryVO;
import com.spring.god.yujin.model.ReviewVO;

@Controller
public class HotelRoomController {

		@Autowired	// Type에 따라 알아서 Bean 을 주입해준다.
		private InterHotelRoomService service;
		
		
		@RequestMapping(value="/product.go", method= {RequestMethod.GET})
		public ModelAndView product(HttpServletRequest request, ModelAndView mv) throws Exception {
			
				
		     
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
	        
	        
	        // 객실정보뽑아오기
	        List<HotelRoomVO> roomvo = service.getCheckInOutList(paraMap);
	        System.out.println(roomvo.size());
	        for(int i=0;i<roomvo.size();i++) {
	        	System.out.println(roomvo.get(i).getOrgFileName());
	        	List<String> list = Arrays.asList(roomvo.get(i).getOrgFileName().split(","));
	        	roomvo.get(i).setImgList(list);
	        }
	        
	        
	         
			HotelRoomVO hotelvo = null;
			HistoryVO historyvo = null;
//			List<HotelRoomVO> hotelroomList = null;
//			List<ReviewVO> reviewList = null;
			
			
			
			// 리스트페이지에서 호텔고유번호 largecategoryontioncode 을 가지고 숙소 정보 조회
			// -> 호텔정보 뿌려주기
			
			largeCategoryontionCode = request.getParameter("largeCategoryontionCode");
			hotelvo = service.getViewHotel(largeCategoryontionCode);
						
			mv.addObject("HotelVO", hotelvo);	// 호텔정보 --> mv.addObject("hotelroomvo", hotelroomvo);
		    mv.addObject("RoomVO", roomvo); 	// 객실정보 --> mv.addObject("HotelRoomVO", HotelRoomVO);
		     
		    HttpSession session = request.getSession();
		    
		    // 조회수 보내기
		    String hotelidx = largeCategoryontionCode;
		    HashMap<String,String> idxmap = new HashMap<String,String>();
		    if(session.getAttribute("loginuser")!=null) {
		    	  int idx =(int)((MemberVO)session.getAttribute("loginuser")).getIdx(); 
		    	 String memberidx = String.valueOf(idx);
		    	 		    	 
		    	 idxmap.put("hotelidx", hotelidx);
				    idxmap.put("memberidx", memberidx);
				    int hotelcnt = service.addViewCnt(idxmap);
			
		      }
		    
		      
		      
		    MemberVO memberVO = new MemberVO();
		    

		    
		      if(session.getAttribute("loginuser")!=null) {
		    	  String memberid =(String)((MemberVO)session.getAttribute("loginuser")).getMemberId(); 
		    	  paraMap.put("memberid", memberid);
		      }

   
		     
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

		
		@RequestMapping(value="/product2.go", method= {RequestMethod.GET})
		public ModelAndView product2(HttpServletRequest request, ModelAndView mv) throws Exception {
			
			
			
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
			
			
			// 객실정보뽑아오기
			List<HotelRoomVO> roomvo = service.getCheckInOutList(paraMap);
			System.out.println(roomvo.size());
			for(int i=0;i<roomvo.size();i++) {
				System.out.println(roomvo.get(i).getOrgFileName());
				List<String> list = Arrays.asList(roomvo.get(i).getOrgFileName().split(","));
				roomvo.get(i).setImgList(list);
			}
			
			
			
			HotelRoomVO hotelvo = null;
			HistoryVO historyvo = null;
//			List<HotelRoomVO> hotelroomList = null;
//			List<ReviewVO> reviewList = null;
			
			
			
			// 리스트페이지에서 호텔고유번호 largecategoryontioncode 을 가지고 숙소 정보 조회
			// -> 호텔정보 뿌려주기
			
			largeCategoryontionCode = request.getParameter("largeCategoryontionCode");
			hotelvo = service.getViewHotel(largeCategoryontionCode);
			
			mv.addObject("HotelVO", hotelvo);	// 호텔정보 --> mv.addObject("hotelroomvo", hotelroomvo);
			mv.addObject("RoomVO", roomvo); 	// 객실정보 --> mv.addObject("HotelRoomVO", HotelRoomVO);
			
			HttpSession session = request.getSession();
			
			// 조회수 보내기
			String hotelidx = largeCategoryontionCode;
			HashMap<String,String> idxmap = new HashMap<String,String>();
			if(session.getAttribute("loginuser")!=null) {
				int idx =(int)((MemberVO)session.getAttribute("loginuser")).getIdx(); 
				String memberidx = String.valueOf(idx);
				
				idxmap.put("hotelidx", hotelidx);
				idxmap.put("memberidx", memberidx);
				int hotelcnt = service.addViewCnt(idxmap);
				
			}
			
			
			
			MemberVO memberVO = new MemberVO();
			
			
			
			if(session.getAttribute("loginuser")!=null) {
				String memberid =(String)((MemberVO)session.getAttribute("loginuser")).getMemberId(); 
				paraMap.put("memberid", memberid);
			}
			
			
			
			/*
			// 리뷰 보여주기
			String hotelidx = request.getParameter("hotelidx");
			System.out.println(hotelidx);
			reviewList = service.getReviewList(hotelidx);


			mv.addObject("reviewList", reviewList);
			 */
			
			mv.setViewName("taehee/hotelroomD2.tiles1");
			return mv;
			
		}
		
}
