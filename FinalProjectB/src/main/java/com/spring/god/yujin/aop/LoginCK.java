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
//   @Pointcut("execution(public * com.spring.god..*Controller.LoginCK_*(..))")
//   public void loginCK() {}
//   
//   @Before("loginCK()")
//   public void before(JoinPoint joinPoint) {
//      HttpServletRequest request = (HttpServletRequest)joinPoint.getArgs()[0];
//      HttpServletResponse response = (HttpServletResponse)joinPoint.getArgs()[1];
//      
//      HttpSession session = request.getSession();
//      
//      try {
//         if(session.getAttribute("loginuser")==null) {
//            String msg = "로그인 후 이용가능";
//            String loc = request.getContextPath()+"/login.go";
//            request.setAttribute("msg", msg);
//            request.setAttribute("loc", loc);
//            
//         }
//         String url = MyUtil.getCurrentURL(request);
//         
//         session.setAttribute("backURL", url);
//         
//         RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/tiles1/yujin/msg.jsp");
//         dispatcher.forward(request, response);
//         
//      } catch (ServletException|IOException e) {
//         e.printStackTrace();
//      }
//      
//   }
}