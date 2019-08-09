package com.spring.god.yujin.controller;

import java.util.ArrayList;
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
import com.spring.god.yujin.model.SearchVO;
import com.spring.god.yujin.service.InterHotelRoomService;

import oracle.net.aso.s;

@Component
@Controller
public class HotelRoomController {
	 @Autowired
	   private InterHotelRoomService service;
	 
	   // 서치리스트
	   @RequestMapping(value="/search.go", method= {RequestMethod.GET})
	   public ModelAndView roomSearch(HttpServletRequest request,ModelAndView mv, SearchVO svo) {
		    HttpSession session = request.getSession();
		      if(session.getAttribute("loginuser")!=null) {
		    	  String memberid =(String)((MemberVO)session.getAttribute("loginuser")).getMemberId(); 
		    	  svo.setMemberid(memberid);
		      }
	
		      if(svo.getCurrentShowPage()==0)
		         svo.setCurrentShowPage(1);
		      else {
		         try {
		        	 svo.setCurrentShowPage(Integer.parseInt(request.getParameter("currentShowPage")));
		         } catch (NumberFormatException e) {
		        	 svo.setCurrentShowPage(1);
		         }
		      }
	
		      svo.setTotalCnt(service.getTotalCntHotel(svo));
		      svo.setTotalPage((int)Math.ceil((double)svo.getTotalCnt()/svo.getSizePerPageSearchList()));
		      svo.setStartRno(((svo.getCurrentShowPage()-1)*svo.getSizePerPageSearchList())+1);
		      svo.setEndRno(svo.getStartRno()+svo.getSizePerPageSearchList()-1);
	
		      List<HotelRoomVO> hotelRoomVOList = service.getTotalHotelList(svo);
		      
		      String pagebar = "<ul>";
		      String url = MyUtil.makePageBarUrlNext(request,svo);
		      int blockSize = 3;
		      
		      pagebar += MyUtil.makePageBarHotelList(url, svo.getCurrentShowPage(), svo.getSizePerPageSearchList(), svo.getTotalPage(), blockSize);
		      pagebar += "</ul>";
		      
		      String listUrl = MyUtil.getCurrentURL(request);
		      
		      session.setAttribute("listUrl", listUrl);
		      mv.addObject("searchvo",svo);
		      mv.addObject("pagebar",pagebar);
		      session.setAttribute("hotelRoomVOList", hotelRoomVOList);
		      mv.setViewName("yujin/roomSearch.tiles1");
		      return mv;
		      
//	      HttpSession session = request.getSession();
//	      if(session.getAttribute("loginuser")!=null) {
//	    	  String memberid =(String)((MemberVO)session.getAttribute("loginuser")).getMemberId(); 
//	    	  svo.setMemberid(memberid);
//	      }
//
//	      if(svo.getCurrentShowPage()==0)
//	         svo.setCurrentShowPage(1);
//	      else {
//	         try {
//	        	 svo.setCurrentShowPage(Integer.parseInt(request.getParameter("currentShowPage")));
//	         } catch (NumberFormatException e) {
//	        	 svo.setCurrentShowPage(1);
//	         }
//	      }
//
//	      svo.setTotalCnt(service.getTotalCntHotel(svo));
//	      svo.setTotalPage((int)Math.ceil((double)svo.getTotalCnt()/svo.getSizePerPageSearchList()));
//	      svo.setStartRno(((svo.getCurrentShowPage()-1)*svo.getSizePerPageSearchList())+1);
//	      svo.setEndRno(svo.getStartRno()+svo.getSizePerPageSearchList()-1);
//
//	      List<HotelRoomVO> hotelRoomVOList = service.getTotalHotelList(svo);
//	      
//	      String pagebar = "<ul>";
//	      String url = MyUtil.makePageBarUrlNext(request,svo);
//	      int blockSize = 3;
//	      
//	      pagebar += MyUtil.makePageBarHotelList(url, svo.getCurrentShowPage(), svo.getSizePerPageSearchList(), svo.getTotalPage(),blockSize);
//	      pagebar += "</ul>";
//	      
//	      String listUrl = MyUtil.getCurrentURL(request);
//	      
//	      session.setAttribute("listUrl", listUrl);
//	      session.setAttribute("hotelRoomVOList", hotelRoomVOList);
//	      
//	      mv.addObject("searchvo",svo);	      
//	      mv.addObject("pagebar",pagebar);
//		  mv.addObject("searchWord",svo.getSearchWord());
//	      mv.setViewName("yujin/roomSearch.tiles1");
//	      return mv;
	   }
//	   
//	   @RequestMapping(value="/searchHotelList.go", method= {RequestMethod.GET}, produces="text/plain;charset=UTF-8")
//	   @ResponseBody
//	   public String searchHotelList(HttpServletRequest request, SearchVO svo) {
//
//		   JSONArray jsonArr = new JSONArray();
//		   
//		   HttpSession session = request.getSession();
//
////		      List<HotelRoomVO> hotelRoomVOList = service.getTotalHotelList(svo);
////		      session.setAttribute("hotelRoomVOList", hotelRoomVOList);
//		      List<HotelRoomVO> hotelRoomVOList = (List<HotelRoomVO>) session.getAttribute("hotelRoomVOList");
//		      session.removeAttribute("hotelRoomVOList");
//		      
//	    	  if(hotelRoomVOList != null) {
//	    		  for(HotelRoomVO hrvo : hotelRoomVOList) {
//	    			  JSONObject jsonObj = new JSONObject();
//	    			  jsonObj.put("largeCategoryontionCode", hrvo.getLargeCategoryontionCode());
//	    			  jsonObj.put("regDay", hrvo.getRegDay());
//	    			  jsonObj.put("img", hrvo.getImg());
//	    			  jsonObj.put("address", hrvo.getAddress());
//	    			  jsonObj.put("name", hrvo.getName());
//	    			  jsonObj.put("weekPrice", hrvo.getWeekPrice());
//	    			  jsonObj.put("starcnt", hrvo.getStarcnt());
//	    			  jsonObj.put("star", hrvo.getStar());
//	    			  
//	    			  jsonArr.put(jsonObj);
//	    		  }
//	    	  }
//	    	  
//	    	  if(svo!=null) {
//    			  JSONObject jsonObj = new JSONObject();
//    			  jsonObj.put("searchWord", svo.getSearchWord());
//    			  jsonObj.put("hotelName", svo.getSearchWord());
//    			  jsonObj.put("sort", svo.getSearchWord());
//    			  jsonObj.put("checkout_date", svo.getSearchWord());
//    			  jsonObj.put("checkin_date", svo.getSearchWord());
//    			  jsonObj.put("children", svo.getSearchWord());
//    			  jsonObj.put("adult", svo.getSearchWord());
//    			  jsonObj.put("largeCategoryontionCode", svo.getSearchWord());
//    			  jsonObj.put("min", svo.getSearchWord());
//    			  jsonObj.put("max", svo.getSearchWord());
//    			  jsonObj.put("lontion", svo.getSearchWord());
//    			  jsonObj.put("pontion", svo.getSearchWord());
//    			  
//    			  jsonArr.put(jsonObj);
//	    	  }
//
//	         String result = jsonArr.toString();
//	         
//	         return result;
//	      }
	   
	   // 지도 마커용 ajax
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
	   
	   //서브서치 리스트 ajax
	   @RequestMapping(value="/searchRoomOption.go", method= {RequestMethod.GET}, produces="text/plain;charset=UTF-8")
	   @ResponseBody
	   public String searchRoomOption(HttpServletRequest request) {
		   
		   JSONArray jsonArr = new JSONArray();
		   
		   SearchVO rangePrice = service.getRangePrice();
		   List<SearchVO> largeCategoryCode = service.getLargeCategoryCode();
		   List<SearchVO> Lontion = service.getLontion();
		   List<SearchVO> Pontion = service.getPontion();

		   if(rangePrice!=null) {
			   JSONObject jsonObj = new JSONObject();
			   jsonObj.put("minPrice", rangePrice.getMinPrice());
			   jsonObj.put("maxPrice", rangePrice.getMaxPrice());
			   jsonArr.put(jsonObj);
		   }
		   
		   if(largeCategoryCode!=null) {
			   for(SearchVO vo : largeCategoryCode) {
				   JSONObject jsonObj = new JSONObject();
				   jsonObj.put("largeCategoryCode", vo.getLargeCategoryCode());
				   jsonObj.put("largeCategoryName", vo.getLargeCategoryName());

				   jsonArr.put(jsonObj);
			   }
		   }

		   if(Lontion!=null) {
			   for(SearchVO vo : Lontion) {
				   JSONObject jsonObj = new JSONObject();
				   jsonObj.put("lontion", vo.getLontion());
				   
				   jsonArr.put(jsonObj);
			   }
		   }
		   
		   if(Pontion!=null) {
			   for(SearchVO vo : Pontion) {
				   JSONObject jsonObj = new JSONObject();
				   jsonObj.put("pontion", vo.getPontion());
				   
				   jsonArr.put(jsonObj);
			   }
			}
		   
		   
		   String result = jsonArr.toString();
		   return result;
	   }

	   //상세페이지 리뷰 ajax
	   @RequestMapping(value="/hotelReviewList.go", method= {RequestMethod.GET}, produces="text/plain;charset=UTF-8")
	   @ResponseBody
	   public String hotelReviewList(HttpServletRequest request) {
		   
		   JSONArray jsonArr = new JSONArray();
		   
		   HashMap<String, String> paramap = new HashMap<String, String>();
		   paramap.put("hotelidx", request.getParameter("largeCategoryontionCode"));
		   

		   int reviewCnt = service.getReviewCnt(paramap);
		   if(reviewCnt!=-1) {
			   JSONObject jsonObj = new JSONObject();
			   jsonObj.put("reviewCnt", reviewCnt);
			   jsonArr.put(jsonObj);
		   }
		   
		   
		   if(reviewCnt>0) {
		   paramap.put("sort", "regdate desc");
		   System.out.println(paramap.get("sort"));
		   List<HistoryVO> RreviewList = service.getReviewRList(paramap);
		   paramap.remove("sort");
		   paramap.put("sort", "star desc");
		   System.out.println(paramap.get("sort"));
		   List<HistoryVO> SreviewList = service.getReviewSList(paramap);
		   paramap.remove("sort");
		   paramap.put("sort", "star ");
		   List<HistoryVO> sreviewList = service.getReviewsList(paramap);

		   if(RreviewList!=null) {
			   for(HistoryVO vo : RreviewList) {
				   JSONObject jsonObj = new JSONObject();
				   jsonObj.put("RnickName", vo.getName());
				   jsonObj.put("Rpicture", vo.getImg());
				   jsonObj.put("RproductName", vo.getProductName());
				   jsonObj.put("Rtitle", vo.getTitle());
				   jsonObj.put("Rcontent", vo.getContent());
				   jsonObj.put("Rstar", vo.getStar());
//				   String[] imgList = vo.getFileName().split(",");
//				   for(int i=0;i<imgList.length;i++) {
//					   jsonObj.put("RimgList"+i, imgList[i]);
//					   System.out.println(imgList[i]);
//				   }
				   jsonObj.put("RfileName", vo.getFileName());
				   jsonObj.put("Rregdate", vo.getReserveDate());
				   jsonArr.put(jsonObj);
			   }
		   }
		   
		   if(SreviewList!=null) {
			   for(HistoryVO vo : SreviewList) {
				   JSONObject jsonObj = new JSONObject();
				   jsonObj.put("SnickName", vo.getName());
				   jsonObj.put("Spicture", vo.getImg());
				   jsonObj.put("SproductName", vo.getProductName());
				   jsonObj.put("Stitle", vo.getTitle());
				   jsonObj.put("Scontent", vo.getContent());
				   jsonObj.put("Sstar", vo.getStar());
				   jsonObj.put("SfileName", vo.getFileName());
				   jsonObj.put("Sregdate", vo.getReserveDate());
				   
				   jsonArr.put(jsonObj);
			   }
		   }
		   
		   if(sreviewList!=null) {
			   for(HistoryVO vo : sreviewList) {
				   JSONObject jsonObj = new JSONObject();
				   jsonObj.put("snickName", vo.getName());
				   jsonObj.put("spicture", vo.getImg());
				   jsonObj.put("sproductName", vo.getProductName());
				   jsonObj.put("stitle", vo.getTitle());
				   jsonObj.put("scontent", vo.getContent());
				   jsonObj.put("sstar", vo.getStar());
				   jsonObj.put("sfileName", vo.getFileName());
				   jsonObj.put("sregdate", vo.getReserveDate());
				                
				   jsonArr.put(jsonObj);
			   }
		   }
		   
		   }
		   
		   String result = jsonArr.toString();
		   return result;
	   }
}




