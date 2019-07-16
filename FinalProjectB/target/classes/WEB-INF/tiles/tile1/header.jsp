<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- ======= #25. tiles1 중 header 페이지 만들기  ======= --%>
<%
	String ctxPath = request.getContextPath();
%>

<div align="center">
	<ul class="nav nav-tabs mynav">
		<li class="dropdown"><a class="dropdown-toggle"
			data-toggle="dropdown" href="#">Home <span class="caret"></span></a>
			<ul class="dropdown-menu">
				<li><a href="<%=ctxPath%>/index.action">Home</a></li>
				<li><a href="#">Submenu 1-2</a></li>
				<li><a href="#">Submenu 1-3</a></li>
			</ul></li>
		<li class="dropdown"><a class="dropdown-toggle"
			data-toggle="dropdown" href="#">게시판 <span class="caret"></span></a>
			<ul class="dropdown-menu">
				<li><a href="<%=ctxPath%>/list.action">목록보기</a></li>
				<li><a href="<%=ctxPath%>/add.action">글쓰기</a></li>
				<li><a href="#">Submenu 1-3</a></li>
			</ul></li>
		<li class="dropdown"><a class="dropdown-toggle"
			data-toggle="dropdown" href="#">로그인 <span class="caret"></span></a>
			<ul class="dropdown-menu">
				<c:if test="${sessionScope.loginuser == null}">
				<li><a href="#">회원가입</a></li>
				<li><a href="<%=ctxPath%>/login.action">로그인</a></li>
				</c:if>
				
				<c:if test="${sessionScope.loginuser != null}">
				<li><a href="<%=ctxPath%>/myinfo.action">나의정보</a></li>
				<li><a href="<%=ctxPath%>/logout.action">로그아웃</a></li>
				</c:if>
			</ul></li>
		
		<li><a href="#">Menu 3</a></li>
		
		<!-- 로그인이 성공되어지면 로그인되어진 사용자의 이메일 주소를 출력하기 -->
		<c:if test="${sessionScope.loginuser != null}">
		<li style="margin-left: 35%; margin-top: 1%;">
		  <span style="color: navy; font-weight: bold; font-size: 10pt;">${sessionScope.loginuser.email}</span> 님
		</li>
		</c:if>
	</ul>
</div>