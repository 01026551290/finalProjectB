<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	String ctxPath = request.getContextPath();
%>

<script type="text/javascript">
	$(document).ready(function(){
						
		$("#searchWord").keydown(function(event){
			if(event.keyCode == 13) {
			//	goSearch();
			}
		});
		
		$("#btnSearch").click(function(){
			var frm = document.infoSearchFrm;
			var checkinDateVal = frm.checkin_date.value.trim();
			alert(checkinDateVal);
			
		});
		
		$( "#checkin_date" ).datepicker({dateFormat:"yy-mm-dd"});
		$( "#checkout_date" ).datepicker({dateFormat:"yy-mm-dd"});
		
		// === 검색어 입력시 자동글 완성하기 2 ===
		$("#displayList").hide();
		
		$("#searchWord").keyup(function(){
			
			var form_data = {searchWord:$("#searchWord").val()};
			
			$.ajax({
				url:"<%=request.getContextPath()%>/wordSearchView.go",
				type:"GET",
				data:form_data,
				dataType:"JSON",
				success:function(json) {
					
					// === 검색어 입력시 자동글 완성하기 7 ===
					if(json.length > 0) {
					
						var html = "";
						
						$.each(json, function(entryIndex, item){
							var name = item.name;
							var addr = item.addr;
							
							var len = $("#searchWord").val().length;
							var result = "";
							
							if(name != null && name.length > 0) {
							var indexN = name.toLowerCase().indexOf( $("#searchWord").val().toLowerCase() );
								result += "<span class='clickWord' style='display: inline-block; width: 100%;'><span class='first'>" +name.substr(0, indexN)+ "</span>" + "<span class='second' style='color:#ffaa34;'>" +name.substr(indexN, len)+ "</span>" + "<span class='third'>" +name.substr(indexN+len)+ "</span></span>";
							}
							
							if(addr != null && addr.length > 0) {
							var indexA = addr.toLowerCase().indexOf( $("#searchWord").val().toLowerCase() );
								result += "<span class='clickWord' style='display: inline-block; width: 100%;'><span class='first'>" +addr.substr(0, indexA)+ "</span>" + "<span class='second' style='color:#ffaa34;'>" +addr.substr(indexA, len)+ "</span>" + "<span class='third'>" +addr.substr(indexA+len)+ "</span></span>";
							}
								html += "<span style='cursor:pointer;'>"+ result +"</span><br/>";
						});
						
						$("#displayList").html(html);
						$("#displayList").show();
						
					}
					else {
						// 검색된 데이터가 존재하지 않을 경우
						$("#displayList").hide();
					}
					
				},
				error: function(request, status, error){
					alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
				}
			});
		});	
		// === 검색어 입력시 자동글 완성하기 8 ===
		$("#displayList").click(function(event){
			var word = "";
			var $target = $(event.target);
			
			if($target.is(".clickWord")) {
				word = $target.text();
			}
			else if($target.is(".first")) {
				word = $target.text() + $target.next().text() + $target.next().next().text();
			}
			else if($target.is(".second")) {
				word = $target.prev().text() + $target.text() + $target.next().text();
			}
			else if($target.is(".third")) {
				word = $target.prev().prev().text() + $target.prev().text() + $target.text();
			}	
			$("#searchWord").val(word); // 텍스트박스에 검색된 결과의 문자열을 입력해준다.
			
			$("#displayList").hide();
			
			goSearch();
		});
	}); // end of $(document).ready------------------------
	
	
	function goSearch() {
		var frm = document.infoSearchFrm;
		frm.method = "GET";
		frm.action = "<%=request.getContextPath()%>/list.go";
		//	frm.submit();
	}
	
</script>

<section class="site-hero overlay"
	style="background-image: url(<%=ctxPath%>/resources/images/hero_4.jpg)"
	data-stellar-background-ratio="0.5">
	<div class="container">
		<div
			class="row site-hero-inner justify-content-center align-items-center">
			<div class="col-md-10 text-center" data-aos="fade-up">
				<span class="custom-caption text-uppercase text-white d-block  mb-3">
					Welcome To <span class="fa fa-star text-primary"></span> God
				</span>
				<h1 class="heading">A Best Place To Stay</h1>
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

<section class="section bg-light pb-0">
	<div class="container">

		<div class="row check-availabilty" id="next">
			<div class="block-32" data-aos="fade-up" data-aos-offset="-200">

				<form name="infoSearchFrm">
					<div class="row">
						<div class="col-md-6 mb-3 mb-lg-0 col-lg-3">
							<label for="text" class="font-weight-bold text-black">목적지</label>
							<div class="field-icon-wrap">
								<input type="text" id="searchWord" class="form-control"
									placeholder="숙박명 또는 지역명을 검색" autocomplete="off">

								<!-- === 검색어 입력시 자동글 완성하기 1 === -->
								<div id="displayList"></div>
								<!-- //end 검색어 입력시 자동글 완성하기 1 -->

							</div>
						</div>
						<div class="col-md-6 mb-3 mb-md-0 col-lg-3">
							<div class="row">
								<div class="col-md-6 mb-3 mb-md-0">
									<label for="adults" class="font-weight-bold text-black">Adults</label>
									<div class="field-icon-wrap">
										<div class="icon">
											<span class="ion-ios-arrow-down"></span>
										</div>
										<select name="" id="adults" class="form-control">
											<option value="">1</option>
											<option value="">2</option>
											<option value="">3</option>
											<option value="">4+</option>
										</select>
									</div>
								</div>
								<div class="col-md-6 mb-3 mb-md-0">
									<label for="children" class="font-weight-bold text-black">Children</label>
									<div class="field-icon-wrap">
										<div class="icon">
											<span class="ion-ios-arrow-down"></span>
										</div>
										<select name="" id="children" class="form-control">
											<option value="">1</option>
											<option value="">2</option>
											<option value="">3</option>
											<option value="">4+</option>
										</select>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-6 mb-3 mb-lg-0 col-lg-2">
							<label for="checkin_date" class="font-weight-bold text-black">체크인</label>
							<div class="field-icon-wrap">
								<div class="icon">
									<span class="icon-calendar"></span>
								</div>
								<input type="text" id="checkin_date" name="checkin_date" class="form-control" style="padding-right:0;">
							</div>
						</div>
						<div class="col-md-6 mb-3 mb-lg-0 col-lg-2">
							<label for="checkout_date" class="font-weight-bold text-black">체크아웃</label>
							<div class="field-icon-wrap">
								<div class="icon">
									<span class="icon-calendar"></span>
								</div>
								<input type="text" id="checkout_date" name="checkout_date" class="form-control" style="padding-right:0;">
							</div>
						</div>
						<div class="col-md-6 col-lg-2 align-self-end">
							<button id="btnSearch" class="btn btn-primary btn-block text-white">검색</button>
						</div>
					</div>
				</form>
			</div>

		</div>
	</div>
</section>

<section class="section">
	<div class="container">
		<div class="row justify-content-center text-center mb-5">
			<div class="col-md-7">
				<h2 class="heading">Best 숙소</h2>
				<p>퀄리티와 인테리어 디자인이 검증된 숙소 셀렉션</p>
			</div>
		</div>
		<div class="row">
			<div class="col-md-6 col-lg-4">
				<a href="#" class="room">
					<figure class="img-wrap">
						<img src="<%=ctxPath%>/resources/images/img_1.jpg"
							alt="Free website template" class="img-fluid mb-3">
					</figure>
					<div class="p-3 text-center room-info">
						<h2>Single Room</h2>
						<span class="text-uppercase letter-spacing-1">90$ / per night</span>
					</div>
				</a>
			</div>

			<div class="col-md-6 col-lg-4">
				<a href="#" class="room">
					<figure class="img-wrap">
						<img src="<%=ctxPath%>/resources/images/img_2.jpg"
							alt="Free website template" class="img-fluid mb-3">
					</figure>
					<div class="p-3 text-center room-info">
						<h2>Family Room</h2>
						<span class="text-uppercase letter-spacing-1">120$ / per night</span>
					</div>
				</a>
			</div>

			<div class="col-md-6 col-lg-4">
				<a href="#" class="room">
					<figure class="img-wrap">
						<img src="<%=ctxPath%>/resources/images/img_3.jpg"
							alt="Free website template" class="img-fluid mb-3">
					</figure>
					<div class="p-3 text-center room-info">
						<h2>Presidential Room</h2>
						<span class="text-uppercase letter-spacing-1">250$ / per night</span>
					</div>
				</a>
			</div>


		</div>
	</div>
</section>

<section class="section blog-post-entry bg-light">
	<div class="container">
		<div class="row justify-content-center text-center mb-5">
			<div class="col-md-7">
				<h2 class="heading">최신 숙소</h2>
				<p>새로 오픈한 숙소를 둘러보세요.</p>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-4 col-md-6 col-sm-6 col-12 post">

				<div class="media media-custom d-block mb-4 h-100">
					<a href="#" class="mb-4 d-block"><img
						src="<%=ctxPath%>/resources/images/img_1.jpg"
						alt="Image placeholder" class="img-fluid"></a>
					<div class="media-body">
						<span class="meta-post">February 26, 2018</span>
						<h2 class="mt-0 mb-3">
							<a href="#">Travel Hacks to Make Your Flight More Comfortable</a>
						</h2>
						<p>Far far away, behind the word mountains, far from the
							countries Vokalia and Consonantia, there live the blind texts.</p>
					</div>
				</div>

			</div>
			<div class="col-lg-4 col-md-6 col-sm-6 col-12 post">
				<div class="media media-custom d-block mb-4 h-100">
					<a href="#" class="mb-4 d-block"><img
						src="<%=ctxPath%>/resources/images/img_2.jpg"
						alt="Image placeholder" class="img-fluid"></a>
					<div class="media-body">
						<span class="meta-post">February 26, 2018</span>
						<h2 class="mt-0 mb-3">
							<a href="#">5 Job Types That Aallow You To Earn As You Travel
								The World</a>
						</h2>
						<p>Separated they live in Bookmarksgrove right at the coast of
							the Semantics, a large language ocean.</p>
					</div>
				</div>
			</div>
			<div class="col-lg-4 col-md-6 col-sm-6 col-12 post">
				<div class="media media-custom d-block mb-4 h-100">
					<a href="#" class="mb-4 d-block"><img
						src="<%=ctxPath%>/resources/images/img_3.jpg"
						alt="Image placeholder" class="img-fluid"></a>
					<div class="media-body">
						<span class="meta-post">February 26, 2018</span>
						<h2 class="mt-0 mb-3">
							<a href="#">30 Great Ideas On Gifts For Travelers</a>
						</h2>
						<p>A small river named Duden flows by their place and supplies
							it with the necessary regelialia. t is a paradisematic country,
							in which roasted parts of sentences.</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<!-- END section -->
