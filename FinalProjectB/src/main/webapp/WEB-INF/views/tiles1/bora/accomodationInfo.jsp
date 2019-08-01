<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
	String ctxPath = request.getContextPath();
%>

<script type="text/javascript">

	$(document).ready(function(){
		$(".error").hide();
		
		$(".requiredInfo").each(function(){
			
			$(this).blur(function(){
				var data = $(this).val().trim();
				if(data == "") {
					// 입력하지 않거나 공백만 입력했을 경우
					// alert("입력하지 않거나 공백만 입력했을 경우");
					
					$(this).siblings().find(".error").show();
					$(":input").attr("disabled",true);
					$(this).attr("disabled",false);
				}
				else{
					// 공백이 아닌 글자를 입력한 경우
					// alert("공백이 아닌 글자를 입력한 경우");
					$(this).siblings().find(".error").hide();
					$(":input").attr("disabled",false);
				}
			});
		});// end of $(".requiredInfo").each()----------------
		
		
		$("#tel").blur(function(){
			var tel = $(this).val();
			
			var regExp_TEL = /^\d{11}$/g;
			// 숫자 11자리만 들어오도록 검사해주는 정규표현식
			
			var bool = regExp_TEL.test(tel);
			
			if(!bool) {
				$(".error").show();
				$(":input").attr("disabled", true);
				$(this).attr("disabled", false);
				$(this).focus();
			}
			else {
				$(".error").hide();
				$(":input").attr("disabled", false);
			}			
		});// end of $("#tel").blur()-------------
		
		$("#email").blur(function(){
			
			var email = $(this).val();
			
			var regExp_EMAIL = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;  
			// email 을 검사하는 정규식 객체 생성
			
			var bool = regExp_EMAIL.test(email);
			
			if(!bool) {
				$(".error").show();
				$(":input").attr("disabled",true);
				$(this).attr("disabled",false); 
				$(this).focus();
			}
			else {
				$(".error").hide();
				$(":input").attr("disabled",false);
			}
			
		});// end of $("#email").blur()--------------
		
	});// end of $(document).ready()--------------------
	
	// === 결제하기(실제로 카드 결제) === //
	function goPay(idx, totalPrice) {
		
	//	alert(idx + "," + totalPrice);
		// 아임포트 결제금액 팝업창 띄우기
		var url = "<%= request.getContextPath()%>/payEnd.go?idx="+idx+"&totalPrice="+totalPrice;
		
		window.open(url, "payEnd", "left=350px, top=100px, width=820px, height=600px");
		
	}// end of function goPay(idx)----------------------
	
	<%-- function goMyEdit() {
		
		var flagBool = false;
		
		$(".requiredInfo").each(function(){
			var data = $(this).val().trim();
			if(data == "") {
				flagBool = true;
				return false;
			}
		});
		
		if(flagBool) {
			alert("필수입력란은 모두 입력하셔야 합니다.");
			event.preventDefault(); // click event 를 작동치 못하도록 한다.
			return;
		}
		else {
			var frm = document.reserveFrm;
			frm.method = "POST";
			frm.action = "<%= request.getContextPath()%>/accommodationInfoMyEditEnd.go";
			frm.submit();
		}
		
	}// end of goEdit(event)------------------ --%>

</script>

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
							<img src="/god/resources/images/hotel/${paraMap.img}" width="100%"><br>
							<p class="b_detail_border mgt10">
                                <span class="text-black">${paraMap.name}</span><!-- 호텔명 -->
                                <span class="d-block">${paraMap.address}</span> <!-- 주소  -->
                            </p>
							<p>
                                <span class="d-block">체크인:</span><!-- 체크인 -->
                                <span class="text-black">${paraMap.checkIn}</span>
                            </p>
							<p>
                                <span class="d-block">체크아웃:</span><!-- 체크아웃 -->
                                <span class="text-black">${paraMap.checkOut}</span>
                            </p>
							<p class="b_detail_border">
                                <span class="d-block">숙박일수:</span><!-- 숙박일수 -->
                                <span class="text-black">(${paraMap.nonight}일)</span>
                            </p>
                            
                            <p class="b_detail_border">
                                <span class="text-black">${paraMap.productName}</span>
                                <span class="d-block">객실정원:${paraMap.roomType}명</span>
                            </p>
                            
							<p>
                                <span class="d-block">1 개 객실 x 1 박:</span>
                                <span class="text-black">
                                	<fmt:formatNumber value="${paraMap.weekPrice}" pattern="###,###" /> 원
                                </span><!-- 객실금액 -->
                                <span class="d-block">세금&amp;서비스 금액:</span>
                                <span class="text-black">
                                	<fmt:formatNumber value="${paraMap.svcPrice}" pattern="###,###" /> 원
                                </span>
							</p>
							<p class="b_detail_total">
                                <span class="d-block">총 금액:</span>
                                <span class="text-black">
                                	<fmt:formatNumber value="${paraMap.totalPrice}" pattern="###,###" /> 원
                                </span>
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
                                <input type="text" name="name" id="name" class="form-control" value="${sessionScope.loginuser.name}" readonly />
                            </div>
                            <div class="col-md-6 form-group">
                                <label for="tel">Phone</label>
                                <input type="text" name="tel" id="tel" class="form-control" value="${sessionScope.loginuser.tel}" class="requiredInfo" placeholder="-는 생략, 숫자만입력" />
                                <span class="error">필수입력 사항입니다.</span>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-12 form-group">
                                <label for="email">Email</label>
                                <input type="email" name="email" id="email" class="form-control" value="${sessionScope.loginuser.email}" class="requiredInfo" placeholder="abc@gmail.com" />
                                <span class="error">필수입력 사항입니다.</span>
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
                        <h5 class="fontB">체크인 시간</h5>
                        <span class="noticeStyle">가장 빠른 체크인 시간은 16:00입니다. 이전에 도착할 경우, 대기시간이 소요될 수 있습니다</span>
                    </div>
                    
                    <div class="bg-white p-md-3 p-4 mb-2 border">
                        <h5 class="fontB">포인트</h5>
                        <span class="noticeStyle">체크아웃 후 최대 <span class="styleFont">[&nbsp;<fmt:formatNumber value="${paraMap.point}" pattern="###,###" />&nbsp;]포인트</span>가 적립됩니다.</span>
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
                        <button id="btnPayment" class="btn btn-primary btn-block text-white" onClick="goPay(${(sessionScope.loginuser).idx}, ${paraMap.totalPrice});">결제하기</button>
                    </div>
                    
                </div>
                <!-- // end 예약자 정보 -->
                
			</div>
			<!-- // end row -->            
		</div>
		<!-- // end container-->
    </section>
    
    <!-- 호텔정보 보내는 폼 -->
    <form name="reserveHiddenFrm">
    	<input type="hidden" value="${paraMap.img}" />
    	<input type="hidden" value="${paraMap.name}" />
    	<input type="hidden" value="${paraMap.address}" />
    	<input type="hidden" value="${paraMap.checkIn}" />
    	<input type="hidden" value="${paraMap.checkOut}" />
    	<input type="hidden" value="${paraMap.nonight}" />
    	<input type="hidden" value="${paraMap.productName}" />
    	<input type="hidden" value="${paraMap.roomType}" />
    	<input type="hidden" value="${paraMap.weekPrice}" />
    	<input type="hidden" value="${paraMap.totalPrice}" />
    	<input type="hidden" value="${paraMap.point}" />
    </form>