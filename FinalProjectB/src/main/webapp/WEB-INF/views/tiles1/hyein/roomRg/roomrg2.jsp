<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style type="text/css">
	
	.form-control::placeholder {
		color: #a6a6a6;
	}

	.chk {
		margin-right: 15px;
	}

	#wrap span#counter {
		position: absolute;
	    bottom: 5px;
	    right: 20px;
	}
	
	#counter {
    	background: #FFBA5A;
  		border-radius: 0.5em;
  		padding: 0 .5em 0 .5em;
  		font-size: 0.85em;
	}
	
	span.error {
		margin-left: 5px;
		color: red;
		font-size: 9pt;
		font-style: italic;
	}
	
</style>

<script
	src="<%=request.getContextPath()%>/resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	
	$(document).ready(function(){
		
		$(".error").hide();
		
		$("#spinnerImgQty").spinner({
			spin: function(event, ui){
				if(ui.value > 10) { // 파일 이미지가 10개가 넘어간다면
					$(this).spinner("value", 10);
					return false;
				}
				else if(ui.value < 0) { // 파일 이미지가 0개보다 작다면
					$(this).spinner("value", 0);
					return false;
				}
			}
		}); // end of $("#spinnerImgQty").spinner();---------------
		
		$("#spinnerImgQty").bind("spinstop", function(){
			//==== 암기!!! 스피너는 이벤트가 "change" 가 아니라 "spinstop" 이다. ====//
			
			var html = "";
			
			var spinnerImgQtyVal = $("#spinnerImgQty").val();
			
			if(spinnerImgQtyVal == "0") {
				$("#divfileattach").empty(); 
//				$("#attachCount").val("");
				return;
			}
			else {
				for(var i=0; i<parseInt(spinnerImgQtyVal); i++) { // 웹은 전부 스트링이기 때문에 parseInt를 써준다. spinnerImgQtyVal 갯수만큼 for문을 돌려라
					html += "<br/>";
					html += "<input type='file' name='attach' class='btn btn-default' />";
				}// end of for------------- 
				
				$("#divfileattach").empty(); // 기존 것은 비워내고
				$("#divfileattach").append(html); // input type = 'file' 을 넣어라
//				$("#attachCount").val(spinnerImgQtyVal); // 첨부되어진 파일의 갯수가 몇개냐~
			}
		}); // end of $("#spinnerImgQty").bind("spinstop", function(){})-------------------------------
		 
		
		// === 숙소명 검증하기 ===
		$("input#searchWord").blur(function(){
			
			if($(this).val()=="") {  
				$("span.searchWord_error").show();

				$(":input").attr("disabled", true);
				
				$(this).attr("disabled",false);
	        	$(this).val("");
	        	$(this).focus();
			} else {
				$("span.searchWord_error").empty();
				$(":input").attr("disabled",false);
				
				$("input#productName").focus();
			}
		});
		
		
		// 객실 등록 폼의 숙소명 검색어 자동완성하기 2
		$("#displayList").hide();
		$("#hiddenOntioncode").hide();
		
		
			$("#searchWord").keyup(function(){
			
			var form_data = {searchWord:$("#searchWord").val()};
			
			$.ajax({
				url:"<%=request.getContextPath()%>/wordSearch.go",
				type:"GET",
				data:form_data,
				dataType:"JSON",
				success:function(json) {
					
					//////////////////////////////////////////////////////////////
					
					if(json.length > 0) {
					
						var html = "";
						
						$.each(json, function(entryIndex, item){
							var name = item.name;
//							console.log(name);
							var len = $("#searchWord").val().length;
							var result = "";
							
							if(name != null && name.length > 0) {
							var indexN = name.toLowerCase().indexOf( $("#searchWord").val().toLowerCase() );
								result += "<span class='clickWord' style='display: inline-block; width: 100%;'><span class='first'>" +name.substr(0, indexN)+ "</span>" + "<span class='second' style='color:#ffaa34;'>" +name.substr(indexN, len)+ "</span>" + "<span class='third'>" +name.substr(indexN+len)+ "</span></span></div>";
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
					
					/////////////////////////////////////////////////////////////
					
				}, 
				error: function(request, status, error){
					alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
				}
			});
		});
			
		<%-- 	
		$("#displayList").click(function(event){
			/* 
			var word = "";
			var $target = $(event.target);
			
			if($target.is(".clickWord")) { // 호텔명을 클릭했을 때
				word = $target.text();     // 텍스트박스로 값이 들어오고
			 */	
				
				//var form_data = {searchWord:$("#searchNo").val()};
				
				$.ajax({
					url:"<%=request.getContextPath()%>/largeCodeSearch.go",
					type:"GET",
					data:$("#searchNo").val(),
					dataType:"JSON",
					success:function(json) {
						if(json.length > 0) {
							$.each(json, function(entryIndex, item){
								var largeCategoryontionCode = item.largeCategoryontionCode;
								$("#largeCategoryontionCode").val(largeCategoryontionCode);
							});
						}
					}, 
					error: function(request, status, error){
						alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
					}
				});
		}); 
		 --%>
		 
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
			
			var form_data = {searchWord:word};
			
			$.ajax({
				url:"<%=request.getContextPath()%>/largeCodeSearch.go",
				type:"GET",
				data:form_data,
				dataType:"JSON",
				success:function(json) {
					if(json.length > 0) {
						$.each(json, function(entryIndex, item){
							var largeCategoryontionCode = item.largeCategoryontionCode;
							$("#largeCategoryontionCode").val(largeCategoryontionCode);
							
							var fk_LargeCategoryCode = item.fk_LargeCategoryCode;
							$("#fk_LargeCategoryCode").val(fk_LargeCategoryCode);
						});
					}
				}, 
				error: function(request, status, error){
					alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
				}
			});
			
		});
		
		
		// === 객실명 검증하기 ===
		$("input#productName").blur(function(){
			
			if($(this).val()=="") {  
				$("span.productName_error").show();

				$(":input").attr("disabled", true);
				
				$(this).attr("disabled",false);
	        	$(this).val("");
	        	$(this).focus();
			} else {
				$("span.productName_error").empty();
				$(":input").attr("disabled",false);
				
				$("input#bedCnt").focus();
			}
		});
		
		// === 소개글 검증 (공백일 경우) ===
		$("textarea#roomInfo").blur(function(){
			
			if($(this).val()=="") {  
				$("span.roomInfo_error").show();

				$(":input").attr("disabled", true);
				
				$(this).attr("disabled",false);
	        	$(this).val("");
	        	$(this).focus();
			} else {
				$("span.roomInfo_error").empty();
				$(":input").attr("disabled",false);
				
				$("input#address").focus();
			}
		});
		
		// === 주중가 검증 ===
		$("input#weekPrice").blur(function(){
			
			if($(this).val()=="") {  
				$("span.weekPrice_error").show();

				$(":input").attr("disabled", true);
				
				$(this).attr("disabled",false);
	        	$(this).val("");
	        	$(this).focus();
			} else {
				$("span.weekPrice_error").empty();
				$(":input").attr("disabled",false);
				
				$("input#weekenPrice").focus();
			}
		});
		
		// === 주말가 검증 ===
		$("input#weekenPrice").blur(function(){
			
			if($(this).val()=="") {  
				$("span.weekenPrice_error").show();

				$(":input").attr("disabled", true);
				
				$(this).attr("disabled",false);
	        	$(this).val("");
	        	$(this).focus();
			} else {
				$("span.weekenPrice_error").empty();
				$(":input").attr("disabled",false);
				
//ㄴ				$("input#weekenPrice").focus();
			}
		});
		
		/* 
		// === 숙소 등록 가능일 검증하기 ===
		$("input#checkin_date").blur(function(){
			
			if($(this).val()=="") {  
				$("span.checkin_date_error").show();

				$(":input").attr("disabled", true);
				
				$(this).attr("disabled",false);
	        	$(this).val("");
	        	$(this).focus();
			} else {
				$("span.checkin_date_error").empty();
				$(":input").attr("disabled",false);
				
				$("input#checkout_date").focus();
			}
		});
		 */
		 
		/* 
		// === 숙소 등록 종료일 검증하기 ===
		$("input#checkout_date").blur(function(){
			
			if($(this).val()=="") {  
				$("span.checkout_date_error").show();

				$(":input").attr("disabled", true);
				
				$(this).attr("disabled",false);
	        	$(this).val("");
	        	$(this).focus();
			} else {
				$("span.checkout_date_error").empty();
				$(":input").attr("disabled",false);
				
				$("input#bedCnt").focus();
			}
		});
		 */
		
		///// 숙소 등록 가능일 데이트 피커
		var rangeDate = 365; // set limit day
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
		        	}
		        });
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
			
		}); // end of $(document).ready(function(){})-------------
	
		$(function() {
			// 소개글 글자수 카운터
		      $('#roomInfo').keyup(function (e){
		          var roomInfo = $(this).val();
		          $(this).height(((roomInfo.split('\n').length + 1) * 1.5) + 'em');
		          $('#counter').html(roomInfo.length + '/250');
		      });
		      $('#roomInfo').keyup();
		});
		
		function goSearch() {
			var frm = document.infoSearchFrm;
			frm.method = "GET";
			frm.action = "<%=request.getContextPath()%>/list.go";
			frm.submit();
		}

	
		function categoryChange(e) {
			var good_a = [ "1인" ];
			var good_b = [ "2인" ];
			var good_c = [ "3인" ];
			var target = document.getElementById("good");
	
			if (e.value == "a")
				var d = good_a;
			else if (e.value == "b")
				var d = good_b;
			else if (e.value == "c")
				var d = good_c;
	
			target.options.length = 0;
	
			for (x in d) {
				var opt = document.createElement("option");
				opt.value = d[x];
				opt.innerHTML = d[x];
				target.appendChild(opt);
			}
		}

	
		function goRegister(event) {
			
			// 침대 갯수가 선택되지 않았다면
			if(roomrg2Frm.bedCnt.value == "") {
				alert("침대 갯수를 선택해주세요!");
				roomrg2Frm.bedCnt.focus();
				return;
			}
			
			// 수용 인원이 선택되지 않았다면
			if(roomrg2Frm.peopleCnt.value == "") {
				alert("수용 인원을 선택해주세요!");
				roomrg2Frm.peopleCnt.focus();
				return;
			}
			
			// 숙소 등록 가능일이 선택되지 않았다면
			if(roomrg2Frm.checkin_date.value == "") {
				alert("숙소 등록 가능일을 선택해주세요!");
				roomrg2Frm.checkin_date.focus();
				return;
			}
			
			// 숙소 등록 종료일이 선택되지 않았다면
			if(roomrg2Frm.checkout_date.value == "") {
				alert("숙소 등록 종료일을 선택해주세요!");
				roomrg2Frm.checkout_date.focus();
				return;
			}
			
			var ontionTypeBool = $("input:checkbox[name=roomOption]").is(":checked");
			
			if( !ontionTypeBool ) {
				alert("객실 옵션을 선택하세요!");
				return;
			}
			
			if($("#spinnerImgQty").val()=="0") {
				alert("숙소 이미지 첨부파일을 입력하세요!!");
				return;
			}
			
			var test = new Array(); //배열선언
			
			$("input[name=roomOption]:checked").each(function() {
			
				test.push($(this).val());   // 값을 찍으면 a,b 이런식으로 콤마 구분자가 같이 들어간다. 
			
			});
			
			var frm = document.roomrg2Frm;
			frm.method = "POST";
			frm.action = "<%= request.getContextPath()%>/roomrg2End.go";
			frm.submit();
		}
		
</script>

<section class="site-hero inner-page overlay"
	style="background-image: url(/god/resources/images/hero_4.jpg)"
	data-stellar-background-ratio="0.5">
	<div class="container">
		<div
			class="row site-hero-inner justify-content-center align-items-center">
			<div class="col-md-10 text-center" data-aos="fade">
				<h1 class="heading mb-3">객실 등록</h1>
				<ul class="custom-breadcrumbs mb-4">
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
<!-- END section -->

<section class="section contact-section" id="next">
	<div class="container">
		<div class="row">
			<div class="col-md-12" data-aos="fade-up" data-aos-delay="100">

				<!-- 
            <select onchange="categoryChange(this)">
	  			<option>룸을 선택해주세요</option>
				<option value="a">싱글룸</option>
				<option value="b">더블룸</option>
				<option value="c">트리플룸</option>
			</select>
 
			<select id="good">
				<option>수용인원</option>
			</select>
             -->

				<form name="roomrg2Frm" class="bg-white p-md-5 p-4 mb-5 border" enctype="multipart/form-data">

					<div class="row">
						<div class="col-md-12 form-group" id="wrap">
							<label for="searchWord" class="text-black font-weight-bold">숙소명</label>
							<span class="error searchWord_error">숙소를 검색해주세요</span>
							<input type="text" id="searchWord" name="name" class="form-control"
								placeholder="숙소를 검색해주세요" autocomplete="off">
								
							<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->	
							<input type="hidden" id="fk_LargeCategoryCode" name="fk_LargeCategoryCode" />	
							<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
								
							<div id="displayList" style="width: 95%;"></div>
							<input type="hidden" name="largeCategoryontionCode" id="largeCategoryontionCode" value="">
						</div>
						<!-- <span id="counter2" style="color: white;"></span> -->
					</div>

					<div class="row">
						<div class="col-md-12 form-group">
							<label class="text-black font-weight-bold" for="productName">객실명</label>
							<div class="field-icon-wrap">
								<span class="error productName_error">객실명을 입력해주세요</span>
								<input type="text" id="productName" name="productName"
									class="form-control" placeholder="객실 이름을 지어주세요" maxlength="30">
							</div>
						</div>
					</div>

					<div class="row">
						<div class="col-md-6 form-group">
							<label class="text-black font-weight-bold" for="bedCnt">침대 갯수</label>
							<div class="field-icon-wrap">
							<span class="error bedCnt_error">침대 갯수를 선택하세요</span>
								<div class="icon">
									<span class="ion-ios-arrow-down"></span>
								</div>
								<select name="bedCnt" id="bedCnt" class="form-control">
									<option value="" selected disabled hidden>선택하세요</option>
									<option value="1">1개</option>
									<option value="2">2개</option>
									<option value="3">3개</option>
									<option value="4">4개</option>
									<option value="5">5개</option>
									<option value="6">6개</option>
								</select>
							</div>
						</div>
						<div class="col-md-6 form-group">
							<label class="text-black font-weight-bold" for="peopleCnt">수용
								인원</label>
							<div class="field-icon-wrap">
								<div class="icon">
									<span class="error peopleCnt_error">수용 인원을 선택하세요</span>
									<span class="ion-ios-arrow-down"></span>
								</div>
								<select name="peopleCnt" id="peopleCnt" class="form-control">
									<option value="" selected disabled hidden>선택하세요</option>
									<option value="1">1인</option>
									<option value="2">2인</option>
									<option value="3">3인</option>
									<option value="4">4인</option>
									<option value="5">5인</option>
									<option value="6">6인</option>
								</select>
							</div>
						</div>
					</div>
					
					<div class="row mb-4" >
		                <div class="col-md-12 form-group" id="wrap">
		                  <label for="roomInfo" class="text-black font-weight-bold">소개글</label>
		                  <span class="error roomInfo_error">소개글을 입력해주세요</span>
		                  <textarea name="roomInfo" id="roomInfo" maxlength="250" class="form-control " cols="30" rows="8" placeholder="룸을 소개해주세요. 인테리어, 편의시설을 포함할 수 있습니다"></textarea>
		                  <span id="counter" style="color: white;">###</span>
		                </div>
		            </div>
					
					<div class="row">
						<div class="col-md-6 form-group">
							<label class="text-black font-weight-bold" for="weekPrice">주중가</label>
							 <span class="error weekPrice_error">주중가를 입력해주세요</span>
							<input type="text" name="weekPrice" id="weekPrice" class="form-control"
								placeholder="원" maxlength="20">
						</div>
						<div class="col-md-6 form-group">
							<label class="text-black font-weight-bold" for="weekenPrice">주말가</label>
							<span class="error weekenPrice_error">주말가를 입력해주세요</span>
							<input type="text" name="weekenPrice" id="weekenPrice" class="form-control"
								placeholder="원" maxlength="20">
						</div>
					</div>

					<!-- 
                <div class="row">
                <div class="col-md-4 form-group">
                  <label class="text-black font-weight-bold" for="gname">숙소 등록 가능일</label>
                  <input type="text" id="gname" class="form-control" placeholder="년">
                </div>
                <div class="col-md-4 form-group">
                  <label class="text-black font-weight-bold" for="gphone">&nbsp;</label>
                  <input type="text" id="gphone" class="form-control" placeholder="월">
                </div>
                <div class="col-md-4 form-group">
                  <label class="text-black font-weight-bold" for="gphone">&nbsp;</label>
                  <input type="text" id="gphone" class="form-control" placeholder="일">
                </div>
              </div>
              
              <div class="row">
                <div class="col-md-4 form-group">
                  <label class="text-black font-weight-bold" for="gname">숙소 등록 종료일</label>
                  <input type="text" id="gname" class="form-control" placeholder="년">
                </div>
                <div class="col-md-4 form-group">
                  <label class="text-black font-weight-bold" for="gphone">&nbsp;</label>
                  <input type="text" id="gphone" class="form-control" placeholder="월">
                </div>
                <div class="col-md-4 form-group">
                  <label class="text-black font-weight-bold" for="gphone">&nbsp;</label>
                  <input type="text" id="gphone" class="form-control" placeholder="일">
                </div>
              </div> 
              -->

					<div class="row">
						<div class="col-md-6 form-group">
							<label for="checkin_date" class="font-weight-bold text-black">숙소
								등록 가능일</label>
							<div class="field-icon-wrap">
								<div class="icon">
									<span class="icon-calendar"></span>
								</div>
								<input type="text" id="checkin_date" name="productPeriod1"
									type="date" class="form-control" style="padding-right: 0;"
									autocomplete="off" placeholder="년-월-일">
							</div>
						</div>
						<div class="col-md-6 form-group">
							<label for="checkout_date" class="font-weight-bold text-black">숙소
								등록 종료일</label>
							<div class="field-icon-wrap">
								<div class="icon">
									<span class="icon-calendar"></span>
								</div>
								<input type="text" id="checkout_date" type="date"
									name="productPeriod2" class="form-control"
									style="padding-right: 0;" autocomplete="off"
									placeholder="년-월-일">
							</div>
						</div>
					</div>

					<div class="row">
						<div class="col-md-12 form-group">
							<label class="text-black font-weight-bold">객실 옵션</label><br />
							
							<input type="checkbox" id="single" name="roomOption" value="싱글베드">&nbsp;
							<label for="single" class="chk">싱글베드</label>
							
							<input type="checkbox" id="double" name="roomOption" value="더블베드">&nbsp;
							<label for="double" class="chk">더블베드</label>
							
							<input type="checkbox" id="breakfast" name="roomOption" value="조식">&nbsp;
							<label for="breakfast" class="chk">조식</label>
							
							<input type="checkbox" id="essential" name="roomOption" value="필수품목">&nbsp;
							<label for="essential" class="chk">필수품목</label> 
							
							<input type="checkbox" id="roomtv" name="roomOption" value="TV">&nbsp;
							<label for="roomtv" class="chk">TV</label>
							
							<input type="checkbox" id="cabletv" name="roomOption" value="케이블 TV">&nbsp;
							<label for="cabletv" class="chk">케이블 TV</label> 
							
							<input type="checkbox" id="aircon" name="roomOption" value="에어컨">&nbsp;
							<label for="aircon" class="chk">에어컨</label>
							 
							<input type="checkbox" id="heating" name="roomOption" value="난방">&nbsp;
							<label for="heating" class="chk">난방</label>
							
							<input type="checkbox" id="kitchen" name="roomOption" value="부엌">&nbsp;
							<label for="kitchen" class="chk">부엌</label>
							 
							<input type="checkbox" id="internet" name="roomOption" value="인터넷">&nbsp;
							<label for="internet" class="chk">인터넷</label> 
							
							<input type="checkbox" id="wifi" name="roomOption" value="무선 인터넷">&nbsp;
							<label for="wifi" class="chk">무선 인터넷</label>
							
						</div>
					</div>
					
					<%-- ==== 첨부파일 타입 추가하기 ==== --%>
					<div class="row">
						<div class="col-md-6 form-group">
							<label for="spinnerImgQty" class="font-weight-bold text-black" >숙소 이미지 첨부</label><br/>
						    	<input id="spinnerImgQty" value="0" style="width: 30px; height: 20px;">
				       		<div id="divfileattach"></div>
				       		<!-- <input type="hidden" name="attachCount" id="attachCount" class="form-control" style="position: absolute;" /> -->
				       	</div> 
					</div>
					
					<!-- 
					<div class="row">
			       		<div class="col-md-12 form-group" id="wrap">
					     	<label for="attach" class="text-black font-weight-bold">파일첨부</label>
							<input type="file" multiple="multiple" class="form-control" name="attach"/>
						</div>
      				</div>	
					 -->
					 
					<div class="row">
						<div class="col-md-6 form-group">
							<input type="button" value="등록하기" id="btnRegister"
								class="btn btn-primary text-white py-3 px-5 font-weight-bold"
								onclick="goRegister(event);">
						</div>
					</div>
				</form>

			</div>
			<!-- <div class="col-md-5" data-aos="fade-up" data-aos-delay="200">
            <div class="row">
              <div class="col-md-10 ml-auto contact-info">
                <p><span class="d-block">Address:</span> <span class="text-black"> 98 West 21th Street, Suite 721 New York NY 10016</span></p>
                <p><span class="d-block">Phone:</span> <span class="text-black"> (+1) 435 3533</span></p>
                <p><span class="d-block">Email:</span> <span class="text-black"> info@yourdomain.com</span></p>
              </div>
            </div>
          </div>-->
		</div>
	</div>
</section>

<!-- <section class="section testimonial-section bg-light">
	<div class="container">
		<div class="row justify-content-center text-center mb-5">
			<div class="col-md-7">
				<h2 class="heading" data-aos="fade-up">People Says</h2>
			</div>
		</div>
		<div class="row">
			<div class="js-carousel-2 owl-carousel mb-5" data-aos="fade-up"
				data-aos-delay="200">

				<div class="testimonial text-center slider-item">
					<div class="author-image mb-3">
						<img src="images/person_1.jpg" alt="Image placeholder"
							class="rounded-circle mx-auto">
					</div>
					<blockquote>

						<p>&ldquo;A small river named Duden flows by their place and
							supplies it with the necessary regelialia. It is a paradisematic
							country, in which roasted parts of sentences fly into your
							mouth.&rdquo;</p>
					</blockquote>
					<p>
						<em>&mdash; Jean Smith</em>
					</p>
				</div>

				<div class="testimonial text-center slider-item">
					<div class="author-image mb-3">
						<img src="images/person_2.jpg" alt="Image placeholder"
							class="rounded-circle mx-auto">
					</div>
					<blockquote>
						<p>&ldquo;Even the all-powerful Pointing has no control about
							the blind texts it is an almost unorthographic life One day
							however a small line of blind text by the name of Lorem Ipsum
							decided to leave for the far World of Grammar.&rdquo;</p>
					</blockquote>
					<p>
						<em>&mdash; John Doe</em>
					</p>
				</div>

				<div class="testimonial text-center slider-item">
					<div class="author-image mb-3">
						<img src="images/person_3.jpg" alt="Image placeholder"
							class="rounded-circle mx-auto">
					</div>
					<blockquote>

						<p>&ldquo;When she reached the first hills of the Italic
							Mountains, she had a last view back on the skyline of her
							hometown Bookmarksgrove, the headline of Alphabet Village and the
							subline of her own road, the Line Lane.&rdquo;</p>
					</blockquote>
					<p>
						<em>&mdash; John Doe</em>
					</p>
				</div>


				<div class="testimonial text-center slider-item">
					<div class="author-image mb-3">
						<img src="images/person_1.jpg" alt="Image placeholder"
							class="rounded-circle mx-auto">
					</div>
					<blockquote>

						<p>&ldquo;A small river named Duden flows by their place and
							supplies it with the necessary regelialia. It is a paradisematic
							country, in which roasted parts of sentences fly into your
							mouth.&rdquo;</p>
					</blockquote>
					<p>
						<em>&mdash; Jean Smith</em>
					</p>
				</div>

				<div class="testimonial text-center slider-item">
					<div class="author-image mb-3">
						<img src="images/person_2.jpg" alt="Image placeholder"
							class="rounded-circle mx-auto">
					</div>
					<blockquote>
						<p>&ldquo;Even the all-powerful Pointing has no control about
							the blind texts it is an almost unorthographic life One day
							however a small line of blind text by the name of Lorem Ipsum
							decided to leave for the far World of Grammar.&rdquo;</p>
					</blockquote>
					<p>
						<em>&mdash; John Doe</em>
					</p>
				</div>

				<div class="testimonial text-center slider-item">
					<div class="author-image mb-3">
						<img src="images/person_3.jpg" alt="Image placeholder"
							class="rounded-circle mx-auto">
					</div>
					<blockquote>

						<p>&ldquo;When she reached the first hills of the Italic
							Mountains, she had a last view back on the skyline of her
							hometown Bookmarksgrove, the headline of Alphabet Village and the
							subline of her own road, the Line Lane.&rdquo;</p>
					</blockquote>
					<p>
						<em>&mdash; John Doe</em>
					</p>
				</div>

			</div>
			END slider
		</div>

	</div>
</section> -->
<!-- 
<section class="section bg-image overlay"
	style="background-image: url('images/hero_4.jpg');">
	<div class="container">
		<div class="row align-items-center">
			<div class="col-12 col-md-6 text-center mb-4 mb-md-0 text-md-left"
				data-aos="fade-up">
				<h2 class="text-white font-weight-bold">A Best Place To Stay.
					Reserve Now!</h2>
			</div>
			<div class="col-12 col-md-6 text-center text-md-right"
				data-aos="fade-up" data-aos-delay="200">
				<a href="reservation.html"
					class="btn btn-outline-white-primary py-3 text-white px-5">Reserve
					Now</a>
			</div>
		</div>
	</div>
</section> -->