<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% String ctxPath = request.getContextPath(); %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <script type="text/javascript" src="<%= ctxPath%>/resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	


});

</script>
 <div class="container">
 	<div class="col-md-5">
		<img style = "width: 150px;" src="<%=request.getContextPath()%>/resources/images/member/${oneShow.picture}" title="뜨나요" style="padding-bottom: 30px;"> 
	</div>
	<div>
		<p>이름  : ${oneShow.nickName} </p>
		<p>이메일  : ${oneShow.email} </p>
		<p>성명  : ${oneShow.name} </p>
		<p>휴대폰  : ${oneShow.tel} </p>
		<p>생일  : ${oneShow.brithDay} </p>
		<p>가입일  : ${oneShow.registerDay} </p>
		<p>가입일  : ${oneShow.registerDay} </p>
		<p>성별  : <c:if test="${oneShow.gender == 1}"> 남자  </c:if> <c:if test="${oneShow.gender == 2}"> 여자  </c:if> </p>
		<p>등급  : ${oneShow.grade} </p>
		<p>포인트  : ${oneShow.point} </p>
	</div>
	
</div>   
        