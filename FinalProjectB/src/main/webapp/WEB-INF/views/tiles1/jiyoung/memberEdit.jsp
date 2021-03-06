<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String ctxPath = request.getContextPath(); %>
       
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
	
	$(document).ready(function(){

		var now = new Date(); 
		// 자바스크립트에서 현재날짜시각을 얻어온다.
		
		console.log(now.getFullYear());
		// 4자리 년도를 얻어 오는 것이다.
				
		$(".error").hide();
		$("#error_passwd").hide();
		$("#NAME").focus();
		
	/*	
		$("#name").blur(function(){
			var name = $(this).val().trim();
			if(name == "") {
				$(this).parent().find(".error").show();
			}
		}); 
		// 선택자.blur(); 은 선택자에서 포커스 잃어버렸을 경우
		// 발생하는 이벤트 이다.
	*/	
	
		$(".form-control").each(function(){
			$(this).blur(function(){
				var data = $(this).val().trim();
				if(data == "") {
					// 입력하지 않거나 공백만 입력했을 경우
					$(this).parent().find(".error").show();
					$(":input").attr("disabled",true).addClass("bgcol"); 
					$(this).attr("disabled",false).removeClass("bgcol");
					$(this).focus();
				}
				else {
					// 공백이 아닌 글자를 입력했을 경우
					$(this).parent().find(".error").hide();
					$(":input").attr("disabled",false).removeClass("bgcol"); 
				}
			});
		}); // end of $(".form-control").each()-------
		// 선택자.each(); 은
		// 선택자의 갯수만큼 반복처리를 해주는 것이다.
		// 그러므로 $(".form-control").each(); 은
		// 클래스가 form-control 인 것마다 하나하나씩 반복업무를 해주는 것이다.	
	/////////////////////////////////////////////////////////////////	
		$("#MEMBERID").bind("keyup", function(){
			alert("아이디중복확인 버튼을 클릭하여 ID중복 검사를 하세요!!");
			$(this).val("");
		}); // end of $("#MEMBERID").bind()----------
		
		
		/// **** ID중복확인하기 위한 팝업창 띄우기 ****///
		$("#idcheck").click(function() {
			
			// 팝업창 띄우기
			var url = "memberidDuplicateCheck.go"; /* 4 앞에 슬래시 없으면 절대경로이다.*/
			window.open(url, "GET", 
					    "left=500px, top=100px, width=300px, height=230px");
			// 기본적으로 아무런 조건없이 그냥 어떤 창을 띄우면 method 는 GET 방식으로 움직인다. 
			
		});// end of $("#idcheck").click()------------
	/////////////////////////////////////////////////////////////////	
		
		$("#PWD").blur(function(){
			var passwd = $(this).val();
			
		//	var regExp_PW = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9]).*$/g;
			// 또는
			var regExp_PW = new RegExp(/^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9]).*$/g); 
			// 숫자/문자/특수문자/ 포함 형태의 8~15자리 이내의 암호 정규식 객체 생성
			
			var bool = regExp_PW.test(passwd);
			
			if(!bool) {
				$("#error_passwd").show();
				$(":input").attr("disabled",true).addClass("bgcol"); 
				$(this).attr("disabled",false).removeClass("bgcol");
				$(this).focus();
			}
			else {
				$("#error_passwd").hide();
				$(":input").attr("disabled",false).removeClass("bgcol"); 
				$("#pwdcheck").focus();
			} 
		}); // end of $("#pwd").blur()---------------
		
	
		$("#pwdcheck").blur(function(){
			var passwd = $("#PWD").val();
			var passwdCheck = $(this).val();
			
			if(passwd != passwdCheck) {
				$(this).parent().find(".error").show();
				$(":input").attr("disabled",true).addClass("bgcol");
				$(this).attr("disabled",false).removeClass("bgcol");
				$("#PWD").attr("disabled",false).removeClass("bgcol");
				$("#PWD").focus();
			}
			else {
				$(this).parent().find(".error").hide();
				$(":input").attr("disabled",false).removeClass("bgcol");
				$("#NICKNAME").focus();
			}
			
		});// end of $("#pwdcheck").blur()--------------
		/////////////////////////////////////////////////////////////////////////
		
		$("#NICKNAME").bind("keyup", function(){
			alert("닉네임 중복확인 버튼을 클릭하여 닉네임 검사를 하세요!!");
			$(this).val("");
		}); // end of $("#NICKNAME").bind()----------
		
		/// **** 닉네임 중복확인하기 위한 팝업창 띄우기 ****///
		$("#nicknamecheck").click(function() {
			
			// 팝업창 띄우기
			var url = "nicknameDuplicateCheck.go"; /* 4 앞에 슬래시 없으면 절대경로이다.*/
			window.open(url, "GET", 
					    "left=500px, top=100px, width=300px, height=230px");
			// 기본적으로 아무런 조건없이 그냥 어떤 창을 띄우면 method 는 GET 방식으로 움직인다. 
			$("#EMAIL").focus();
		});// end of $("#nicknamecheck").click()------------
		
		///////////////////////////////////////////////////////////////
		/// **** 이메일 중복확인하기 위한 팝업창 띄우기 ****///
		$("#emailcheck").click(function() {
			
			// 팝업창 띄우기
			var url = "emailDuplicateCheck.go"; /* 4 앞에 슬래시 없으면 절대경로이다.*/
			window.open(url, "GET", 
					    "left=500px, top=100px, width=300px, height=230px");
			// 기본적으로 아무런 조건없이 그냥 어떤 창을 띄우면 method 는 GET 방식으로 움직인다. 
		});// end of $("#nicknamecheck").click()------------
		$("#EMAIL").blur(function(){
			
			var email = $(this).val();
			
			var regExp_EMAIL = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;  
			
			var bool = regExp_EMAIL.test(email);
			
			if(!bool) {
				$(this).parent().find(".error").show();
				$(":input").attr("disabled",true).addClass("bgcol");
				$(this).attr("disabled",false).removeClass("bgcol"); 
				
			}
			else {
				$(this).parent().find(".error").hide();
				$(":input").attr("disabled",false).removeClass("bgcol");
				
			}
			
		});// end of $("#email").blur()--------------
		 
		$("#hp2").blur(function(){
			var hp2 = $(this).val();
			
			var bool1 = false;
			var regExp_HP2a = /^[1-9][0-9][0-9]$/g;
			// 3글자가 숫자이라면 들어오도록 검사해주는 정규표현식
			var bool1 = regExp_HP2a.test(hp2);
			
			var bool2 = false;
			var regExp_HP2b = /^[0-9][0-9][0-9][0-9]$/g;
			// 숫자 4자리만 들어오도록 검사해주는 정규표현식
			var bool2 = regExp_HP2b.test(hp2);
			
			if( !(bool1 || bool2) ) {
				$(this).parent().find(".error").show();
				$(":input").attr("disabled", true).addClass("bgcol");
				$(this).attr("disabled", false).removeClass("bgcol");
			}
			else {
				$(this).parent().find(".error").hide();
				$(":input").attr("disabled", false).removeClass("bgcol");
				
			}
			
		});// end of $("#hp2").blur()-------------
		
		$("#hp3").blur(function(){
			var hp3 = $(this).val();
			
			var regExp_HP3 = /^\d{4}$/g;
			// 숫자 4자리만 들어오도록 검사해주는 정규표현식
			
			var bool = regExp_HP3.test(hp3);
			
			if(!bool) {
				$(this).parent().find(".error").show();
				$(":input").attr("disabled", true).addClass("bgcol");
				$(this).attr("disabled", false).removeClass("bgcol");
			}
			else {
				$(this).parent().find(".error").hide();
				$(":input").attr("disabled", false).removeClass("bgcol");
				
			}			
		});// end of $("#hp3").blur()-------------
		
	}); // end of $(document).ready()-------------------
	
	
	function goRegister(event) {
   	 
   	  var frm = document.registerFrm;
   	  frm.method = "POST";
   	  frm.action = "memberEditEnd.go";
   	  frm.submit();
	}// end of function goRegister(event)----------
	
	function goRegister2(event) {
	
		var frm = document.registerFrm;
		frm.method = "POST";
		frm.action = "memberout.go";
		frm.submit();
	}
</script>


<section class="site-hero inner-page overlay" style="background-image: url(<%=ctxPath%>/resources/images/hero_4.jpg)" data-stellar-background-ratio="0.5">
      <div class="container">
        <div class="row site-hero-inner justify-content-center align-items-center">
          <div class="col-md-10 text-center" data-aos="fade">
            <h1 class="heading mb-3">내 정보수정</h1>
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
					<div class="col-md-10 ml-auto contact-info">
						<p class="loginborder">
							<span class="text-black">내 정보수정</span>
						</p>
					</div>
				</div>
			</div>
			<div class="col-md-7">
				<form name="registerFrm" class="bg-white p-md-5 p-4 mb-5 border">
				 <div class="row"> 
						<div class="col-md-12 form-group">
							<div class="row">
								<div class="col-md-12 form-group"> 
                  <label class="text-black font-weight-bold" for="MEMBERID">회원아이디</label><span class="star">*</span>
                  <input type="text" name="memberId" id="MEMBERID" class="form-control "readonly="readonly" value="${vo.memberId}" >
                  <!-- 아이디중복체크 -->
			   <div class="col-md-12 form-group">
				  <a class="styleFont" style="cursor: pointer;" id="idcheck">아이디중복체크</a>
				  <span class="error">아이디는 필수입력 사항입니다.</span> 
				  		</div>
				  	</div>
				  </div>
				</div>
             </div> 
               <div class="row">
                <div class="col-md-12 form-group">
                  <label class="text-black font-weight-bold" for="PWD" >암호변경</label><span class="star">*</span>
                  <input type="password" name="pwd" id="PWD" class="form-control ">
                  <span id="error_passwd">암호는 영문자,숫자,특수기호가 혼합된 8~15 글자로만 입력가능합니다.</span>
                </div>
              </div> 
              <div class="row">
                <div class="col-md-12 form-group">
                  <label class="text-black font-weight-bold" for="PWDcheck" >암호변경확인</label><span class="star">*</span>
                  <input type="password" name="PWDcheck" id="PWDcheck" class="form-control" >
                  <span class="error">암호가 일치하지 않습니다.</span>
                </div>
              </div>
              <div class="row">
                <div class="col-md-12 form-group">
                  <label class="text-black font-weight-bold" for="NICKNAME" >닉네임</label><span class="star">*</span>
                  <input type="text" name="nickName" id="NICKNAME"  class="form-control" value="${vo.nickName}" required>
                   <!-- 닉네임중복체크 -->
			    <div class="col-md-12 form-group">
				  <a class="styleFont" style="cursor: pointer;" id="nicknamecheck">닉네임중복체크</a>
				  <span class="error">닉네임은 필수입력 사항입니다.</span>
                </div>
              </div>
             </div>
              <div class="row">
                <div class="col-md-12 form-group">
                  <label class="text-black font-weight-bold" for="EMAIL" >Email</label><span class="star">*</span>
                  <input type="email" name="email" id="EMAIL" class="form-control " value="${vo.email}" required >
                   <!-- 이메일중복체크 -->
			    <div class="col-md-12 form-group">
				  <a class="styleFont" style="cursor: pointer;" id="emailcheck">이메일중복체크</a>
				  <span class="error">이메일은 필수입력 사항입니다.</span>
                </div>
              </div>
             </div>
               <div class="row">
                <div class="col-md-12 form-group">
                  <label class="text-black font-weight-bold" >성별</label><span class="star">*</span>
                  <c:if test="${vo.gender == 1 }"> 
		                 <input type="radio" id="male" name="gender" value="1" checked disabled="disabled" /><label  style="margin-left: 2%;" >남자</label>
				   	  <input type="radio" id="female" name="gender" value="2" style="margin-left: 10%;" disabled="disabled"/><label  style="margin-left: 2%;" >여자</label>
				   	  <span class="error">성별을 입력하세요</span>
                  </c:if>
                  <c:if test="${vo.gender == 2 }">			           
                  <input type="radio" id="male" name="gender" value="1" disabled="disabled"/><label  style="margin-left: 2%;" >남자</label>
			   	  <input type="radio" id="female" name="gender" value="2" style="margin-left: 10%;" checked disabled="disabled" /><label  style="margin-left: 2%;" >여자</label>
			   	  <span class="error">성별을 입력하세요</span>
				</c:if>
             </div>
              </div>
              <div class="row">
                <div class="col-md-12 form-group">
                  <label class="text-black font-weight-bold">전화번호</label><span class="star">*</span>
                  <select name="hp1" id="hp1" style="width: 75px; padding: 8px;">
					<option value="010" selected>010</option>
				</select>&nbsp;-&nbsp;
			    <input type="text" name="hp2" id="hp2" size="6" maxlength="4" value="${vo.tel2}" required>&nbsp;-&nbsp;
			    <input type="text" name="hp3" id="hp3" size="6" maxlength="4" value="${vo.tel3}" required>&nbsp;&nbsp;
			    <span class="error error_hp">휴대폰 형식이 아닙니다.</span>
                </div>
              </div>                                               
              
              <div class="row">
                <div class="col-md-12 form-group taC" >
                  <input type="button" id="btnRegister" value="수정완료" class="btn btn-primary text-white py-3 mx-1 font-weight-bold" onClick="goRegister(event);">
                  <input type="button" id="btnRegister" value="탈퇴하기" class="btn btn-primary text-white py-3 mx-1 font-weight-bold" onClick="goRegister2(event);">
                </div>
              </div>
            </form>
          </div>                  
        </div>
      </div>
    </section>  
   