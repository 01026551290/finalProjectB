package com.spring.god.yujin.controller;

import java.util.HashMap;
import java.util.List;

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

import com.spring.god.hyein.model.HotelRoomVO;
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
	      String CHECKIN = request.getParameter("CHECKIN")!=null?request.getParameter("CHECKIN"):"";
	      String CHECKOUT = request.getParameter("CHECKOUT")!=null?request.getParameter("CHECKOUT"):"";
	      String adult = request.getParameter("adult")!=null?request.getParameter("adult"):"2";
	      String children = request.getParameter("children")!=null?request.getParameter("children"):"";
	      int per = 2;
	      try {
	         per = Integer.parseInt(adult)+(Integer.parseInt(children)/2);
	      } catch (NumberFormatException e) {
	         per = 2;
	      }
	      
	      HashMap<String, String> paramap = new HashMap<String,String>();
	      paramap.put("searchWord", searchWord);
	      paramap.put("CHECKIN", CHECKIN);
	      paramap.put("CHECKOUT", CHECKOUT);
	      paramap.put("per", String.valueOf(per));
	/*
	      
	      int totalCnt = 0;
	      int sizePerPage = 18;
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
	         
	      List<Object> hotelList = service.getTotalHotelList(paramap);
	      
	      
	      String pagebar = "<ul>";
	      String url = "/search.go";
	      int blockSize = 10;
	      
	      pagebar += MyUtil.makePageBarHotelList(url, currentShowPage, sizePerPage, totalPage, blockSize, searchWord, CHECKIN, CHECKOUT, per);
	      pagebar += "</ul>";
	      
	      String listUrl = MyUtil.getCurrentURL(request);
	      
	      HttpSession session = request.getSession();
	      session.setAttribute("listUrl", listUrl);
	      
	      mv.addObject("paramap",paramap); //나중에 오류시 if문으로 !"".equals(searchWord)조건주기
	      mv.addObject("hotelList",hotelList);
	      mv.addObject("pagebar",pagebar);
	*/
	      List<HotelRoomVO> hotelRoomVOList = service.getlist(paramap);
	      
	      HttpSession session = request.getSession();
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
	    			  jsonObj.put("largeCategoryontionCode", hrvo.getLargecategoryontioncode());
	    			  jsonObj.put("price", hrvo.getPrice());
	    			  
	    			  jsonArr.put(jsonObj);
	    		  }
	    	  }
	      }

	         String result = jsonArr.toString();
	         
	         return result;
	      }

}
