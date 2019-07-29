package com.spring.god.jiyoung.controller;

import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


import com.spring.god.common.AES256;
import com.spring.god.common.SHA256;
import com.spring.god.jiyoung.model.InterMemberDAO;
import com.spring.god.jiyoung.model.MemberDAO;
import com.spring.god.jiyoung.model.MemberVO;
import com.spring.god.jiyoung.service.InterMemberService;





@Controller
@Component
public class MemberController {
	
	@Autowired
	private InterMemberService service;
	
	private SHA256 sha;
	
	@RequestMapping(value="/register.go", method= {RequestMethod.GET})
	public ModelAndView register(ModelAndView mv) {
		
		mv.setViewName("jiyoung/register.tiles1");
		return mv;
	}

	@RequestMapping(value="/memberidDuplicateCheck.go")
	public ModelAndView idDuplicateCheck(ModelAndView mv, HttpServletRequest request, HttpServletResponse response) {
		String method = request.getMethod();
		String memberId = request.getParameter("memberId");
		
		if("POST".equalsIgnoreCase(method)) {
			if(memberId!=null) {
				boolean isUsememberId = service.isUsememberId(memberId);//트루가 나오면 받아서 사용가능.
				mv.addObject("isUsememberId",isUsememberId);
			}			
		}
		mv.setViewName("tiles1/jiyoung/memberidDuplicateCheck");
		mv.addObject("memberId",memberId);
		mv.addObject("method",method);
		return mv;
	}
	
	@RequestMapping(value="/nicknameDuplicateCheck.go")
	public ModelAndView nickNameDuplicateCheck(ModelAndView mv, HttpServletRequest request, HttpServletResponse response) {
		String method = request.getMethod();
		String nickName = request.getParameter("nickName");
		
		if("POST".equalsIgnoreCase(method)) {
			if(nickName!=null) {
				boolean isUsenickName = service.isUsenickName(nickName);//트루가 나오면 받아서 사용가능.
				mv.addObject("isUsenickName",isUsenickName);
				
			}			
		}
		
		mv.setViewName("tiles1/jiyoung/nicknameDuplicateCheck");
		mv.addObject("nickName",nickName);
		mv.addObject("method",method);
		return mv;
	}
	
	@RequestMapping(value="/emailDuplicateCheck.go")
	public ModelAndView emailDuplicateCheck(ModelAndView mv, HttpServletRequest request, HttpServletResponse response) {
		String method = request.getMethod();
		String email = request.getParameter("email");
		
		if("POST".equalsIgnoreCase(method)) {
			if(email!=null) {
				boolean isUseemail = service.isUseemail(email);//트루가 나오면 받아서 사용가능.
				mv.addObject("isUseemail",isUseemail);
			}			
		}
		
		
		mv.setViewName("tiles1/jiyoung/emailDuplicateCheck");
		mv.addObject("email",email);
		mv.addObject("method",method);
		return mv;
	}
	
	 @ExceptionHandler(java.sql.SQLIntegrityConstraintViolationException.class)// 트랜잭션 처리와 같이 써야 한다.
	   public String handleSQLIntegrityConstraintViolationException(java.sql.SQLIntegrityConstraintViolationException e, HttpServletRequest req) {
		    /*
		           오류 보고 -
	          SQL 오류: ORA-02290: check constraint (MYORAUSER.CK_TX_MEMBER_POINT) violated 	
		     */
		   
		   	System.out.println(">>>>>>>>>>>>>>>"+e.getErrorCode());
		   	// >>>>>>>>>>>>>>>2290
			   	
		   	String msg = "";
			   	
		   	switch (e.getErrorCode()) {
					case 2290:
						msg = "XX";
						break;
				
					default:
						msg = "SQL오류발생 >>오류번호: "+e.getErrorCode();
						break;
				}
			   	    	
			String loc = "/god/index.go";
			req.setAttribute("msg", msg);
			req.setAttribute("loc", loc);
				
			return "tiles1/jiyoung/msg";
	   }
	  
	   
	/*    이거 주석 풀라했는데 왜 주석 하니까 돌아가냐*/
	   @ExceptionHandler(org.springframework.dao.DataIntegrityViolationException.class)
	   public String handleDataIntegrityViolationException(org.springframework.dao.DataIntegrityViolationException e, HttpServletRequest req, HttpServletResponse res) {
	   	
		   	System.out.println(">>>>>>>>>>>>>>>"+e.getMessage());
		   	//String msg = "포인트가 최대치가 되어서 글쓰기가 취소되었습니다.";
		   	String msg = e.getMessage();
				String loc = "/god/index.go";//시작페이지로 가겠다.
				req.setAttribute("msg", msg);
				req.setAttribute("loc", loc);
				
				return "tiles1/jiyoung/msg";
	   }   
	
	@RequestMapping(value="memberInsert.go", method= {RequestMethod.POST})
	public String register(HttpServletRequest request, MemberVO mvo) throws Throwable {
	
		String pwd = request.getParameter("pwd");
		String birthDay = request.getParameter("birthyyyy");
		birthDay += request.getParameter("birthmm");
		birthDay += request.getParameter("birthdd");
		String tel = request.getParameter("hp1");
		tel += request.getParameter("hp2");
		tel += request.getParameter("hp3");
		
		
		
		System.out.println(pwd);
		
		mvo.setBrithDay(birthDay);
		mvo.setTel(tel);
		mvo.setPwd(pwd);
		
		//3. Service 단으로 생성된 DTO(VO)를 넘긴다.
		int n = service.register(mvo);
		
		String msg = "";
		
		if(n>0) 
			msg = "회원가입 성공!!";
		
		else 
			msg = "회원가입 실패!!";
		
		String loc = request.getContextPath()+"/index.go";
		
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		
		return "tiles1/jiyoung/msg";
				
	}
	
	// 로그인 페이지 띄우기
	@RequestMapping(value="jiyoung/login.go")
	public ModelAndView login(ModelAndView mv) {
		
		mv.setViewName("jiyoung/login.tiles1");
		
		return mv;
	}
	
	// 로그인 하기
	@RequestMapping(value="jiyoung/loginEnd.go", method= {RequestMethod.POST})
	public ModelAndView loginEnd(ModelAndView mv , HttpServletRequest request, MemberVO mvo) throws UnsupportedEncodingException, GeneralSecurityException {
		
		String userid = request.getParameter("userid");
		String pwd = request.getParameter("pwd");		
		
		HashMap<String, String> paraMap = new HashMap<String, String>();
		paraMap.put("userid", userid);
		paraMap.put("pwd", SHA256.encrypt(pwd));		
		
		mvo = service.getLoginMember(paraMap);
		////////////////////////////////////////////////////////
		HttpSession session = request.getSession();
		
		if(mvo == null) {
			String msg = "아이디 또는 암호가 틀립니다";
			String loc = "javascript:history.back()";
			
			mv.addObject("msg", msg);
			mv.addObject("loc", loc);
			mv.setViewName("msg");
			
		}
		else {
			session.setAttribute("loginuser", mvo);
			if(session.getAttribute("gobackURL") != null) {
				
				
				String gobackURL = (String)session.getAttribute("gobackURL");
				mv.addObject("gobackURL", gobackURL);
				
				session.removeAttribute("gobackURL");
			
		}
			mv.setViewName("main/index.tiles1");
			
			}
			
		return mv;
		}

	
	
	
	// 로그아웃 하기
		@RequestMapping(value="jiyoung/logout.go")
		public ModelAndView logout(ModelAndView mv , HttpServletRequest request) {
			
			HttpSession session = request.getSession();
			session.invalidate(); 

				String msg = "로그아웃 되었습니다";
				String loc = request.getContextPath()+"/index.go";
						
				mv.addObject("msg", msg);
				mv.addObject("loc", loc);
				mv.setViewName("jiyoung/msg.tiles1");
				
			return mv;
		}
	

}
	

	
	
	

	
