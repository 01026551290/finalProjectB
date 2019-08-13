<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.net.InetAddress"%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<% String ctxPath = request.getContextPath(); 


// === 서버 IP 주소 알아오기 ===
InetAddress inet = InetAddress.getLocalHost();
 String serverIP = inet.getHostAddress();
//	String serverIP = "192.168.50.16";

// === 서버 포트번호 알아오기 ===
int portnumber = request.getServerPort();		

String serverName = "http://"+serverIP+":"+portnumber;
%>    
<script type="text/javascript" src="<%= ctxPath%>/resources/js/jquery-3.3.1.min.js"></script>
<style type="text/css">
	
	table, th, td { border: solid 1px gray; }
    
	#table {width: 1800px; border-collapse: collapse;}
	#table th, #table td {padding: 5px;}
	#table th { background-color: #DDD; }
	.subjectStyle { font-weight: bold; color: navy; cursor: pointer; }
	
	

  .topnav {
  background-color: #333;
  overflow: hidden;
}

/* Style the links inside the navigation bar */
.topnav a {
  float: left;
  color: #f2f2f2;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
  font-size: 17px;
}

/* Change the color of links on hover */
.topnav a:hover {
  background-color: #ddd;
  color: black;
}

/* Add a color to the active/current link */
.topnav a.active {
  background-color: #4CAF50;
  color: white;
}
   

</style>

<section class="site-hero inner-page overlay" style="background-image: url(/god/resources/images/hero_4.jpg)" data-stellar-background-ratio="0.5">
      <div class="container">
        <div class="row site-hero-inner justify-content-center align-items-center">
          <div class="col-md-10 text-center" data-aos="fade">
            <h1 class="heading mb-3">예약 관리</h1>
            <ul class="custom-breadcrumbs mb-4">
            </ul>
          </div>
        </div>
      </div>

      <a class="mouse smoothscroll" href="#next">
        <div class="mouse-icon">
          <span class="mouse-wheel"></span>
        </div>
      </a>
    </section>
    <!-- END section -->

<div class="topnav" style="margin: 20px 0;">
  <a class="active" href="<%= request.getContextPath() %>/admin_manager.go">Home</a>
  <a href="<%= request.getContextPath() %>/admin_memberManage.go">회원관리</a>
  <a href="<%= request.getContextPath() %>/admin_reserveManage.go">예약관리</a>
  <a href="<%= request.getContextPath() %>/admin_productManage.go">상품관리</a>
  <a href="<%= request.getContextPath() %>/admin_inquiryBoardList.go">문의사항</a>
  <a href="<%= serverName%><%=ctxPath%>/admin_chatting.go">회의</a>
</div>

  
<div align="center" style="margin: 50px 0;">
	<h2 style="margin-bottom: 20px; cursor: pointer;" onclick="javascript:location.href='<%= request.getContextPath() %>/admin_reserveManage.go'">예약 목록</h2>
	
	<table id="table">
		<tr>
			<th style="width: 70px; text-align: center;">예약번호</th>
			<th style="width: 30px; text-align: center;">호텔명</th>
			<th style="width: 50px; text-align: center;">객실명</th>
			<th style="width: 50px; text-align: center;">예약금액</th>
			<th style="width: 180px; text-align: center;">예약일</th>
			<th style="width: 180px; text-align: center;">체크인</th>
			<th style="width: 180px; text-align: center;">체크아웃</th>
			<th style="width: 180px; text-align: center;">체크아웃하기</th>
			
		</tr>	
			 <c:forEach var="reservevo" items="${reservevoList}" varStatus="status"> 
		<tr>
				 	<td align="center">${reservevo.reserveId}</td>
				 	<td align="center">${reservevo.name}</td>
				 	<td align="center">${reservevo.productName}</td>
				 	<td align="center">${reservevo.price}</td>
				 	<td align="center">${reservevo.reserveDate}</td>
				 	<td align="center">${reservevo.checkIn}</td>
				 	<td align="center">${reservevo.checkOut}</td>
				 	<td align="center"><span style="cursor: pointer;" onclick="javascript:location.href='<%= request.getContextPath() %>/admin_checkOut.go?reserveId=${reservevo.reserveId}'" >체크아웃</span></td>
						
		</tr>
			</c:forEach> 
	</table>
	
	<form name="goViewFrm">
		<input type="hidden" name="seq" />
	</form>
	
	<!-- #120 페이지바 보여주기 -->
	<div align="center" style="width: 70%; border: 0px solid gray; margin-top: 10px;">${pagebar}</div>
	
	<!-- #96 글 검색 폼 추가하기: 글제목,글쓴이로 검색하도록 한다. -->
	<form name="searchFrm" style="">
		<select name="searchType" id="searchType">
			<option value="idx" selected="selected">회원번호</option>
			<option value="memberid">아이디</option>
			<option value="nickname">닉네임</option>
			<option value="name">성명</option>
			<option value="email">이메일</option>
			<option value="tel">연락처</option>
		</select>
		<input type="text" name="searchWord" id="searchWord" autocomplete=off  style="width: 300px;"  />
		<button type="button" onclick="goSearch();">검색</button>
	</form>
</div>        