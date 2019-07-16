<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%-- === #22. tiles 를 사용하는 레이아웃1 페이지 만들기 === --%>   
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>    
<% String ctxPath =  request.getContextPath();	%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 </title>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
<link rel="stylesheet" type="text/css" href="<%=ctxPath %>/resources/css/style.css" />
<link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Noto+Sans+KR|Roboto&display=swap">

<link rel="stylesheet" href="<%=ctxPath%>/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="<%=ctxPath%>/resources/css/animate.css">
<link rel="stylesheet" href="<%=ctxPath%>/resources/css/owl.carousel.min.css">
<link rel="stylesheet" href="<%=ctxPath%>/resources/css/aos.css">
<link rel="stylesheet" href="<%=ctxPath%>/resources/css/bootstrap-datepicker.css">
<link rel="stylesheet" href="<%=ctxPath%>/resources/css/jquery.timepicker.css">
<link rel="stylesheet" href="<%=ctxPath%>/resources/css/fancybox.min.css">

<link rel="stylesheet" href="<%=ctxPath%>/resources/fonts/ionicons/css/ionicons.min.css">
<link rel="stylesheet" href="<%=ctxPath%>/resources/fonts/fontawesome/css/font-awesome.min.css">
</head>
<body>
	<div id="mycontainer">
	
		<div id="myheader">
			<tiles:insertAttribute name="header" />
		</div>
		
		<div id="mycontent">
			<tiles:insertAttribute name="content" />
		</div>
		
		<div id="myfooter">
			<tiles:insertAttribute name="footer" />
		</div>
		
	</div>
</body>
</html>