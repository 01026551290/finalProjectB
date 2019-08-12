<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>


<style type="text/css">

	#wrap {
	   width: 300px;
	   height: auto;
	   position: relative;
	   display: inline-block;
	}
	
	#wrap textarea {
	    width: 100%;
	    resize: none;
	    min-height: 4.5em;
	    line-height: 1.6em;
	    max-height: 9em;
	}
	
	#wrap span#counter2 {
		position: absolute;
	    bottom: 5px;
	    right: 20px;
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
	
	#counter2 {
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
	
	/* input[type=checkbox] {  vertical-align:middle; } */
	
	.chk { 
		margin-right: 15px;
		/* margin:-4px 3px 0 5px;
		vertical-align: middle; */
	}

	.form-control::placeholder {
	    color: #a6a6a6;
	}
	
</style>
    
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
		
		/* 
		$("#spinnerImgQty").bind("spinstop", function(){
			//==== 암기!!! 스피너는 이벤트가 "change" 가 아니라 "spinstop" 이다. ====//
			
			var html = "";
			
			var spinnerImgQtyVal = $("#spinnerImgQty").val();
			
			if(spinnerImgQtyVal == "0") {
				$("#divfileattach").empty(); 
				$("#attachCount").val("");
				return;
			}
			else {
				for(var i=0; i<parseInt(spinnerImgQtyVal); i++) { // 웹은 전부 스트링이기 때문에 parseInt를 써준다. spinnerImgQtyVal 갯수만큼 for문을 돌려라
					html += "<br/>";
					html += "<input type='file' name='attach"+i+"' class='btn btn-default' />";
				}// end of for------------- 
				
				$("#divfileattach").empty(); // 기존 것은 비워내고
				$("#divfileattach").append(html); // input type = 'file' 을 넣어라
				$("#attachCount").val(spinnerImgQtyVal); // 첨부되어진 파일의 갯수가 몇개냐~
			}
		}); // end of $("#spinnerImgQty").bind("spinstop", function(){})-------------------------------
		 */
		 
		// === 숙소명 검증 (공백일 경우) ===
		
		$("input#name").blur(function(){
			
	//		var regExp = /^[A-Za-z0-9ㄱ-ㅎㅏ-ㅣ가-힣]{1,35}$/;
	//		bool = regExp.test(name.value);
			
			if($(this).val()=="") {  
				$("span.name_error").show();

				$(":input").attr("disabled", true);
				
				$(this).attr("disabled",false);
	        	$(this).val("");
	        	$(this).focus();
			} else {
				$("span.name_error").empty();
				$(":input").attr("disabled",false);
				
				$("input#businessTel").focus();
			}
		});
		
		
		// === 전화번호 검증 (공백일 경우) ===
		
		$("input#businessTel").blur(function(){
			
			if($(this).val()=="") {  
				$("span.businessTel_error").show();

				$(":input").attr("disabled", true);
				
				$(this).attr("disabled",false);
	        	$(this).val("");
	        	$(this).focus();
			} else {
				$("span.businessTel_error").empty();
				$(":input").attr("disabled",false);
				
				$("input#info").focus();
			}
		});
		
		
		// === 소개글 검증 (공백일 경우) ===
			
		$("textarea#info").blur(function(){
			
			if($(this).val()=="") {  
				$("span.info_error").show();

				$(":input").attr("disabled", true);
				
				$(this).attr("disabled",false);
	        	$(this).val("");
	        	$(this).focus();
			} else {
				$("span.info_error").empty();
				$(":input").attr("disabled",false);
				
				$("input#address").focus();
			}
		});
		
		
		// === 주소 검증 ===
		/*	
		// 주소 텍스트박스에 포커스를 얻은 경우
		$("input#address").focus(function(){
			$("#btnFind").trigger("click"); // 주소 찾기 버튼이 강제로 클릭된다	
			
			if($(this).val()!="") {
				$("input#ontionType").focus();
			}
		});
		*/
		// 주소 텍스트박스에 포커스를 잃은 경우
		$("input#address").blur(function(){ 
			
			if($(this).val()=="") {  
				$("span.address_error").show();

				$(":input").attr("disabled", true);
				$("#btnFind").attr("disabled", false);
				
				$(this).attr("disabled",false);
	        	$(this).val("");
	        	$(this).focus();
			} else {
				$("span.address_error").empty();
				$(":input").attr("disabled",false);
				
			}
			
		}); // $("input#address").blur(function()------------------------------
		
		///////////////////////////////////////////////////
		
		/* $("#btnNext").click(function(){
			func_Next();
			
			
		}); */
		
		
		$("#btnFind").click(function(){ //Find 버튼을 클릭하면
			
			new daum.Postcode({
				oncomplete: function(data) {
				    $("#address").val(data.address); // 큰주소  	예> 서울특별시 종로구 인사로 17 
				    $(":input").attr("disabled",false);
				}
			}).open();
			
//			goAddressToLatlng(addressVal);
		});
		
	}); // end of $(document).ready()-------------------

	$(function() {
		// 소개글 글자수 카운터
	      $('#info').keyup(function (e){
	          var info = $(this).val();
	          $(this).height(((info.split('\n').length + 1) * 1.5) + 'em');
	          $('#counter').html(info.length + '/250');
	      });
	      $('#info').keyup();
	
		// 숙소명 글자수 카운터
	    $('#name').keyup(function (e){
	        var name = $(this).val();
	        $(this).height(((name.split('\n').length + 1) * 1.5) + 'em');
	        $('#counter2').html(name.length + '/35');
	    });
	    $('#name').keyup();
	    
	});
	
	function goNext(event) {
		
	var fk_LargeCategoryCode = $("select[name=fk_LargeCategoryCode]").val(); 
		
//		console.log(fk_LargeCategoryCode); //숙소가 선택되는지 콘솔로 검사
		
		if(fk_LargeCategoryCode==null) {     
			alert("숙소유형을 선택해주세요!");
			return;
		}
		
		if($("#name").val()=="") {
			alert("숙소명을 입력해주세요!");
			name.focus();
			return;
		}
		
		// === 전화번호 검사하기 (공백이거나 잘못된 전화번호일 경우 경고창이 뜨게 한다) ===
		var businessTel = document.getElementById("businessTel");
		regExp = /^\d{2,3}\d{3,4}\d{4}$/;
		
		var bool = regExp.test(businessTel.value);
		if(!bool || !(10<= businessTel.value.length <= 11)){
			alert("잘못된 전화번호 입니다.");
			businessTel.value="";
			businessTel.focus();
			return;
		}
		
		// === 주소 검사하기 (공백일 경우)
		var addressVal = $("#address").val().trim();
		
		if(addressVal=="") {
			alert("주소를 입력해주세요!");
			addressVal.focus();
			return;
		}
		
		var ontionTypeBool = $("input:checkbox[name=ontionType]").is(":checked");
		
		if( !ontionTypeBool ) {
			alert("옵션을 선택하세요!");
			return;
		}
		
		var test = new Array(); //배열선언

		$("input[name=ontionType]:checked").each(function() {

			//test += $(this).val();

		    test.push($(this).val());   // 값 찍어보시면 a,b 이런식으로 콤마 구분자가 같이 들어갑니다. 

		});
		
		var frm = document.roomrgFrm;
		frm.method = "POST";
		frm.action = "<%= request.getContextPath()%>/roomrgEnd.go";
		frm.submit();
	}
	
	    function func_Next() {
		
    	/*
		var fk_LargeCategoryCode = $("select[name=fk_LargeCategoryCode]").val(); 
		
//		console.log(fk_LargeCategoryCode); //숙소가 선택되는지 콘솔로 검사
		
		if(fk_LargeCategoryCode==null) {     
			alert("숙소유형을 선택해주세요!");
			return;
		}
		
		if($("#name").val()=="") {
			alert("숙소명을 입력해주세요!");
			name.focus();
			return;
		}
		
		// === 전화번호 검사하기 (공백이거나 잘못된 전화번호일 경우 경고창이 뜨게 한다) ===
		var businessTel = document.getElementById("businessTel");
		regExp = /^\d{2,3}\d{3,4}\d{4}$/;
		
		var bool = regExp.test(businessTel.value);
		if(!bool || !(10<= businessTel.value.length <= 11)){
			alert("잘못된 전화번호 입니다.");
			businessTel.value="";
			businessTel.focus();
			return;
		}
		
		// === 주소 검사하기 (공백일 경우)
		var addressVal = $("#address").val().trim();
		
		if(addressVal=="") {
			alert("주소를 입력해주세요!");
			addressVal.focus();
			return;
		}
		
		var ontionTypeBool = $("input:checkbox[name=ontionType]").is(":checked");
		
		if( !ontionTypeBool ) {
			alert("옵션을 선택하세요!");
		}
		
		var test = new Array(); //배열선언

		*/
		
		$("input[name=ontionType]:checked").each(function() {

		    test.push($(this).val());   // 값 찍어보시면 a,b 이런식으로 콤마 구분자가 같이 들어갑니다. 

		});
		
	} 

	
</script>  
    
    
<section class="site-hero inner-page overlay" style="background-image: url(/god/resources/images/hero_4.jpg)" data-stellar-background-ratio="0.5">
      <div class="container">
        <div class="row site-hero-inner justify-content-center align-items-center">
          <div class="col-md-10 text-center" data-aos="fade">
            <h1 class="heading mb-3">숙소 등록</h1>
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
          <div class="col-md-12" data-aos="fade-up" data-aos-delay="100" >
            
            <form name="roomrgFrm" class="bg-white p-md-5 p-4 mb-5 border"  enctype="multipart/form-data" >
              <div class="row">
                <div class="col-md-12 form-group">
                    <label class="text-black font-weight-bold" for="rtype">숙소 유형</label>
                    <div class="field-icon-wrap">
                    <div class="icon"><span class="ion-ios-arrow-down"></span></div>
                    <select name="fk_LargeCategoryCode" id="rtype" class="form-control">
                      <option value="" selected disabled hidden>선택하세요</option>
                      <option value="10" >호텔</option>
                      <option value="20">리조트</option>
                      <option value="30">게스트하우스</option>
                      <option value="40">모텔</option>
                      <option value="50">펜션</option>
                      <option value="60">호스텔</option>
                    </select>
                  </div>
                </div>
              </div>
          
              <div class="row">
                <div class="col-md-6 form-group" id="wrap">
                  <label for="name" class="text-black font-weight-bold">숙소명</label>
                  <span class="error name_error">숙소명을 입력해주세요</span>
                  <input type="text" id="name" name="name" class="form-control" placeholder="숙소의 이름을 지어주세요" maxlength="35">
                	<span id="counter2" style="color: white;">###</span>
                </div>
                <div class="col-md-6 form-group">
                  <label for="businessTel" class="text-black font-weight-bold">전화번호</label>
                  <span class="error businessTel_error">전화번호를 입력해주세요</span>
                  <input type="text" name="businessTel" id="businessTel" class="form-control" placeholder="예) 0647355114" style= "height:64px;">
                </div>
              </div>
                
              <div class="row mb-4" >
                <div class="col-md-12 form-group" id="wrap">
                  <label for="info" class="text-black font-weight-bold">소개글</label>
                  <span class="error info_error">소개글을 입력해주세요</span>
                  <textarea name="info" id="info" maxlength="250" class="form-control " cols="30" rows="8" placeholder="숙소의 장점을 자랑하세요. 인테리어, 편의시설, 주변 지역에 관한 세부정보를 포함할 수 있습니다"></textarea>
                	<span id="counter" style="color: white;">###</span>
                </div>
              </div>
              
              <div class="row">
                <div class="col-md-10 form-group">
                  <label for="address" class="text-black font-weight-bold">주소</label>
                  <span class="error address_error">주소를 입력해주세요</span>
                  <input type="text" id="address" class="form-control" placeholder="예) 서울특별시 중구 남대문로 120" name="address" readonly>
                </div>
                <div class="col-md-2 form-group">
                  <br/>
                  <input type="button" value="Find" id="btnFind" class="btn btn-primary text-white py-3 px-5 font-weight-bold" style="margin-left: -15px;">
                </div>
              </div>

               <div class="row checkbox"> 
                <div class="col-md-12 form-group">
                    <label for="ontionType" class="text-black font-weight-bold" >옵션</label><br/>
                    <input type="checkbox" id="restaurant" name="ontionType" value="레스토랑">&nbsp;<label for="restaurant" class="chk">레스토랑</label>
                    <input type="checkbox" id="breakfast" name="ontionType" value="조식">&nbsp;<label for="breakfast" class="chk">조식</label>
                    <input type="checkbox" id="pickup" name="ontionType" value="공항픽업서비스">&nbsp;<label for="pickup" class="chk">픽업서비스</label>
                    <input type="checkbox" id="conference" name="ontionType" value="회의시설">&nbsp;<label for="conference" class="chk">회의시설</label>
                    <input type="checkbox" id="lounge" name="ontionType" value="라운지바">&nbsp;<label for="lounge" class="chk">라운지바</label>
                    <input type="checkbox" id="business" name="ontionType" value="비즈니스시설">&nbsp;<label for="business" class="chk">비즈니스시설</label>
                    <input type="checkbox" id="swimming" name="ontionType" value="수영장">&nbsp;<label for="swimming" class="chk">수영장</label>
                    <input type="checkbox" id="parking" name="ontionType" value="주차장">&nbsp;<label for="parking" class="chk">주차장</label>
                    <input type="checkbox" id="valet" name="ontionType" value="발렛파킹">&nbsp;<label for="valet" class="chk">발렛파킹</label>
                    <input type="checkbox" id="sauna" name="ontionType" value="찜질방">&nbsp;<label for="sauna" class="chk">찜질방</label>
                    <input type="checkbox" id="disabled" name="ontionType" class="chk" value="장애인편의시설">&nbsp;<label for="disabled" class="chk">장애인편의시설</label>
                    <input type="checkbox" id="tennis" name="ontionType" value="테니스코트">&nbsp;<label for="tennis" class="chk">테니스코트</label>
                    <input type="checkbox" id="smoking" name="smoking" value="흡연실">&nbsp;<label for="smoking" class="chk">흡연실</label>
                    <input type="checkbox" id="24checkin" name="24checkin" value="24시간 체크인">&nbsp;<label for="24checkin" class="chk">24시간 체크인</label>
                </div>
               </div>
                
				<!-- 스피너로 첨부 추가 이미지파일 첨부하기!!!! -->
				<%-- ==== 첨부파일 타입 추가하기 ==== --%>
				<!-- 
				<label for="img" class="text-black font-weight-bold" >숙소 이미지 첨부</label><br/>
		       	<td width="25%" class="prodInputName" style="padding-bottom: 10px;">추가이미지파일(선택)</td>
		       	<td>
		       		<label for="spinnerImgQty">파일갯수 : </label>
				    <input id="spinnerImgQty" value="0" style="width: 30px; height: 20px;">
		       		<div id="divfileattach"></div>
		       		<input type="hidden" name="attachCount" id="attachCount" class="form-control" style="position: absolute;" /> 
		       	</td>
		       	-->
		       	
		      <div class="row">
		       <div class="col-md-12 form-group" id="wrap">
			      <label for="attach" class="text-black font-weight-bold">파일첨부</label>
				  <input type="file" name="attach" id="attach" class="form-control"/>
		      </div>
		      </div>
                
              <div class="row">
                <div class="col-md-6 form-group">
                	<input type="button" value="Next" id="btnNext" class="btn btn-primary text-white py-3 px-5 font-weight-bold" style="margin-top: 30px;" onclick="goNext(event);"/>
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
<!-- 
    <section class="section testimonial-section bg-light">
      <div class="container">
        <div class="row justify-content-center text-center mb-5">
          <div class="col-md-7">
            <h2 class="heading" data-aos="fade-up">People Says</h2>
          </div>
        </div>
        <div class="row">
          <div class="js-carousel-2 owl-carousel mb-5" data-aos="fade-up" data-aos-delay="200">
            
            <div class="testimonial text-center slider-item">
              <div class="author-image mb-3">
                <img src="images/person_1.jpg" alt="Image placeholder" class="rounded-circle mx-auto">
              </div>
              <blockquote>

                <p>&ldquo;A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth.&rdquo;</p>
              </blockquote>
              <p><em>&mdash; Jean Smith</em></p>
            </div> 

            <div class="testimonial text-center slider-item">
              <div class="author-image mb-3">
                <img src="images/person_2.jpg" alt="Image placeholder" class="rounded-circle mx-auto">
              </div>
              <blockquote>
                <p>&ldquo;Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life One day however a small line of blind text by the name of Lorem Ipsum decided to leave for the far World of Grammar.&rdquo;</p>
              </blockquote>
              <p><em>&mdash; John Doe</em></p>
            </div>

            <div class="testimonial text-center slider-item">
              <div class="author-image mb-3">
                <img src="images/person_3.jpg" alt="Image placeholder" class="rounded-circle mx-auto">
              </div>
              <blockquote>

                <p>&ldquo;When she reached the first hills of the Italic Mountains, she had a last view back on the skyline of her hometown Bookmarksgrove, the headline of Alphabet Village and the subline of her own road, the Line Lane.&rdquo;</p>
              </blockquote>
              <p><em>&mdash; John Doe</em></p>
            </div>


            <div class="testimonial text-center slider-item">
              <div class="author-image mb-3">
                <img src="images/person_1.jpg" alt="Image placeholder" class="rounded-circle mx-auto">
              </div>
              <blockquote>

                <p>&ldquo;A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth.&rdquo;</p>
              </blockquote>
              <p><em>&mdash; Jean Smith</em></p>
            </div> 

            <div class="testimonial text-center slider-item">
              <div class="author-image mb-3">
                <img src="images/person_2.jpg" alt="Image placeholder" class="rounded-circle mx-auto">
              </div>
              <blockquote>
                <p>&ldquo;Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life One day however a small line of blind text by the name of Lorem Ipsum decided to leave for the far World of Grammar.&rdquo;</p>
              </blockquote>
              <p><em>&mdash; John Doe</em></p>
            </div>

            <div class="testimonial text-center slider-item">
              <div class="author-image mb-3">
                <img src="images/person_3.jpg" alt="Image placeholder" class="rounded-circle mx-auto">
              </div>
              <blockquote>

                <p>&ldquo;When she reached the first hills of the Italic Mountains, she had a last view back on the skyline of her hometown Bookmarksgrove, the headline of Alphabet Village and the subline of her own road, the Line Lane.&rdquo;</p>
              </blockquote>
              <p><em>&mdash; John Doe</em></p>
            </div>

          </div>
            END slider
        </div>
      </div>
    </section> -->