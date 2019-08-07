<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<section class="site-hero inner-page overlay" style="background-image: url(/god/resources/images/hero_4.jpg;); background-position: 0% 0px;" data-stellar-background-ratio="0.5">
  <div class="container">
    <div class="row site-hero-inner justify-content-center align-items-center">
      <div class="col-md-10 text-center aos-init aos-animate" data-aos="fade">
        <h1 class="heading mb-3">Purchase History</h1>
        <ul class="custom-breadcrumbs mb-4">
          <li><a href="index.html">Home</a></li>
          <li>•</li>
          <li>Purchase History</li>
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

<section class="section bg-light">
	<div class="container">
		<div class="row">
			<c:if test="${purchaseList!=null}">
				<c:forEach var="vo" items="">
					<div class="col-lg-12 col-md-12 col-md-12">
						<a href="#" class="mb-4 d-block"><img src="images/img_1.jpg" alt="Image placeholder" class="img-fluid"></a>
						<div class="media-body">
		                <span class="meta-post">February 26, 2018</span>
		                <h2><a href="${vo.largeCategoryOntionCode}">${vo.name}</a></h2>
		                <p>${vo.address}</p>
		                </div>
					</div>
				</c:forEach>
			</c:if>
		<!-- 
	          <div class="col-lg-4 col-md-6 col-md-6 col-12 post mb-5 ">
	            <div class="media media-custom d-block mb-4 h-100">
	              <a href="#" class="mb-4 d-block"><img src="images/img_1.jpg" alt="Image placeholder" class="img-fluid"></a>
	              <div class="media-body">
	                <span class="meta-post">February 26, 2018</span>
	                <h2 class="mt-0 mb-3"><a href="#">Travel Hacks to Make Your Flight More Comfortable</a></h2>
	                <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
	              </div>
	            </div>
	          </div> -->
		</div>
	</div>
</section>