 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
	String ctxPath = request.getContextPath();
%>

<script type="text/javascript">
	$(document).ready(function(){
		// === 검색어 입력시 자동글 완성하기 2 ===
		$("#displayList").hide();
		
		$("#searchWord").keyup(function(){
			
			var form_data = {searchWord:$("#searchWord").val()};
			
			$.ajax({
				url:"<%=request.getContextPath()%>/autosearch/wordSearchView.go",
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
			
		//	goSearch();
		});
		
		///////////////////////////////////////////////////////////////////////////////////
		
		var rangeDate = 31; // set limit day
		var setSdate, setEdate;
		$("#checkin_date").datepicker({
		    dateFormat: 'yy-mm-dd',
		    minDate: 0,
		    onSelect: function(selectDate){
		        var stxt = selectDate.split("-");
		            stxt[1] = stxt[1] - 1;
		        var sdate = new Date(stxt[0], stxt[1], stxt[2]);
		        var edate = new Date(stxt[0], stxt[1], stxt[2]);
		            edate.setDate(sdate.getDate() + rangeDate);
		        
		        $('#checkout_date').datepicker('option', {
		            minDate: selectDate,
		            beforeShow : function () {
		                $("#checkout_date").datepicker( "option", "maxDate", edate );                
		                setSdate = selectDate;
		                console.log(setSdate)
		        }});
		        //checkout_date 설정
		    }
		    //checkin_date 선택되었을 때
		});
		            
		$("#checkout_date").datepicker({ 
		    dateFormat: 'yy-mm-dd',
		    onSelect : function(selectDate){
		        setEdate = selectDate;
		        console.log(setEdate)
		    }
		});
		$("#btnSearch").on("click", function(e){
			/*
		    if($("input#checkin_date").val() == ""){
		        alert("시작일을 선택해주세요.");
		        $("input#checkin_date").focus();
		        return false;
		    }else if($("input#checkout_date").val() == ""){
		        alert("종료일을 선택해주세요.");
		        $("input#checkout_date").focus();
		        return false;
		    }
			*/
		    
		    var t1 = $("input#checkin_date").val().split("-");
		    var t2 = $("input#checkout_date").val().split("-");
		    var t1date = new Date(t1[0], t1[1], t1[2]);
		    var t2date = new Date(t2[0], t2[1], t2[2]);
		    var diff = t2date - t1date;
		    var currDay = 24 * 60 * 60 * 1000;
		    if(parseInt(diff/currDay) > rangeDate){
		        alert("로그 조회 기간은 " + rangeDate + "일을 초과할 수 없습니다.");        
		        return false;
		    }

			var checkin_dateVal = $("input#checkin_date").val();
			var checkout_dateVal = $("input#checkout_date").val();
			checkin_dateVal = checkin_dateVal.substring(0,4) + checkin_dateVal.substring(5,7) + checkin_dateVal.substring(8);
			checkout_dateVal = checkout_dateVal.substring(0,4) + checkout_dateVal.substring(5,7) + checkout_dateVal.substring(8);
			
		//	alert(checkin_dateVal);
		//	alert(checkout_dateVal);
		    
		//	alert("성공")
		});
		//조회 버튼 클릭
		
		///////////////////////////////////////////////////////////////////////////////////
		
	}); // end of $(document).ready------------------------
	
	
	function goSearch() {
		var frm = document.infoSearchFrm;
		frm.method = "GET";
		frm.action = "<%=request.getContextPath()%>/search.go";
		frm.submit();
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
								<input type="text" name="searchWord" id="searchWord" class="form-control"
									placeholder="숙박명 또는 지역명을 검색" autocomplete="off">

								<!-- === 검색어 입력시 자동글 완성하기 1 === -->
								<div id="displayList"></div>
								<!-- //end 검색어 입력시 자동글 완성하기 1 -->

							</div>
						</div>
						<div class="col-md-6 mb-3 mb-md-0 col-lg-3">
							<div class="row">
								<div class="col-md-6 mb-3 mb-md-0">
									<label for="adult" class="font-weight-bold text-black">성인</label>
									<div class="field-icon-wrap">
										<div class="icon">
											<span class="ion-ios-arrow-down"></span>
										</div>
										<select name="adult" id="adults" class="form-control">
											<option value="1" selected>1</option>
											<option value="2">2</option>
											<option value="3">3</option>
											<option value="4">4+</option>
										</select>
									</div>
								</div>
								<div class="col-md-6 mb-3 mb-md-0">
									<label for="children" class="font-weight-bold text-black">아동</label>
									<div class="field-icon-wrap">
										<div class="icon">
											<span class="ion-ios-arrow-down"></span>
										</div>
										<select name="children" id="children" class="form-control">
											<option value="0" selected>0</option>
											<option value="1">1</option>
											<option value="2">2</option>
											<option value="3">3</option>
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
								<input type="text" id="checkin_date" name="checkin_date" type="date" class="form-control" style="padding-right:0;" autocomplete="off">
							</div>
						</div>
						<div class="col-md-6 mb-3 mb-lg-0 col-lg-2">
							<label for="checkout_date" class="font-weight-bold text-black">체크아웃</label>
							<div class="field-icon-wrap">
								<div class="icon">
									<span class="icon-calendar"></span>
								</div>
								<input type="text" id="checkout_date" type="date" name="checkout_date" class="form-control" style="padding-right:0;" autocomplete="off">
							</div>
						</div>
						<div class="col-md-6 col-lg-2 align-self-end">
							<button id="btnSearch" class="btn btn-primary btn-block text-white" onclick="goSearch();">검색</button>
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
		<c:forEach var="hotelvobest" items="${hotelListBest}">
			<div class="col-md-6 col-lg-4">
				<a href="<%=ctxPath%>/product.go?largeCategoryontionCode=${hotelvobest.fk_LargeCategoryOntionCode}" class="room">
					<figure class="img-wrap">
						<img src="<%= ctxPath%>/resources/images/hotel/${hotelvobest.img}" class="img-fluid">
					</figure>
					<div class="room-info px-3">
						<span class="meta-post">${hotelvobest.address}</span>
						<h2 style="font-size: 26px; word-break: break-all;">${hotelvobest.name}</h2>
						<span class="taC text-uppercase letter-spacing-1">
							<fmt:formatNumber value="${hotelvobest.weekenPrice}" pattern="###,###" />원 ~ <fmt:formatNumber value="${hotelvobest.weekPrice}" pattern="###,###" />원
						</span>
						<p class="taL">
							<span class="starAreaIn">
								<span class="starAreaOut" style="width: ${hotelvobest.star*14.6}px;"><span class="blind">star</span></span>
							</span>
							<c:if test="${hotelvobest.star != null}">
								<span style="font-size: 10pt;">${hotelvobest.star}점</span>
							</c:if>
							<c:if test="${hotelvobest.star == null}">
								<span style="font-size: 10pt;">0점</span>
							</c:if>
						</p>
					</div>
				</a>
			</div>
		</c:forEach>
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
			<c:forEach var="hotelvonew" items="${hotelListNew}">
			<div class="col-lg-4 col-md-6 col-sm-6 col-12 post mb-4">
				<div class="media media-custom d-block h-100">
					<a href="<%=ctxPath%>/product.go?largeCategoryontionCode=${hotelvonew.largeCategoryontionCode}" class="mb-4 d-block">
						<img src="<%=ctxPath%>/resources/images/hotel/${hotelvonew.img}" class="img-fluid">
					</a>
					<!-- 하단(호텔명,가격,평점) -->
					<div class="media-body">
						<span class="meta-post">${hotelvonew.address}</span>
						<h2 class="mt-0 mb-3">
							<a href="<%=ctxPath%>/product.go?largeCategoryontionCode=${hotelvonew.largeCategoryontionCode}" style="display: inline-block; white-space: initial;">${hotelvonew.name}</a>
						</h2>
						<%-- <p>${hotelvo.weekPrice}원 ~</p> --%>
						<p>
							<span class="starAreaIn">
								<span class="starAreaOut" style="width: ${hotelvonew.star*14.6}px;"><span class="blind">star</span></span>
							</span>
							<c:if test="${hotelvonew.star != null}">
								<span style="font-size: 10pt;">${hotelvonew.star}점</span>
							</c:if>
							<c:if test="${hotelvonew.star == null}">
								<span style="font-size: 10pt;">0점</span>
							</c:if>
						</p>
					</div>
				</div>
			</div>
			</c:forEach>
		</div>
	</div>
</section>

<!-- END section -->
