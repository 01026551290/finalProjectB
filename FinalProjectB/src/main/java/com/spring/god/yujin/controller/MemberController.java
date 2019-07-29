package com.spring.god.yujin.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.spring.god.common.MyUtil;
import com.spring.god.hyein.model.HotelRoomVO;
import com.spring.god.yujin.model.HistoryVO;
import com.spring.god.yujin.model.ReviewVO;
import com.spring.god.yujin.service.InterMemberService;

@Component
@Controller
public class MemberController {
	 @Autowired   
	   private InterMemberService service;
	 
	 @RequestMapping(value="/addHeart.go", method= {RequestMethod.GET})
	   public ModelAndView LoginCK_addHeart(HttpServletRequest request,HttpServletResponse response,ModelAndView mv) {
	      
	      String largeCategoryontionCode = request.getParameter("largeCategoryontionCode");
	      
//	      HttpSession session = request.getSession();
//	      String memberId = session.getAttribute("loginuser")!=null?((HashMap<String, Object>) session.getAttribute("loginuser")).FK_MEMBERID():"";
	      
	      HashMap<String, String> paramap = new HashMap<String,String>();
	      paramap.put("largeCategoryontionCode", largeCategoryontionCode);
	      paramap.put("memberId", "GODJINSOO1");
	      
	      
	      int org = service.findHeart(paramap);
	      
	      String msg = "";
	      String loc = "javascript:history.back()";
	      if(org!=1) {
	    	  int add = service.addHeart(paramap);
	          msg = "찜 실패";
	          
	          if(add==1)
	        	  msg="찜 해둠";
	      } else {
	    	  int del = service.delHeart(paramap);
	    	  msg = "찜 뺌!";
	    	  
	    	  if(del==1)
	    		  msg="찜빼기실패!";
	      }
	      
	      mv.addObject("msg",msg);
	      mv.addObject("loc",loc);
	      mv.setViewName("tiles1/yujin/msg");

	      return mv;
	   }
	   
	   @RequestMapping(value="/heartList.go", method= {RequestMethod.GET})
	   public ModelAndView LoginCK_heartList(HttpServletRequest request,HttpServletResponse response,ModelAndView mv) {

		   List<HotelRoomVO> hotelRoomVOList = service.heartList("GODJINSOO1");
	      List<String> heartNoList = service.heartNo("GODJINSOO1");
	      mv.addObject("heartNoList",heartNoList);
	      HttpSession session = request.getSession();
	      session.setAttribute("hotelRoomVOList", hotelRoomVOList);
	      
		   mv.setViewName("yujin/heartList.tiles1");
		   return mv;
	   }
	   
	   @RequestMapping(value="/review.go", method= {RequestMethod.GET})
	   public ModelAndView LoginCK_review(HttpServletRequest request,HttpServletResponse response,ModelAndView mv) {
		   
		   mv.setViewName("yujin/review.tiles1");
		   return mv;
	   }
	   
	   
	   @RequestMapping(value="/reviewEnd.go", method= {RequestMethod.POST})
	   public String LoginCK_reviewEnd(HttpServletRequest request,ReviewVO rvo) {
	//   public String LoginCK_reviewEnd(MultipartHttpServletRequest mrequest,ReviewVO rvo) {
//			MultipartFile attach = rvo.getAttach();
//			
//			System.out.println("attach확인:"+attach);
//			
//			if(!attach.isEmpty()) { 
//				
//				HttpSession session = request.getSession();
//				String root = session.getServletContext().getRealPath("/");
//				String path = root + "resources" + File.separator + "review";
//				
//				System.out.println(">>> 확인용 path ==> " + path);
//				
//				String newFileName = "";
//				
//				byte[] bytes = null;
//				long fileSize = 0;
//				
//				try {
//					bytes = attach.getBytes();
//					
//					newFileName = FileManager.doFileUpload(bytes, attach.getOriginalFilename(), path);
//					
//					System.out.println(">>> 확인용 : newFileName ==> " + newFileName);
//					
//					rvo.setFilename(newFileName);
//					
//					rvo.setOrgfilename(attach.getOriginalFilename());
	// 
//					fileSize = attach.getSize();
//					rvo.setFilesize(String.valueOf(fileSize));
//					
//				} catch (Exception e) {
//					e.printStackTrace();
//				}
//				
//			}
		// ========= !!첨부파일이 있는지 없는지 알아오기 끝!! ========= */
			
		   rvo.setContent(MyUtil.replaceParameter(rvo.getContent()).replaceAll("\r\n", "<br/>"));
		   System.out.println(rvo.getContent());
		   System.out.println(rvo.getTitle());
		   System.out.println(rvo.getStar());
		   
		   int n = service.add(rvo);
	//
//		   int n = 0;
//		   if(attach.isEmpty()) {
//			   // 첨부파일이 없는 경우이라면
//			   n = service.add(rvo);
//		   }
//		   else {
//			   // 첨부파일이 있는 경우이라면
//			   n = service.add_withFile(rvo);
//		   }
//		   
//		   mrequest.setAttribute("n", n);
		   
		   String msg = "작성실패";
		   String loc = "/god/index.go";
		   
		   if(n==1)
			   msg="작성 성공";
		   
		   
		   request.setAttribute("loc", loc);
		   request.setAttribute("msg", msg);
		   
		   return "tiles1/yujin/msg";
		   
	   }
	   
	   @RequestMapping(value="/history.go", method= {RequestMethod.GET})
	   public ModelAndView LoginCK_history(ModelAndView mv,HttpServletRequest request,ReviewVO rvo) {
		   
		   int memberidx = 5;
		   List<HistoryVO> hvo = service.getHistory(memberidx);
		   
		   HttpSession session = request.getSession();
		   session.setAttribute("historyVOList", hvo);
		      
		    mv.addObject("hvo",hvo);
		   mv.setViewName("yujin/history.tiles1");
		   return mv;
	   }
	   /*
	   @RequestMapping(value = "/reservelist.go", method = {RequestMethod.GET})
	   public ModelAndView LoginCK_reserveList(HttpServletRequest request,HttpServletResponse response,ModelAndView mv) {
		   
		   
		   mv.setViewName("yujin/reserveList.tiles1");
		   return mv;
	   }
	   */
}
