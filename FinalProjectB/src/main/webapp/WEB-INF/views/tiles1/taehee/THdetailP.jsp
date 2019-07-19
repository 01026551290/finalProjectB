<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	String ctxPath = request.getContextPath();
%>
<head>


</head>


	<a class="mouse smoothscroll" href="#next">
		<div class="mouse-icon">
			<span class="mouse-wheel"></span>
		</div>
	</a>
</section>
<!-- END section -->

<section class="section bg-light pb-0">
	<div class="container">



		</div>
	</div>
</section>

<section class="py-5 bg-light">
	<div class="container">
		<div class="row align-items-center">

			</div>

		</div>
	</div>
</section>



<!-- ---------------------------------------------------------------- -->
<section class="hotel-images" style="background-image: ; border: 1px solid gray;" >
	<div class="container">
<h2>Carousel Example</h2>  
<div style="width:75%; /* border: solid red 1px; */">
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
		  <!-- Indicators -->
		  <ol class="carousel-indicators">
		    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
		    <li data-target="#myCarousel" data-slide-to="1"></li>
		    <li data-target="#myCarousel" data-slide-to="2"></li>
		    <li data-target="#myCarousel" data-slide-to="3"></li>
		  </ol>
	
		  <!-- Wrapper for slides -->
		  <div class="carousel-inner" role="listbox">
		  	<c:forEach var="imgname" items="${imgfilenameList}" varStatus="status">
		  		<c:if test="${status.index == 0}">
		  			<div class="item active">
		  				<img src="<%= ctxPath%>/resources/images/detailP_imgs/${imgname}">
		  			</div>
		  		</c:if>
		  		<c:if test="${status.index > 0}">
		  			<div class="item">
		  				<img src="<%= ctxPath%>/resources/images/detailP_imgs/${imgname}">
		  			</div>
		  		</c:if>
		  	</c:forEach>
		  </div> 
	  <!-- Left and right controls -->
		  <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
		    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
		    <span class="sr-only">Previous</span>
		  </a>
		  <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
		    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
		    <span class="sr-only">Next</span>
		  </a>
		</div>
	</div>
	</div>


<%-- <div class="container">
<img alt="" src="<%= ctxPath%>/resources/images/detailP_imgs/SIN.jpg">
<h1 class="hotel_name">${hotel_name}</h1>


</div> --%>



</section>

<section class="hotelFacilities" style="background-image: ; border: 1px solid gray;" >


</section>


<!-- ---------------------------------------------------------------- -->	
	




<!-- footer -->
<%-- <section class="section bg-image overlay"
	style="background-image: url('<%=ctxPath%>/resources/images/hero_4.jpg');">
	<div class="container">
		<div class="row align-items-center">
			<div class="col-12 col-md-6 text-center mb-4 mb-md-0 text-md-left" data-aos="fade-up">
				<h2 class="text-white font-weight-bold">A Best Place To Stay. Reserve Now!</h2>
			</div>
			<div class="col-12 col-md-6 text-center text-md-right"
				data-aos="fade-up" data-aos-delay="200">
				<a href="reservation.html"
					class="btn btn-outline-white-primary py-3 text-white px-5">Reserve
					Now</a>
			</div>
		</div>
	</div>
</section> --%>