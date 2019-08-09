package com.spring.god.jiyoung.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.util.HashMap;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
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
import com.spring.god.common.SHA256;
import com.spring.god.hyein.model.PhotoVO;
import com.spring.god.jiyoung.model.MemberDAO;
import com.spring.god.jiyoung.model.MemberVO;
import com.spring.god.jiyoung.service.InterMemberService;

@Controller
public class MemberController {
	
	@Autowired
	private InterMemberService service;
	
	@Autowired	
	private FileManager fileManager;
	
	private SHA256 sha;

	private MemberVO vo;	
	
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
	   
	   // 마이페이지 전 암호 확인 페이지 매핑
	   @RequestMapping(value="/pwdpass.go")
		public ModelAndView loginCK_pwdpass(HttpServletRequest request,HttpServletResponse response,ModelAndView mv) {
			mv.setViewName("jiyoung/pwdpass.tiles1");
			return mv;
		}	   
	
	   /*회원가입*/
	@RequestMapping(value="memberInsert.go", method= {RequestMethod.POST})
	public String register(HttpServletRequest request, MemberVO mvo) throws Throwable {
	
		String pwd = request.getParameter("pwd");
		pwd = SHA256.encrypt(pwd);
		String birthDay = request.getParameter("birthyyyy");
		birthDay += request.getParameter("birthmm");
		birthDay += request.getParameter("birthdd");
		String tel ="010"+request.getParameter("hp2")+request.getParameter("hp3");
		
		mvo.setPwd(pwd);
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
	@RequestMapping(value="/login.go")
	public ModelAndView login(ModelAndView mv) {
		
		mv.setViewName("jiyoung/login.tiles1");
		
		return mv;
	}
	
	// 로그인 하기
	   @RequestMapping(value="/loginEnd.go", method= {RequestMethod.POST})
	   public ModelAndView loginEnd(ModelAndView mv , HttpServletRequest request) throws UnsupportedEncodingException, GeneralSecurityException {
	      
	      String userid = request.getParameter("userid");
	      String pwd = request.getParameter("pwd");      
	      
	      HashMap<String, String> paraMap = new HashMap<String, String>();
	      paraMap.put("userid", userid);
	      paraMap.put("pwd", SHA256.encrypt(pwd));      
	      
	      MemberVO mvo = service.getLoginMember(paraMap);
	      ////////////////////////////////////////////////////////
	      HttpSession session = request.getSession();
	      
	      if(mvo == null) {
	         String msg = "아이디 또는 암호가 틀립니다";
	         String loc = "javascript:history.back()";
	         
	         mv.addObject("msg", msg);
	         mv.addObject("loc", loc);
	         mv.setViewName("tiles1/jiyoung/msg");
	         
	      }
	      else {
	         session.setAttribute("loginuser", mvo);
	         if(session.getAttribute("gobackURL") != null) {
	            
	            
	            String gobackURL = (String)session.getAttribute("gobackURL");
	            mv.addObject("gobackURL", gobackURL);
	            
	            session.removeAttribute("gobackURL");
	         
	      }
	         mv.setViewName("tiles1/jiyoung/loginEnd");
	         
	         }
	         
	      return mv;
	      }	
	
	// 로그아웃 하기
		@RequestMapping(value="/logout.go")
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
	
		// 아이디 찾기
		@RequestMapping(value="/idFind.go", method= {RequestMethod.GET})
		public ModelAndView idFind(ModelAndView mv , HttpServletRequest request) {						
				mv.addObject("method","GET");
				mv.setViewName("tiles1/jiyoung/idFind");
			return mv;
		}
		
		// 아이디 찾기
		@RequestMapping(value="/idFindEnd.go", method= {RequestMethod.POST})
		public ModelAndView idFindEnd(ModelAndView mv , HttpServletRequest request) {						
			
			String name = request.getParameter("name");
			String email  = request.getParameter("email");
			
			HashMap<String, String> paraMap = new HashMap<String, String>();
			paraMap.put("name", name);
			paraMap.put("email", email);
			
			String idFind = service.getidFind(paraMap);
			
			mv.addObject("method","POST");
			mv.addObject("name",name);
			mv.addObject("email",email);
			mv.addObject("idFind",idFind);
			mv.setViewName("tiles1/jiyoung/idFind");
//				mv.setViewName("jiyoung/login.tiles1");
				
			
			return mv;
		}		

		
		
		// 비밀번호 찾기
		@RequestMapping(value="/pwdFind.go", method= {RequestMethod.GET})
		public ModelAndView pwdFind(ModelAndView mv , HttpServletRequest request, HttpServletRequest response) {						
				mv.addObject("method","GET");
				mv.setViewName("tiles1/jiyoung/pwdFind");
			return mv;
		}	
		
		// 비밀번호 찾기
		@RequestMapping(value="/pwdFindEnd.go", method= {RequestMethod.POST})
		public ModelAndView pwdFindEnd(ModelAndView mv , HttpServletRequest request) {						
			
			mv.addObject("method","POST"); // 인증코드 인증하기 위해서 post로 바꿔줌.
			
			// 인증 폼에서 입력한 userid와 email을 받아옴.
			String userid = request.getParameter("userid");
			String email  = request.getParameter("email");

			HashMap<String, String> paraMap = new HashMap<String, String>();
			paraMap.put("userid", userid);
			paraMap.put("email", email);
			
			boolean isUserExists = service.isUserExists(paraMap);
			
			
			int n = 0;	
			
			// 회원이 존재하는 경우
			if(isUserExists) {
				n = 1; // n을 1로 바꾸겠다.
				
				GoogleMail mail = new GoogleMail();					
				// 인증키를 랜덤하게 생성하도록 한다.
				Random rnd = new Random();						
				String certificationCode = "";
										
				char randchar = ' ';
				for(int i=0; i<5; i++) {
					randchar = (char) (rnd.nextInt('z' - 'a' + 1) + 'a'); 
					certificationCode += randchar;
				}
				
				int randnum = 0;
				for (int i=0; i<7; i++) {
					randnum = rnd.nextInt(9-0+1)+0;
					certificationCode += randnum;
				}
				
				// 랜덤하게 생성한 인증코드를 비밀번호 찾기를 하고자 하는 사용자의 email로 전송시킨다.
				HttpSession session = request.getSession();
				try {
					mail.sendmail(email, certificationCode);

					session.setAttribute("certificationCode", certificationCode); // 자바에서 발급한 인증코드를 세션에 저장			
					request.setAttribute("email", email); // 유저가 써둔 email을 유지시키기 위함.
					
				} catch(Exception e) {
					e.printStackTrace();
					n = -1;
					request.setAttribute("sendMailFailMsg", "메일 발송에 실패했습니다.");
				}
			}// end of if--------------
			// 회원으로 존재하지 않는 경우
			else {
				n= 0;
			}//end of else-------------
			
			mv.addObject("pwdFind","pwdFind");
			mv.addObject("userid",userid);
			mv.addObject("email",email);
			mv.addObject("n",n);
			mv.setViewName("tiles1/jiyoung/pwdFind");					
			return mv;
			
	} // end of 비밀번호 찾기 ---------------
				
		
		
		
	@RequestMapping(value="/verifyCertificationFrm.go", method= {RequestMethod.POST})
	public ModelAndView VerifyCertificationAction(ModelAndView mv, HttpServletRequest request){	
		
		String userid = request.getParameter("userid"); /* 데이터베이스에서 업뎃해야 돼서 받아옴. */
		String userCertificationCode = request.getParameter("userCertificationCode");
		
		HttpSession session = request.getSession();
		String certificationCode = (String) session.getAttribute("certificationCode");
		session.removeAttribute("certificationCode");
		
		String msg = "";
		String loc = "";

		if(certificationCode.equals(userCertificationCode)) { //유저가 보낸 코드와 같다라면
			msg = "인증성공 되었습니다.";
			loc = request.getContextPath() + "/pwdConfirm.go?userid="+userid; // 겟 방식으로 보내줌.
		}
		else {
			msg = "발급된 인증코드가 아닙니다. 인증코드를 다시 발급받으세요!!";
			loc = request.getContextPath() + "/pwdFind.go"; /* 처음부터 해라. */
		}
		
		mv.addObject("msg",msg);
		mv.addObject("loc",loc);
		mv.setViewName("/tiles1/jiyoung/msg");
		
		return mv;
		
	} // end of 인증번호 인증 ------------------
	

	
	// 패스워드 변경을 위한 페이지를 띄워줘야 됨.
	// 강사님은 한 페이지에서 해결했는데, 그건 이클립스라서 아무 방식이나 받기 때문임.
	// 근데 스프링에서는 한 메서드에 한 request 방식만 받기 때문에, 나눠줘야 함.
	@RequestMapping(value="/pwdConfirm.go", method= {RequestMethod.GET})
	public ModelAndView PwdConfirmAction(ModelAndView mv, HttpServletRequest request){
		
		String userid = request.getParameter("userid");
		request.setAttribute("userid", userid);
		
		mv.setViewName("tiles1/jiyoung/pwdConfirm");
		return mv;
	}
	
	// 인증 후 패스워드 변경하는 곳 (바로 위의 PwdConfirmAction 에서 이어지는 것임.)
	@RequestMapping(value="/PwdConfirmEnd.go", method= {RequestMethod.POST})
	public ModelAndView PwdConfirmActionEnd(ModelAndView mv, HttpServletRequest request){
		
		String userid = request.getParameter("userid");
		String pwd = request.getParameter("pwd");
		
		HashMap<String, String> paraMap = new HashMap<String, String>();
		paraMap.put("userid", userid);
		paraMap.put("pwd",SHA256.encrypt(pwd));
			
		int n = service.updatePwdUser(paraMap);
		mv.addObject("n", n);	
		mv.addObject("method", "POST");

		mv.addObject("userid", userid);
	
		mv.setViewName("tiles1/jiyoung/pwdConfirm");
		return mv;	
	}
	
		@RequestMapping(value="/mypage.go")
		public ModelAndView loginCK_mypage(HttpServletRequest request,HttpServletResponse response,ModelAndView mv) {
			
			mv.setViewName("jiyoung/mypage.tiles1");
			
			return mv;
		}
		
		
	/*	@RequestMapping(value="/memberEdit.go")
		public ModelAndView memberEdit(ModelAndView mv,HttpServletRequest request,MemberVO vo) {
			HttpSession session = request.getSession();
			vo = (MemberVO)session.getAttribute("loginuser");
			
			int idx = vo.getIdx();
			
			vo = service.memberEdit(idx);
			
			mv.addObject("vo",vo);
			mv.setViewName("jiyoung/memberEdit.tiles1");
			return mv;
		}*/
		
		
		@RequestMapping(value="/memberedit.go")
		public String loginCK_memberEdit(HttpServletRequest request,HttpServletResponse response, MemberVO vo) {
			HttpSession session = request.getSession();
			vo = (MemberVO)session.getAttribute("loginuser");
			
			
			int idx = vo.getIdx();
//			System.out.println("getIdx() : " + idx);
			vo = service.memberEdit(idx);
			
			request.setAttribute("vo", vo);
			
			return "jiyoung/memberEdit.tiles1";
		}
		
		@RequestMapping(value="/memberEditEnd.go", method= {RequestMethod.POST})
		public ModelAndView loginCK_memberEditEnd(HttpServletRequest request,HttpServletResponse response, ModelAndView mv, MemberVO vo) {
			
			String pwd = request.getParameter("pwd");
			String tel ="010"+request.getParameter("hp2")+request.getParameter("hp3");
			String nickName = request.getParameter("nickName");
			String email = request.getParameter("email");
			
			vo.setPwd(SHA256.encrypt(pwd));
			vo.setTel(tel);
			vo.setNickName(nickName);
			vo.setEmail(email);
			
			
			int n = service.memberEditEnd(vo);
			
			String msg = "";
			
			if(n>0) 
				msg = "회원수정 성공!!";
			
			else 
				msg = "회원수정 실패!!";
			
			String loc = request.getContextPath()+"/mypage.go";
			
			request.setAttribute("msg", msg);
			request.setAttribute("loc", loc);
			
			mv.setViewName("tiles1/jiyoung/msg");
			
			return mv;
		}		
	
		@RequestMapping(value="/memberout.go")
		public ModelAndView loginCK_memberout(HttpServletRequest request,HttpServletResponse response,ModelAndView mv) {
			
			mv.setViewName("jiyoung/memberout.tiles1");
			
			return mv;
		}
		@RequestMapping(value="/memberoutEnd.go")
		public ModelAndView loginCK_memberoutEnd(HttpServletRequest request, HttpServletResponse response, ModelAndView mv) {
			
			String memberid = request.getParameter("memberId");
			String pwd = request.getParameter("pwd");
			pwd =  SHA256.encrypt(pwd);
			HashMap<String, String> paraMap = new HashMap<String, String>();
			paraMap.put("memberId", memberid);
			paraMap.put("pwd", pwd);
			
			int n = service.memberout(paraMap);
			System.out.println(n);
			String msg = "";
			
			if(n>0) 
				msg = "회원탈퇴 성공!!";
			
			else 
				msg = "회원탈퇴 실패!!";
			
			String loc = request.getContextPath()+"/index.go";
			
			request.setAttribute("msg", msg);
			request.setAttribute("loc", loc);
			
			mv.setViewName("tiles1/jiyoung/msg");
			
			return mv;
		}
	
		@RequestMapping(value="/photoaddedit.go")
		public ModelAndView photoaddedit(HttpServletRequest request,HttpServletResponse response,ModelAndView mv) {
			
			mv.setViewName("jiyoung/photoaddedit.tiles1");
			
			return mv;
		}
		
		@RequestMapping(value="/photoaddeditEnd.go", method= {RequestMethod.POST})
		public String photoaddeditEnd(MemberVO membervo, MultipartHttpServletRequest mrequest,HttpServletRequest request) {
			System.out.println("시작");
			HttpSession session = request.getSession();
			MultipartFile attach = membervo.getAttach();
			MemberVO membervo2 = (MemberVO)session.getAttribute("loginuser");
			System.out.println(attach);
			 if(!attach.isEmpty()) {
				 session = request.getSession();
				 String root  = session.getServletContext().getRealPath("/");
				 System.out.println("0. " + root);
				 String path = root + "resources" + File.separator + "images"+ File.separator +"member";
				 
				 System.out.println("1. " + path);
				 String newFileName = "";
				 	
				 	byte[] bytes = null;
				 	
				 	try {
						bytes = attach.getBytes();
						newFileName = fileManager.doFileUpload(bytes, attach.getOriginalFilename(), path);
						
						System.out.println(">>> 확인용 newFileName == > "+newFileName);
						membervo2.setPicture(attach.getOriginalFilename());
						
					} catch (Exception e) {
						e.printStackTrace();
					}
				 
			 }
			 //=====!!첨부파일이 있는지 없는지 알아오기 끝!!  =====
			 
			 int n = 0;
			 
			

			 System.out.println(membervo2.getMemberId());
			 n = service.add_withFile(membervo2);
			 String msg = "업로드 실패!";
			 String loc = "/god/mypage.go";
			 if(n == 1 ) 
				 msg = "수정되었습니다!";
			
			 request.setAttribute("msg", msg);
			 request.setAttribute("loc", loc);
			 
			 System.out.println(n);
			 return "tiles1/jiyoung/msg";
		}
		
		/*@RequestMapping(value = "/getPic", method = RequestMethod.GET)
	    public String getPic(String pic_no, HttpServletRequest request) {
	        
	        MemberVO picVO = new MemberVO();
	        picVO = MemberDAO.getImage(pic_no);          // 이미지 정보 가져오기
	        String path = MemberVO.getPic_path();   // 이미지 경로
	        request.setAttribute("path", path);
	        
	        return "/image";
	    }
	*/

		
}
	
	

	
