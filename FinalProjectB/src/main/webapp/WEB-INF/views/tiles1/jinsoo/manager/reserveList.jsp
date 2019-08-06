<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<% String ctxPath = request.getContextPath(); %>    
<script type="text/javascript" src="<%= ctxPath%>/resources/js/jquery-3.3.1.min.js"></script>
<style type="text/css">
	
	table, th, td { border: solid 1px gray; }
    
	#table {width: 1800px; border-collapse: collapse;}
	#table th, #table td {padding: 5px;}
	#table th { background-color: #DDD; }
	.subjectStyle { font-weight: bold; color: navy; cursor: pointer; }
</style>


<div style="margin-top: 300px;"><span onclick="javascript:location.href='<%= request.getContextPath() %>/jinsoo/manager.go'">홈으로</span></div>   
<div align="center" style="margin-top: 300px;">
	<h2 style="margin-bottom: 20px; cursor: pointer;" onclick="javascript:location.href='<%= request.getContextPath() %>/jinsoo/reserveManage.go'">예약 목록</h2>
	
	<table id="table">
		<tr>
			<th style="width: 70px; text-align: center;">예약번호</th>
			<th style="width: 30px; text-align: center;">호텔명</th>
			<th style="width: 50px; text-align: center;">객실명</th>
			<th style="width: 50px; text-align: center;">예약금액</th>
			<th style="width: 180px; text-align: center;">예약일</th>
			<th style="width: 180px; text-align: center;">체크인</th>
			<th style="width: 180px; text-align: center;">체크아웃</th>
			<th style="width: 70px; text-align: center;">회원번호</th>
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
				 	<td align="center">${reservevo.memberIdx}</td>
						
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
	<!-- #101 검색어 입력시 자동글 완성하기 1 -->
	<div id="displayList" style=" width: 300px; height: 100px; overflow: auto; margin-left: 36px; border: solid gray 1px; border-top: -2px;">
	
	</div>
	
</div>        