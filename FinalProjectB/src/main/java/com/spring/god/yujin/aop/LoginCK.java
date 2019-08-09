package com.spring.god.yujin.aop;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

import com.spring.god.common.MyUtil;

@Aspect
@Component
public class LoginCK {
   @Pointcut("execution(public * com.spring.god..*Controller.LoginCK_*(..))")
   public void loginCK() {
   }

   @Before("loginCK()")
   public void before(JoinPoint joinPoint) {
      HttpServletRequest request = (HttpServletRequest) joinPoint.getArgs()[0];
      HttpServletResponse response = (HttpServletResponse) joinPoint.getArgs()[1];

      HttpSession session = request.getSession();

      try {
         if (session.getAttribute("loginuser") == null) {
            String msg = "로그인 후 이용가능";
            String loc = request.getContextPath() + "/login.go";
            request.setAttribute("msg", msg);
            request.setAttribute("loc", loc);

            String url = MyUtil.getCurrentURL(request);
            System.out.println(url);
            session.setAttribute("gobackURL", url);
   
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/tiles1/yujin/msg.jsp");
            dispatcher.forward(request, response);
         }

      } catch (ServletException | IOException e) {
         e.printStackTrace();
      }

   }
   
   // 위는 ?뒤 내용 삭제 // 아래는 ?뒤 내용 삽입
   
   @Pointcut("execution(public * com.spring.god..*Controller.LoginCK2_*(..))")
   public void loginCK2() {
   }
   
   @Before("loginCK2()")
   public void before2(JoinPoint joinPoint) {
	   HttpServletRequest request = (HttpServletRequest) joinPoint.getArgs()[0];
	   HttpServletResponse response = (HttpServletResponse) joinPoint.getArgs()[1];
	   
	   HttpSession session = request.getSession();
	   
	   try {
		   if (session.getAttribute("loginuser") == null) {
			   request.setAttribute("msg", "로그인 후 이용가능");
			   request.setAttribute("loc", request.getContextPath() + "/login.go");
			   
			   String url = MyUtil.getCurrentURLNext(request);
			   session.setAttribute("gobackURL", url);

			   RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/tiles1/yujin/msg.jsp");
			   dispatcher.forward(request, response);
		   } else {
			   session.setAttribute("url", "url");
		   }

		   
	   } catch (ServletException | IOException e) {
		   e.printStackTrace();
	   }
	   
   }
   
   @Pointcut("execution(public * com.spring.god..*Controller.*_index(..))")
   public void index() {
   }
   
   @Before("index()")
   public void index(JoinPoint joinPoint) {
	   HttpServletRequest request = (HttpServletRequest) joinPoint.getArgs()[0];
	   HttpServletResponse response = (HttpServletResponse) joinPoint.getArgs()[1];
	   
	   String method = request.getMethod();
	   
	   try {
		   if ("get".equalsIgnoreCase(method)) {
			   request.setAttribute("msg", "잘못된 접근입니다.");
			   request.setAttribute("loc", request.getContextPath() + "/index.go");
			   
			   RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/tiles1/yujin/msg.jsp");
			   dispatcher.forward(request, response);
		   }		   
		   
	   } catch (ServletException | IOException e) {
		   e.printStackTrace();
	   }
	   
   }
}