<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
	String ctxPath = request.getContextPath();
%>

<script type="text/javascript">

	function goCancel(reserveidx) {
		
		var frm = document.reserveHotelInfoFrm;
		
		if( !$("input:checkbox[id=agree1]").is(":checked")) {
			alert("이용약관 및 개인정보 처리방침에 동의하셔야 합니다.");
			return;
		}
		
		frm.action = "/god/reserveCancelEnd.go";
		frm.method = "post";
		frm.submit();
		
	}
	
</script>

<!-- 예약정보 및 결제 페이지 -->
<section class="site-hero inner-page overlay" style="background-image: url(<%=ctxPath%>/resources/images/hero_4.jpg)" data-stellar-background-ratio="0.5">
    <div class="container">
        <div class="row site-hero-inner justify-content-center align-items-center">
            <div class="col-md-10 text-center" data-aos="fade">
                <h1 class="heading mb-3">Reseve Cancel</h1>
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

	<section class="section contact-section" id="next">
	<c:if test="${vo!=null}">
		<div class="container">
			<div class="row">
				<div class="col-md-5">
					<div class="row">
						<div class="col-md-12 bg-white p-md-3 p-4 mb-4 border">
							<img src="/god/resources/images/hotel/${vo.img}" width="100%"><br>
							<p class="b_detail_border mgt10">
                                <span class="text-black">${vo.name}</span><!-- 호텔명 -->
                                <span class="d-block">${vo.address}</span> <!-- 주소  -->
                            </p>
							<p>
                                <span class="d-block">예약일:</span><!-- 체크인 -->
                                <span class="text-black">${vo.reserveDate}</span>
                            </p>
							<p>
                                <span class="d-block">체크인:</span><!-- 체크인 -->
                                <span class="text-black">${vo.checkIn}</span>
                            </p>
							<p>
                                <span class="d-block">체크아웃:</span><!-- 체크아웃 -->
                                <span class="text-black">${vo.checkOut}</span>
                            </p>
							<p class="b_detail_border">
                                <span class="d-block">숙박일수:</span><!-- 숙박일수 -->
                                <span class="text-black">(${vo.noNight}일)</span>
                            </p>
                            
                            <p class="b_detail_border">
                                <span class="text-black">${vo.productName}</span>
                                <span class="d-block">객실정원:${vo.per}명</span>
                            </p>
                            
							<p>
                                <span class="d-block">1 개 객실 x 1 박:(세금미포함)</span>
                                <span class="text-black">
                                	<fmt:formatNumber value="${vo.price/11*10}" pattern="###,###" /> 원
                                </span><!-- 객실금액 -->
                                <span class="d-block">세금&amp;서비스 금액:</span>
                                <span class="text-black">
                                	<fmt:formatNumber value="${vo.price/11}" pattern="###,###" /> 원
                                </span>
							</p>
							<p class="b_detail_total">
                                <span class="d-block">총 금액:</span>
                                <span class="text-black">
                                	<fmt:formatNumber value="${vo.price}" pattern="###,###" /> 원
                                </span>
                            </p>
						</div>
					</div>
				</div>
				
                <div class="col-md-7">
                    <form name="reserveFrm" class="bg-white p-md-5 p-4 mb-4 border">
                        <h5 class="fontB">취소자 정보</h5>
                        <span class="noticeStyle">입력된 정보가 맞는지 확인하세요.</span>

                        <div class="row">
                            <div class="col-md-6 form-group">
                                <label for="name">Name</label>
                                <input type="text" name="name" id="name" class="form-control" value="${sessionScope.loginuser.name}" readonly />
                            </div><%-- 
                            <div class="col-md-6 form-group">
                                <label for="tel">Phone</label>
                                <input type="text" name="tel" id="tel" class="form-control" value="${sessionScope.loginuser.fullTel}" class="requiredInfo" placeholder="-는 생략, 숫자만입력" readonly />
                            </div> --%>
                        </div>

                        <div class="row">
                            <div class="col-md-12 form-group">
                                <label for="email">Email</label>
                                <input type="email" name="email" id="email" class="form-control" value="${sessionScope.loginuser.email}" class="requiredInfo" placeholder="abc@gmail.com" readonly />
                            </div>
                        </div>
                        <!-- 
                        <div class="taR">
                        	<button class="myInfoEdit" onclick="goMyEdit();">내정보수정</button>
                       	</div> 
                       	-->
                    </form>
                    <!-- // end 예약자 정보 -->
                    <div class="bg-white p-md-3 p-4 mb-2 border">
                        <h5 class="fontB">환불방법</h5>
                        <span class="noticeStyle">약관에 따라 환불이 진행되며, 영업일로부터 5~7일 이상 소요됩니다.</span>
                            <h5 class="fontB mgt10">취소영수증</h5>
                        <span class="noticeStyle">취소 영수증 발행은 호텔로 직접 문의하세요</span>
                    </div>
                    
                    <div class="bg-white p-md-3 p-4 mb-2">
                        <fieldset>
                        <legend class="blind">예약취소하시겠습니까?</legend>
                            <input type="checkbox" id="agree1"><label for="agree1" class="noticeStyle dpi">&nbsp;취소 규정, God <a href="<%= ctxPath%>/terms.go" target="_blank">이용약관</a> 및 <a href="<%= ctxPath%>/privacy_policy.go" target="_blank">개인정보 처리방침</a>을 모두 읽었으며 이에 동의합니다.</label>
                        </fieldset>
                    </div>
                    
                    <div class="bg-white p-md-3 p-4 mb-2">
                        <button id="btnPayment" class="btn btn-primary btn-block text-white" onclick="goCancel()">예약 취소</button>
				   </div>
                    
                </div>
                <!-- // end 예약자 정보 -->
                
			</div>
			<!-- // end row -->            
		</div>
		<!-- // end container-->
		</c:if>
    </section>
    
    <!-- 호텔정보 보내는 폼 -->
    <form name="reserveHotelInfoFrm">
    	<input type="hidden" name="reserveId" value="${vo.reserveId}" />
    </form>