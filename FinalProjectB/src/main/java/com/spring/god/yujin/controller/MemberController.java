package com.spring.god.yujin.controller;

import java.io.File;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.spring.god.common.FileManager;
import com.spring.god.common.MyUtil;
import com.spring.god.hyein.model.HotelRoomVO;
import com.spring.god.jiyoung.model.MemberVO;
import com.spring.god.yujin.model.HistoryVO;
import com.spring.god.yujin.model.ReviewImgVO;
import com.spring.god.yujin.model.ReviewVO;
import com.spring.god.yujin.model.SearchVO;
import com.spring.god.yujin.service.InterMemberService;

@Component
@Controller
public class MemberController {
	 @Autowired   
	   private InterMemberService service;
	 
	 @Autowired
	 private FileManager filemanager;
	 
	 @RequestMapping(value="/addHeart.go", method= {RequestMethod.GET})
	   public ModelAndView LoginCK2_addHeart(HttpServletRequest request,HttpServletResponse response,ModelAndView mv) {
	      
	      String largeCategoryontionCode = request.getParameter("largeCategoryontionCode");

	      HttpSession session = request.getSession(); 
	      String memberid = ((MemberVO)session.getAttribute("loginuser")).getMemberId();	
	      String url = (String) session.getAttribute("url");
	      session.removeAttribute("url");
	    		  
	      
	      HashMap<String, String> paramap = new HashMap<String,String>();
	      paramap.put("largeCategoryontionCode", largeCategoryontionCode);
	      paramap.put("memberId", memberid);
	      
	      
	      int org = service.findHeart(paramap);
	      
	      String msg = "";
	      String loc = "javascript:history.back()";
	      if(url != null && url != "") {
	    	  loc = request.getContextPath() + "/search.go";
	      }
	      
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
	   public ModelAndView LoginCK_heartList(HttpServletRequest request,HttpServletResponse response,ModelAndView mv, SearchVO svo) {

		  HttpSession session = request.getSession(); 
		  svo.setMemberid(((MemberVO)session.getAttribute("loginuser")).getMemberId());	
		  
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
	      svo.setTotalPage((int)Math.ceil((double)svo.getTotalCnt()/svo.getSizePerPageHeartList()));
	      svo.setStartRno(((svo.getCurrentShowPage()-1)*svo.getSizePerPageHeartList())+1);
	      svo.setEndRno(svo.getStartRno()+svo.getSizePerPageHeartList()-1);
		      
		  List<HotelRoomVO> hotelRoomVOList = service.heartList(svo);
	      session.setAttribute("hotelRoomVOList", hotelRoomVOList);
	      
	      String pagebar = "<ul>";
	      String url = "/god/heartList.go?";
	      int blockSize = 3;
	      
	      pagebar += MyUtil.makePageBarHeartList(url, svo.getCurrentShowPage(), svo.getSizePerPageSearchList(), svo.getTotalPage(), blockSize);
	      pagebar += "</ul>";
	      
	      String listUrl = MyUtil.getCurrentURL(request);
	      
	      session.setAttribute("listUrl", listUrl);
	      mv.addObject("pagebar",pagebar);
		   mv.setViewName("yujin/heartList.tiles1");
		   return mv;
	   }
	   
	   
	   @RequestMapping(value="/purchasehistory.go", method= {RequestMethod.GET})
	   public ModelAndView LoginCK_purchaseHistory(HttpServletRequest request,HttpServletResponse response,ModelAndView mv) {
		   HttpSession session = request.getSession(); 
		   int memberidx = ((MemberVO)session.getAttribute("loginuser")).getIdx();
		   List<HistoryVO> hvo = service.getPurchaseHistory(memberidx);
		   
		   mv.addObject("purchaseList",hvo);
		   mv.setViewName("yujin/purchaseHistory.tiles1");
		   return mv;
	   }
	   
	   @RequestMapping(value="/reserveCancel.go")
	   public ModelAndView LoginCK_reserveCancel_index(HttpServletRequest request,HttpServletResponse response,ModelAndView mv) {
		   String reserveid = request.getParameter("reserveId");
		   HistoryVO vo = service.getCancelPage(reserveid);

		   mv.addObject("vo",vo);   
		   mv.setViewName("yujin/reserveCancel.tiles1");
		   return mv;
	   }

	   @RequestMapping(value="/earnPoint.go")
	   public ModelAndView LoginCK_earnPoint_index(HttpServletRequest request,HttpServletResponse response,ModelAndView mv) throws Throwable  {
		   
		   HttpSession session = request.getSession();
		   HashMap<String, String> map = new HashMap<String,String>();
		   map.put("idx", String.valueOf(((MemberVO)session.getAttribute("loginuser")).getIdx()));
		   map.put("reserveId", request.getParameter("reserveId"));
		   map.put("point", request.getParameter("price"));
		   System.out.println("dgvszdgsz"+request.getParameter("reserveId"));
		   String msg = "적립에 실패했습니다. 다시 시도해주세요.";
		   String loc = "javascript:history.back()";
		   try {
			   int n = service.getEarnPoint(map);
			   if(n==1)
				   msg = "적립 되었습니다.";
			} catch (Exception e) {
				e.printStackTrace();
			}
		   
		   
		   
		   mv.addObject("msg",msg);
		   mv.addObject("loc",loc);
		   mv.setViewName("tiles1/yujin/msg");
		   
		   return mv;
	   }
	   
	   @RequestMapping(value="/reserveCancelEnd.go")
	   public ModelAndView reserveCancelEnd_index(HttpServletRequest request,HttpServletResponse response,ModelAndView mv) {
		  String reserveid = request.getParameter("reserveId");
		  int n = service.getReserveCancelResult(reserveid);
	      
		  String msg = "";
	      String loc = "/god/purchasehistory.go";
	      
	      if(n!=1) {
	          msg = "예약 취소에 실패했습니다. 다시 시도해주세요.";
	      } else {
	    	  msg = "예약취소 되었습니다.";
	      }
	      
	      mv.addObject("msg",msg);
	      mv.addObject("loc",loc);
	      mv.setViewName("tiles1/yujin/msg");

	      return mv;
	   }

	   @RequestMapping(value="/review.go")
	   public ModelAndView LoginCK_review_index(HttpServletRequest request,HttpServletResponse response,ModelAndView mv, HistoryVO vo) {
		   mv.addObject("vo",vo);   
		   mv.setViewName("yujin/review.tiles1");
		   return mv;
	   }
	   
	   
	   @RequestMapping(value="/reviewEnd.go", method= {RequestMethod.POST})
	//   public String LoginCK_reviewEnd(HttpServletRequest request,HttpServletResponse response,ReviewVO rvo) {
	   public String LoginCK_reviewEnd(HttpServletRequest request,HttpServletResponse response,MultipartHttpServletRequest mrequest,ReviewVO rvo,ReviewImgVO rivo) {
			MultipartFile attach = rvo.getAttach0();
			
			
			System.out.println("attach확인:"+attach);
			
			if(!attach.isEmpty()) { 
				
				HttpSession session = request.getSession();
				String path = "C:" + File.separator + "Users" + File.separator + "user1" + File.separator + "git" + File.separator + "finalProjectB" + File.separator + "FinalProjectB" + File.separator + "src" + File.separator + "main" + File.separator + "webapp" + File.separator + "resources" + File.separator + "images" + File.separator + "review";
				String newFileName = "";
				
				byte[] bytes = null;
				long fileSize = 0;
				
				try {
					bytes = attach.getBytes();
					
					newFileName = filemanager.doFileUpload(bytes, attach.getOriginalFilename(), path);
					
					rvo.setFileName(newFileName);
					rvo.setOrgFileName(attach.getOriginalFilename());
					fileSize = attach.getSize();
					rvo.setFileSize(String.valueOf(fileSize));
					
				} catch (Exception e) {
					e.printStackTrace();
				}
				
			}
		// ========= !!첨부파일이 있는지 없는지 알아오기 끝!! ========= */
			
		   rvo.setContent(MyUtil.replaceParameter(rvo.getContent()).replaceAll("\r\n", "<br/>"));
		   
		   HttpSession session = request.getSession();
		   rvo.setMemberIdx(((MemberVO)session.getAttribute("loginuser")).getIdx());
		   int n = 0;
		   if(attach.isEmpty()) {
			   // 첨부파일이 없는 경우이라면
			   n = service.add(rvo);
		   }
		   else {
			   // 첨부파일이 있는 경우이라면
			   n = service.add_withFile(rvo);
		   }
		   
		   mrequest.setAttribute("n", n);
		   
		   String msg = "작성실패";
		   String loc = "/god/index.go";
		   
		   if(n==1)
			   msg="작성 성공";
		   
		   
		   request.setAttribute("loc", loc);
		   request.setAttribute("msg", msg);
		   
		   return "tiles1/yujin/msg";
		   
	   }
	   
	   @RequestMapping(value="/history.go", method= {RequestMethod.GET})
	   public ModelAndView LoginCK_history(HttpServletRequest request,HttpServletResponse response,ModelAndView mv,ReviewVO rvo) {
		   
		   HttpSession session = request.getSession(); 
		   
		   int memberidx = ((MemberVO)session.getAttribute("loginuser")).getIdx();
		   List<HistoryVO> hvo = service.getHistory(memberidx);
		   
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
	   
	   @RequestMapping(value="/totalGod.go", method= {RequestMethod.GET})
	   public ModelAndView totalGod(HttpServletRequest request,HttpServletResponse response,ModelAndView mv,ReviewVO rvo) {
		   mv.setViewName("yujin/totalGod.tiles1");
		   return mv;
	   }
	   
	   
}
