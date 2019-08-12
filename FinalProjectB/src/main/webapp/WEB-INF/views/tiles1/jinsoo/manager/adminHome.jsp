<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.net.InetAddress"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
   
<%
	String ctxPath = request.getContextPath();


	// === 서버 IP 주소 알아오기 ===
	InetAddress inet = InetAddress.getLocalHost();
	 String serverIP = inet.getHostAddress();
	//	String serverIP = "192.168.50.16";
	
	// === 서버 포트번호 알아오기 ===
	int portnumber = request.getServerPort();		
	
	String serverName = "http://"+serverIP+":"+portnumber;

%>
<script type="text/javascript" src="<%= ctxPath%>/resources/js/jquery-3.3.1.min.js"></script>
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>
<script type="text/javascript">
 
 $(document).ready(function(){
	 
	 
	
				
						

				
		
		
}); // end of $(document).ready(function()
</script>

<div>게시판</div>

<div style="height: 2000px; width: 500px; display: inline-block;" >
	 <div id="container" style="min-width: 310px; height: 400px; max-width: 600px; margin-top: 400px;  "><jsp:include page="adminGengerJSON.jsp" /></div>     
	<div id="container" style="min-width: 310px; height: 400px; max-width: 600px; margin-top: 400px; position: absolute; top:-4px; right: 1000px; "><jsp:include page="adminReserve.jsp" /></div>    
	<div id="container" style="min-width: 310px; height: 400px; max-width: 600px; margin-top: 400px; position: absolute; top:-4px; right: 500px; "><jsp:include page="adminProduct.jsp" /></div>    
	<div id="container" style="min-width: 310px; height: 400px; max-width: 600px; margin-top: 1000px; position: absolute; top:-4px; right: 500px; padding-bottom: 500px; "><jsp:include page="adminRevenue.jsp" /></div>    
</div>

<a href="<%= serverName%><%=ctxPath%>/admin_chatting.go">웹채팅</a>

