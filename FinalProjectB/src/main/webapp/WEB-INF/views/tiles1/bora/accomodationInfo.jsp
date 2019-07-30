<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	String ctxPath = request.getContextPath();
%>
<!-- 예약정보 및 결제 페이지 -->
<section class="site-hero inner-page overlay" style="background-image: url(<%=ctxPath%>/resources/images/hero_4.jpg)" data-stellar-background-ratio="0.5">
    <div class="container">
        <div class="row site-hero-inner justify-content-center align-items-center">
            <div class="col-md-10 text-center" data-aos="fade">
                <h1 class="heading mb-3">ReserVation</h1>
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
		<div class="container">
			<div class="row">
				<div class="col-md-5">
					<div class="row">
						<div class="col-md-12 bg-white p-md-3 p-4 mb-4 border">
							<img src="/god/resources/images/hotel/Hno.jpg" width="100%"><br>
							<p class="b_detail_border mgt10">
                                <span class="text-black">호텔명</span>
                                <span class="d-block">주소</span> 
                            </p>
							<p>
                                <span class="d-block">체크인:</span>
                                <span class="text-black">2019년07월30일</span>
                            </p>
							<p>
                                <span class="d-block">체크아웃:</span>
                                <span class="text-black">2019년07월30일</span>
                            </p>
							<p class="b_detail_border">
                                <span class="d-block">숙박일수:</span>
                                <span class="text-black">(1박)</span>
                            </p>
                            
                            <p class="b_detail_border">
                                <span class="text-black">패밀리룸(룸타입)</span>
                                <span class="d-block">객실정원:3명</span>
                            </p>
                            
							<p>
                                <span class="d-block">1 개 객실 x 1 박:</span>
                                <span class="text-black">객실금액</span>
                                <span class="d-block">세금&amp;서비스 금액:</span>
                                <span class="text-black">객실금액*0.1</span>
							</p>
							<p class="b_detail_total">
                                <span class="d-block">총 금액:</span>
                                <span class="text-black">객실금액+세금</span>
                            </p>
						</div>
					</div>
				</div>
				
                <div class="col-md-7">
                    <form name="reserveFrm" class="bg-white p-md-5 p-4 mb-4 border">
                        <h5 class="fontB">예약자 정보</h5>
                        <span class="noticeStyle">입력된 정보가 맞는지 확인하세요.</span>

                        <div class="row">
                            <div class="col-md-6 form-group">
                                <label for="name">Name</label>
                                <input type="text" id="name" class="form-control ">
                            </div>
                            <div class="col-md-6 form-group">
                                <label for="phone">Phone</label>
                                <input type="text" id="phone" class="form-control ">
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-12 form-group">
                                <label for="email">Email</label>
                                <input type="email" id="email" class="form-control ">
                            </div>
                        </div>
                        <a href="#" class="myInfoEdit">내정보수정</a>
                    </form>
                    <!-- // end 예약자 정보 -->
                    
                    <div class="bg-white p-md-3 p-4 mb-2 border">
                        <h5 class="fontB">체크인 시간</h5>
                        <span class="noticeStyle">가장 빠른 체크인 시간은 16:00입니다. 이전에 도착할 경우, 대기시간이 소요될 수 있습니다</span>
                    </div>
                    
                    <div class="bg-white p-md-3 p-4 mb-2 border">
                        <h5 class="fontB">포인트</h5>
                        <span class="noticeStyle">체크아웃 후 최대 (가격의 *3%) 포인트가 적립됩니다.</span>
                    </div>
                    
                    <div class="bg-white p-md-3 p-4 mb-2 border">
                        <h5 class="fontB">결제방법</h5>
                        <span class="noticeStyle">객실 예약 확정을 위해, 입력하신 카드 정보를 암호화 후 보안방식으로 호텔에 제공할 예정입니다.</span>
                            <h5 class="fontB mgt10">전자영수증</h5>
                        <span class="noticeStyle">영수증 발행은 호텔로 직접 문의하세요</span>
                    </div>
                    
                    <div class="bg-white p-md-3 p-4 mb-2">
                        <fieldset>
                        <legend class="blind">이용약관</legend>
                            <input type="checkbox" id="agree1"><label for="agree1" class="noticeStyle dpi">&nbsp;계속 진행 시, 예약 규정, God <a href="<%= ctxPath%>/terms.go" target="_blank">이용약관</a> 및 <a href="<%= ctxPath%>/privacy_policy.go" target="_blank">개인정보 처리방침</a>을 모두 읽었으며 이에 동의합니다.</label>
                        </fieldset>
                    </div>
                    
                    <div class="bg-white p-md-3 p-4 mb-2">
                        <button id="btnPayment" class="btn btn-primary btn-block text-white">결제하기</button>
                    </div>
                    
                </div>
                <!-- // end 예약자 정보 -->
                
			</div>
			<!-- // end row -->            
		</div>
		<!-- // end container-->
    </section>