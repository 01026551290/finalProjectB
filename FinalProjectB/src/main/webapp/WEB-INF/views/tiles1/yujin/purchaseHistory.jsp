<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script type="text/javascript">

	function go(action,reserveId,fk_productId,largeCategoryOntionCode,name,productName,address,checkIn,checkOut,noNight,img,per,price){
		frm = document.goChangeFrm;
		frm.reserveId.value=reserveId;
		frm.fk_productId.value=fk_productId;
		frm.largeCategoryOntionCode.value=largeCategoryOntionCode;
		frm.name.value=name;
		frm.productName.value=productName;
		frm.address.value=address;
		frm.checkIn.value=checkIn;
		frm.checkOut.value=checkOut;
		frm.noNight.value=noNight;
		frm.img.value=img;
		frm.per.value=per;
		frm.price.value=price;
		
		frm.action=action;
		frm.submit();
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
			<c:if test="${purchaseList!=null}">
				<c:forEach var="vo" items="${purchaseList}">
					<div class="col-lg-12 col-md-12 col-md-12" style="display: -webkit-box; margin-bottom: 27px;border-bottom: solid 1px gray;">
						<div class="col-lg-3 col-md-3 col-md-3">
							<a href="<%=request.getContextPath()%>/product.go?largeCategoryontionCode=${vo.largeCategoryOntionCode}" class="mb-4 d-block"><img src="/god/resources/images/hotel/${vo.img}" class="img-fluid"></a>
						</div>
						<div class="col-lg-6 col-md-3 col-md-3">
							<div class="media-body"> 
			                <span class="meta-post"><span style="margin-right: 30px;">예약일 : ${vo.reserveDate}</span><span>객실정원 : ${vo.per} / 침대개수 : ${vo.bed}</span></span>
			                <h2><a href="<%=request.getContextPath()%>/product.go?largeCategoryontionCode=${vo.largeCategoryOntionCode}">${vo.name} / ${vo.productName}</a></h2>
			                <p>${vo.address}</p>
			                <h4>체크인 ${vo.checkIn} - 체크아웃${vo.checkOut}</h4>
			                <%-- ------
			                ${vo.canCancleReserve}  --%>
			                </div>
						</div>
						<div class="col-lg-3 col-md-3 col-md-3">
							<c:if test="${vo.status==1}">
								<c:if test="${vo.canWriteReview>0}">
				                	<p>이용완료</p>
								</c:if> 
								<c:if test="${vo.using<1}">
				                	<p>이용중</p>
								</c:if>
								<c:if test="${14<=vo.canWriteReview}">
									<c:if test="${vo.pointStatus!=NULL and vo.pointStatus>0}">
					                	<span style="cursor: pointer;" class="d-block text-primary"  onclick="go('/god/earnPoint.go','${vo.reserveId}','${vo.fk_productId}','${vo.largeCategoryOntionCode}','${vo.name}','${vo.productName}','${vo.address}','${vo.checkIn}','${vo.checkOut}','${vo.noNight}','${vo.img}','${vo.per}','${vo.point}');"></span><span><fmt:formatNumber value="${vo.point}" pattern="###,###" />포인트</span><span>적립하기</span></span>
									</c:if>
									<c:if test="${vo.pointStatus!=NULL and vo.pointStatus==0}">
					                	<p style="margin: 0 auto;"><fmt:formatNumber value="${vo.point}" pattern="###,###" />포인트</p><p>적립완료</p>
									</c:if>
								</c:if>
								<c:if test='${vo.title!="" and vo.title!=null}'>
				                	<span class="d-block text-primary" >후기작성완료</span>
								</c:if>
								<c:if test='${14>vo.canWriteReview and vo.canWriteReview>0 and (vo.title=="" and vo.title!=null)}'>
				                	<span style="cursor: pointer;" class="d-block text-primary" onclick="go('/god/review.go','${vo.reserveId}','${vo.fk_productId}','${vo.largeCategoryOntionCode}','${vo.name}','${vo.productName}','${vo.address}','${vo.checkIn}','${vo.checkOut}','${vo.noNight}','${vo.img}','${vo.per}','${vo.price}');">후기작성</span>
								</c:if> 
								<c:if test="${vo.canCancelReserve>0}">
									<span style="cursor: pointer;" class="d-block text-primary" onclick="go('/god/reserveCancel.go','${vo.reserveId}','${vo.fk_productId}','${vo.largeCategoryOntionCode}','${vo.name}','${vo.productName}','${vo.address}','${vo.checkIn}','${vo.checkOut}','${vo.noNight}','${vo.img}','${vo.per}','${vo.price}');">예약취소가능</span>
								</c:if>
							</c:if>
							<c:if test="${vo.status==0}">
								<p>취소된 예약</p>
							</c:if>
							
							<h4><fmt:formatNumber value="${vo.price/11*10}" pattern="###,###" />원</h4>
						</div>
					</div>
				</c:forEach>
			</c:if>
			
			<div class="col-12">
						<div class="custom-pagination">
							<ul class="list-unstyled" id="pagebar">
								<c:if test="${pagebar!=null}">
				${pagebar}
				</c:if>
							</ul>
						</div>
					</div>
			
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