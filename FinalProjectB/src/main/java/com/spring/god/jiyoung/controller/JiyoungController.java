package com.spring.god.jiyoung.controller;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.request;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.spring.god.jiyoung.model.MemberVO;
import com.spring.god.jiyoung.service.InterJiyoungService;




@Controller
@Component
public class JiyoungController {
	
	@Autowired
	private InterJiyoungService service;
	
	
	@RequestMapping(value="/register.go", method= {RequestMethod.GET})
	public ModelAndView register(ModelAndView mv) {
		
		mv.setViewName("jiyoung/register.tiles1");
		return mv;
	}

	@RequestMapping(value="/idDuplicateCheck.go", method= {RequestMethod.POST})
	public ModelAndView idDuplicateCheck(ModelAndView mv, HttpServletRequest request) {
		
		String NICKNAME = request.getParameter("NICKNAME");
		
		return mv;
	}
	
	@RequestMapping(value="/nicknameDuplicateCheck.go", method= {RequestMethod.POST})
	public ModelAndView nicknameDuplicateCheck(ModelAndView mv, HttpServletRequest request) {
		
		String NICKNAME = request.getParameter("NICKNAME");
		
		return mv;
	}
	
	@RequestMapping(value="/emailDuplicateCheck.go", method= {RequestMethod.POST})
	public ModelAndView emailDuplicateCheck(ModelAndView mv, HttpServletRequest request) {
		
		String NICKNAME = request.getParameter("EMAIL");
		
		return mv;
	}
	
	@RequestMapping(value="memberInsert.go", method= {RequestMethod.POST})
	public String register(HttpServletRequest request) {
		
		//1. form 에서 넘어온 값 받기
		String NAME = request.getParameter("NAME");
		String MEMBERID =request.getParameter("MEMBERID");
		String PWD =request.getParameter("PWD");
		String NICKNAME =request.getParameter("NICKNAME");
		String EMAIL =request.getParameter("EMAIL");
		String GENDER =request.getParameter("GENDER");		
		
		// 2. DTO(VO)에 넣어준다.
		MemberVO mvo = new MemberVO();
		mvo.setNAME(NAME);
		mvo.setMEMBERID(MEMBERID);
		mvo.setPWD(PWD);
		mvo.setNICKNAME(NICKNAME);
		mvo.setEMAIL(EMAIL);
		mvo.setGENDER(Integer.parseInt(GENDER));
		
		//3. Service 단으로 생성된 DTO(VO)를 넘긴다.
		int n = service.register(mvo);
		
		String msg = "";
		String loc = "";
		
		if(n>0) {
			msg = "회원가입 성공!!";
			loc = request.getContextPath()+"/index.go";
		}
		else {
			msg = "회원가입 실패!!";
			loc = request.getContextPath()+"/index.go";
		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		
		return "tiles1/jiyoung/msg";
				
	}
}
	
