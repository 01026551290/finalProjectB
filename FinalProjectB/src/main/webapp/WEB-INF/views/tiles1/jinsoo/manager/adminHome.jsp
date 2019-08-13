<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.net.InetAddress"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
 
 <style type="text/css">

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

<section class="site-hero inner-page overlay" style="background-image: url(/god/resources/images/hero_4.jpg)" data-stellar-background-ratio="0.5">
      <div class="container">
        <div class="row site-hero-inner justify-content-center align-items-center">
          <div class="col-md-10 text-center" data-aos="fade">
            <h1 class="heading mb-3">관리자</h1>
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

<script type="text/javascript" src="<%= ctxPath%>/resources/js/jquery-3.3.1.min.js"></script>
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>
<script src="https://code.highcharts.com/modules/data.js"></script>
<script src="https://code.highcharts.com/modules/drilldown.js"></script>
<script type="text/javascript">
 
 $(document).ready(function(){
	 
	 
	
				
						

				
		
		
}); // end of $(document).ready(function()
</script>

<div class="topnav" style="margin: 20px 0;">
  <a class="active" href="<%= request.getContextPath() %>/admin_manager.go">Home</a>
  <a href="<%= request.getContextPath() %>/admin_memberManage.go">회원관리</a>
  <a href="<%= request.getContextPath() %>/admin_reserveManage.go">예약관리</a>
  <a href="<%= request.getContextPath() %>/admin_productManage.go">상품관리</a>
  <a href="<%= request.getContextPath() %>/admin_inquiryBoardList.go">문의사항</a>
  <a href="<%= serverName%><%=ctxPath%>/admin_chatting.go">회의</a>
</div>

<div style="height: 2000px; width: 2100px; display: inline-block;" >
	<div id="container" style=" border: 1px solid red; width: 400px; display: inline-block; margin-left: 10px;  "><jsp:include page="adminGengerJSON.jsp" /></div>     
	<div id="container" style=" border: 1px solid red; width: 400px; display: inline-block;  "><jsp:include page="adminReserve.jsp" /></div>    
	<div id="container" style=" border: 1px solid red; width: 400px; display: inline-block;  "><jsp:include page="adminProduct.jsp" /></div>    
	<div id="container" style=" border: 1px solid red; width: 400px; display: inline-block; height:584px; position: absolute;  "><jsp:include page="adminRevenue.jsp" /></div>    
</div>


