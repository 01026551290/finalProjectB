<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- ======= #25. tiles1 중 header 페이지 만들기  ======= --%>
<%
	String ctxPath = request.getContextPath();
%>

<script type="text/javascript">

	var weatherTimejugi = 0;  // 단위는 밀리초
	
	$(document).ready(function() {
		
		$(function(){
			$.ajax({
				url:"hotelViewsRealTime.go",
				dataType:"JSON",
				success:function(json){
					$(".searchType").empty();
					
					var html = "<dl id='rank-list'>";
					html += "<dt>실시간 급상승 검색어</dt>";
					html += "<dd>";
					html += "<ol>";
					$.each(json, function(index, item){
						html += "<li><a href='<%= ctxPath%>/product.go?largeCategoryontionCode="+item.largecategoryontioncode+"'>"+item.cnt+".  "+item.name+"</a></li>";
					});
					
					html += "</ol>";
					html += "</dd>";
					html += "</dl>";
					
					$(".searchType").html(html);
					
				    var count = $('#rank-list li').length;
				    var height = $('#rank-list li').height();

				    function step(index) {
				        $('#rank-list ol').delay(2000).animate({
				            top: -height * index,
				        }, 500, function() {
				            step((index + 1) % count);
				        });
				    }

				    step(1);
				},
				error: function(request, status, error){
					alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
				}
			});
		});
		
		
		loopshowNowTime();
		
		// 시간이 대략 매 30분 0초가 되면 기상청 날씨정보를 자동 갱신해서 가져오려고 함.
		// (매 정시마다 변경되어지는 날씨정보를 정시에 보내주지 않고 대략 30분이 지난다음에 보내주므로)
		var now = new Date();
		var minute = now.getMinutes();  // 현재시각중 분을 읽어온다.
		
		if(minute < 30) { // 현재시각중 분이 0~29분 이라면
			weatherTimejugi = (30-minute)*60*1000;  // 현재시각의 분이 0분이라면 weatherTimejugi에 30분을 넣어준다.
			                                        // 현재시각의 분이 5분이라면 weatherTimejugi에 25분을 넣어준다.
			                                        // 현재시각의 분이 29분이라면 weatherTimejugi에 1분을 넣어준다.
		}
		else if(minute == 30) {
			weatherTimejugi = 1000;                 // 현재시각의 분이 30분이라면 weatherTimejugi에 1초 넣어준다.
		}
		else {                                      // 현재시각의 분이 31~59분이라면
			weatherTimejugi = ( (60-minute)+30 )*60*1000;  // 현재시각의 분이 31분이라면 weatherTimejugi에 (29+30)분을 넣어준다.
			                                               // 현재시각의 분이 40분이라면 weatherTimejugi에 (20+30)분을 넣어준다.
			                                               // 현재시각의 분이 59분이라면 weatherTimejugi에 (1+30)분을 넣어준다.
		}
		
		loopshowWeather(); // 기상청 날씨정보 공공API XML데이터 호출하기
		
	}); // end of ready(); ---------------------------------
	
	function showNowTime() {
		
		var now = new Date();
		
		var month = now.getMonth() + 1 // 0이 1월달이기때문에 +1 을 해준것
		if(month < 10) {
			month = "0"+month;
		}
		
		var strNow = now.getFullYear() + "-" + month + "-" + now.getDate();
		
		var hour = "";
	    if(now.getHours() < 10) {
	    	 hour = "0"+now.getHours();
	    } 
	    else {
	    	hour = now.getHours();
	    }
		
		var minute = "";
		if(now.getMinutes() < 10) {
			minute = "0"+now.getMinutes();
		} else {
			minute = now.getMinutes();
		}
		
		var second = "";
		if(now.getSeconds() < 10) {
			second = "0"+now.getSeconds();
		} else {
			second = now.getSeconds();
		}
		
		strNow += " "+hour + ":" + minute + ":" + second;
		
		$("#clock").html("<span style='color:green; font-weight:bold;'>"+strNow+"</span>");
	
	}// end of function showNowTime() -----------------------------
	
	// ------ 기상청 날씨정보 공공API XML데이터 호출하기 -------- //
	function showWeather() {

		$.ajax({
				url: "<%= request.getContextPath() %>/weatherXML.go",
				type: "GET",
				dataType: "XML",
				success: function(xml){
						var rootElement = $(xml).find(":root");
					    console.log($(rootElement).prop("tagName"));   
					    // ==> current
										   
					    var weather = $(rootElement).find("weather");
					    console.log( $(weather).attr("year") +"년 " + $(weather).attr("month") + "월 " + $(weather).attr("day") + "일 " + $(weather).attr("hour") + "시" );        
						// 2019년 01월 20일 22시
						
						var updateTime = $(weather).attr("year") +"년 " + $(weather).attr("month") + "월 " + $(weather).attr("day") + "일 " + $(weather).attr("hour") + "시";
						
					    var localArr = $(rootElement).find("local");

					    var html = "";
					    
					    for(var i=0; i<localArr.length; i++) {
					    	var local = $(localArr).eq(i);
					    	if($(local).attr("stn_id") == "184" || $(local).attr("stn_id") == "189") { // 제주도 와 서귀포만 뽑아옴
							   /* .eq(index) 는 선택된 요소들을 인덱스 번호로 찾을 수 있는 선택자이다. 
							            마치 배열의 인덱스(index)로 값(value)를 찾는 것과 같은 효과를 낸다.
							   */
							   console.log($(local).text() + " stn_id:" + $(local).attr("stn_id") + " icon:" + $(local).attr("icon") + " desc:" + $(local).attr("desc") + " ta:" + $(local).attr("ta") );
							   
								html += "<span class='weatherArea'>"+$(local).text()+"</span>";
								html += "<span class='weatherImg'>"+"<img src='http://www.kma.go.kr/images/icon/NW/NB"+$(local).attr("icon")+".png'><span class='weather'>("+$(local).attr("desc")+")</span>"+"</span>";
								html += "<span class='weatherAir'>"+$(local).attr("ta")+"</span>";
				    	   }
					    }
					    
					    $(".weatherType").html(html);
					    
					}, // end of success: function(xml)-----------------------------

					error: function(request, status, error){
						alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
					}	
				}); // end of $.ajax({});-------------------------------------------------
		
	}// end of function showWeather()----------------------
	
	function loopshowNowTime() {
		showNowTime();
		
		var timejugi = 1000;   // 시간을 1초 마다 자동 갱신하려고.
		
		setTimeout(function() {
						loopshowNowTime();	
					}, timejugi);
		
	}// end of loopshowNowTime() --------------------------
	
	function loopshowWeather() {
		showWeather();
		
		setTimeout(function() {
			   showWeather();	
			}, weatherTimejugi); // 현재시각의 분이 5분이라면 weatherTimejugi가 25분이므로 25분후인 30분에 showWeather();를 실행한다.
		
		setTimeout(function() {
	           loopshowWeather();	
			}, weatherTimejugi + (60*60*1000));  // 현재시각의 분이 5분이라면 weatherTimejugi가 25분이므로 25분후인 30분에 1시간을 더한후에 showWeather();를 실행한다.
	}// end of loopshowWeather() --------------------------
	
</script>

<header class="site-header js-site-header">
	<div class="container-fluid">
		<div class="row align-items-center">
			<div class="col-2 col-lg-3 site-logo" data-aos="fade">
				<a href="index.go">God</a>
			</div>

			<div class="col-8 col-lg-6">
				<div data-aos="fade-up" data-aos-offset="-200">
					<div class="searchType"></div>
					<div class="weatherType"></div>
					<div id="displayWeather"></div>
				</div>
			</div>

			<div class="col-2 col-lg-3">
				<div class="site-menu-toggle js-site-menu-toggle" data-aos="fade">
					<span></span> <span></span> <span></span>
				</div>
				<!-- END menu-toggle -->

				<div class="site-navbar js-site-navbar">
					<nav role="navigation">
						<div class="container">
							<div class="row full-height align-items-center">
								<div class="col-md-6 mx-auto">
									<ul class="list-unstyled menu">
										<c:if test="${loginuser == null }">
                             			<li class="active"><a href="index.go">홈으로</a></li>
										<!-- 로그인 전 -->
										<li><a href="<%= ctxPath%>/login.go">로그인</a></li>
										<li><a href="<%= ctxPath%>/register.go">회원가입</a></li>
										<li><a href="#">고객센터</a></li>
										</c:if>
										<!-- 로그인 후 보여지는 메뉴 -->
										<c:if test="${loginuser != null }">    
										<li class="active"><a href="index.go">홈으로</a></li>
										<li><a href="#">여행</a></li>
										<li><a href="#">찜목록</a></li>
										<li><a href="<%= ctxPath%>/mypage.go">마이페이지</a></li>
										<li><a href="<%= ctxPath%>/logout.go">로그아웃</a></li>
										</c:if>
									</ul>
								</div>
							</div>
						</div>
					</nav>
				</div>
			</div>
		</div>
	</div>
</header>