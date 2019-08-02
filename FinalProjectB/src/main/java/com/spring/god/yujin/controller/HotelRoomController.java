package com.spring.god.yujin.controller;

import java.util.HashMap;
import java.util.List;

import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.god.common.MyUtil;
import com.spring.god.hyein.model.HotelRoomVO;
import com.spring.god.jiyoung.model.MemberVO;
import com.spring.god.yujin.model.HistoryVO;
import com.spring.god.yujin.service.InterHotelRoomService;

@Component
@Controller
public class HotelRoomController {
	 @Autowired
	   private InterHotelRoomService service;
	 

	   @RequestMapping(value="/search.go", method= {RequestMethod.GET})
	   public ModelAndView roomSearch(HttpServletRequest request,ModelAndView mv) {
		   
	      String searchWord = request.getParameter("searchWord")!=null?request.getParameter("searchWord"):"";
	      if(searchWord.trim().isEmpty())   
	         searchWord="";
	      String checkin_date = request.getParameter("checkin_date")!=null?request.getParameter("checkin_date"):"";
	      String checkout_date = request.getParameter("checkout_date")!=null?request.getParameter("checkout_date"):"";
	      String adult = request.getParameter("adult")!=null?request.getParameter("adult"):"2";
	      String children = request.getParameter("children")!=null?request.getParameter("children"):"";
	      int per = 2;
	      try {
	         per = Integer.parseInt(adult)+(Integer.parseInt(children)/2);
	      } catch (NumberFormatException e) {
	         per = 2;
	      }
	      
	      mv.addObject("searchWord",searchWord);
	      mv.addObject("checkin_date",checkin_date);
	      mv.addObject("checkout_date",checkout_date);
	      mv.addObject("adult",Integer.parseInt(adult));
	      mv.addObject("children",Integer.parseInt(children));
	      
	      HashMap<String, String> paramap = new HashMap<String,String>();
	      paramap.put("searchWord", searchWord);
	      paramap.put("checkin_date", checkin_date);
	      paramap.put("checkout_date", checkout_date);
	      paramap.put("per", String.valueOf(per));
	      
	      
	      HttpSession session = request.getSession();
	      if(session.getAttribute("loginuser")!=null) {
	    	  String memberid =(String)((MemberVO)session.getAttribute("loginuser")).getMemberId(); 
	    	  paramap.put("memberid", memberid);
	      }
	      
	
	      
	      int totalCnt = 0;
	      int sizePerPage = 2;
	      int currentShowPage = 1;
	      int totalPage = 0;
	      if(request.getParameter("currentShowPage")==null)
	         currentShowPage = 1;
	      else {
	         try {
	            currentShowPage = Integer.parseInt(request.getParameter("currentShowPage"));
	         } catch (NumberFormatException e) {
	            currentShowPage = 1;
	         }
	      }
	      
	      int startRno = 0;
	      int endRno = 0;
	      
	      totalCnt = service.getTotalCntHotel(paramap);
	      totalPage = (int)Math.ceil((double)totalCnt/sizePerPage);
	      startRno = ((currentShowPage-1)*sizePerPage)+1;
	      endRno = startRno+sizePerPage-1;
	      
	      paramap.put("startRno", String.valueOf(startRno));
	      paramap.put("endRno", String.valueOf(endRno));
	         
	      List<HotelRoomVO> hotelRoomVOList = service.getTotalHotelList(paramap);
	      
	      
	      String pagebar = "<ul>";
	      String url = "/god/search.go?";
	      int blockSize = 3;
	      
	      pagebar += MyUtil.makePageBarHotelList(url, currentShowPage, sizePerPage, totalPage, blockSize, searchWord, checkin_date, checkout_date, adult, children);
	      pagebar += "</ul>";
	      
	      String listUrl = MyUtil.getCurrentURL(request);
	      
	      session.setAttribute("listUrl", listUrl);
	      
	      mv.addObject("paramap",paramap); //나중에 오류시 if문으로 !"".equals(searchWord)조건주기
//	      mv.addObject("hotelList",hotelList);
	      mv.addObject("pagebar",pagebar);
	
//	      List<HotelRoomVO> hotelRoomVOList = service.getlist(paramap);
	      
	      session.setAttribute("hotelRoomVOList", hotelRoomVOList);
	      
//	      for(HotelRoomVO hotelvo : hotelRoomVOList) {
//	         System.out.println(hotelvo.getName()+", "+hotelvo.getAddress()+", "+hotelvo.getImg()+", "+hotelvo.getWeekPrice());
//	      }
	      
	      mv.setViewName("yujin/roomSearch.tiles1");
	      return mv;
	   }
	   
	   @SuppressWarnings("unchecked")
	@RequestMapping(value="/searchRoomMap.go", method= {RequestMethod.GET}, produces="text/plain;charset=UTF-8")
	   @ResponseBody
	   public String hotelMap(HttpServletRequest request) {

		   JSONArray jsonArr = new JSONArray();
	      
	      HttpSession session = request.getSession();
	      if(session.getAttribute("hotelRoomVOList")!=null) {
	    	  List<HotelRoomVO> list = (List<HotelRoomVO>) session.getAttribute("hotelRoomVOList");
	    	  session.removeAttribute("hotelRoomVOList");
	    	  
	    	  if(list != null) {
	    		  for(HotelRoomVO hrvo : list) {
	    			  JSONObject jsonObj = new JSONObject();
	    			  jsonObj.put("addr", hrvo.getAddress());
	    			  jsonObj.put("name", hrvo.getName());
	    			  jsonObj.put("img", hrvo.getImg());
	    			  jsonObj.put("largeCategoryontionCode", hrvo.getLargeCategoryontionCode());
	    			  jsonObj.put("price", hrvo.getWeekPrice());
	    			  
	    			  jsonArr.put(jsonObj);
	    		  }
	    	  }
	      }
	      if(session.getAttribute("historyVOList")!=null) {
	   		  List<HistoryVO> list = (List<HistoryVO>) session.getAttribute("historyVOList");
	    	  session.removeAttribute("hotelRoomVOList");
	    	  
	    	  if(list != null) {
	    		  for(HistoryVO hrvo : list) {
	    			  JSONObject jsonObj = new JSONObject();
	    			  jsonObj.put("addr", hrvo.getAddress());
	    			  jsonObj.put("name", hrvo.getName());
	    			  jsonObj.put("img", hrvo.getImg());
	    			  jsonObj.put("largeCategoryontionCode", hrvo.getLargeCategoryOntionCode());
	    			  jsonObj.put("price", hrvo.getPrice());
	    			  
	    			  jsonArr.put(jsonObj);
	    		  }
	    	  }
	      }

	         String result = jsonArr.toString();
	         
	         return result;
	      }

}
