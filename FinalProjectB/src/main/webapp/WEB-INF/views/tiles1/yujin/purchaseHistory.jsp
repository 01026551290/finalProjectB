<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript">

	function go(action){
		document.goReviewWriteFrm.reserveId.value=reserveid;
		document.goReviewWriteFrm.fk_productId.value=fk_productId;
		document.goReviewWriteFrm.largeCategoryOntionCode.value=largeCategoryOntionCode;
		document.goReviewWriteFrm.name.value=name;
		document.goReviewWriteFrm.productName.value=productName;
		document.goReviewWriteFrm.address.value=address;
		document.goReviewWriteFrm.checkIn.value=checkIn;
		document.goReviewWriteFrm.checkOut.value=checkOut;
		document.goReviewWriteFrm.noNight.value=noNight;
		document.goReviewWriteFrm.img.value=img;
		document.goReviewWriteFrm.per.value=per;
		document.goReviewWriteFrm.price.value=price;
		
		document.goReviewWriteFrm.action=action;
		document.goReviewWriteFrm.submit();
	}
	
</script>

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
			<div class="col-lg-12 col-md-12 col-md-12" style="display: -webkit-box;">
				<div class="col-lg-3 col-md-3 col-md-3"></div>
				<div class="col-lg-9 col-md-9 col-md-9">
				<h2>숙소명/아ㅓㅁㄹㄴ아러낭ㄹ//예약일ㄴㅇ러나이</h2>
                </div>
			</div>
			<c:if test="${purchaseList!=null}">
				<c:forEach var="vo" items="${purchaseList}">
					<div class="col-lg-12 col-md-12 col-md-12" style="display: -webkit-box;">
						<div class="col-lg-3 col-md-3 col-md-3">
							<a href="#" class="mb-4 d-block"><img src="/god/resources/images/hotel/${vo.img}" class="img-fluid"></a>
						</div>
						<div class="col-lg-6 col-md-3 col-md-3">
							<div class="media-body"> 
			                <span class="meta-post"><span style="margin-right: 30px;">예약일 : ${vo.reserveDate}</span><span>객실정원 : ${vo.per} / 침대개수 : ${vo.bed}</span></span>
			                <h2><a href="${vo.largeCategoryOntionCode}">${vo.name} / ${vo.productName}</a></h2>
			                <p>${vo.address}</p>
			                <h4>체크인 ${vo.checkIn} - 체크아웃${vo.checkOut}</h4>
			                <%-- ------
			                ${vo.canCancleReserve}  --%>
			                </div>
						</div>
						<div class="col-lg-3 col-md-3 col-md-3">
							<c:if test="${vo.canWriteReview>0}">
			                	<p>이용완료</p>
							</c:if> 
							<c:if test="${vo.using<1}">
			                	<p>이용중</p>
							</c:if> 
							<c:if test="${14>vo.canWriteReview and vo.canWriteReview>0}">
			                	<a href="#" onclick="go('/god/review.go','${vo.reserveId}','${vo.fk_productId}','${vo.largeCategoryOntionCode}','${vo.name}','${vo.productName}','${vo.address}','${vo.checkIn}','${vo.checkOut}','${vo.noNight}','${vo.img}','${vo.per}','${vo.price}')">후기작성</a>
							</c:if> 
							<c:if test="${vo.canCancelReserve>0}">
								<a href="#" onclick="go('/god/reserveCancel.go','${vo.reserveId}','${vo.fk_productId}','${vo.largeCategoryOntionCode}','${vo.name}','${vo.productName}','${vo.address}','${vo.checkIn}','${vo.checkOut}','${vo.noNight}','${vo.img}','${vo.per}','${vo.price}')">예약취소</a>
							</c:if>
						</div>
					</div>
				</c:forEach>
			</c:if>
			
			<form name="goChangeFrm" method="post">
				<input type="hidden" name="reserveId">	
				<input type="hidden" name="fk_productId">	
				<input type="hidden" name="largeCategoryOntionCode">	
				<input type="hidden" name="name">	
				<input type="hidden" name="productName">	
				<input type="hidden" name="address">	
				<input type="hidden" name="checkIn">	
				<input type="hidden" name="checkOut">	
				<input type="hidden" name="noNight">	
				<input type="hidden" name="img">	
				<input type="hidden" name="per">	
				<input type="hidden" name="price">	
			</form>
		</div>
	</div>
</section>