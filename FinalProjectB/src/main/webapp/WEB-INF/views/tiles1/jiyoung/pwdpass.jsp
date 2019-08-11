 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String ctxPath = request.getContextPath(); %>       
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
    
<script type="text/javascript">
	
	$(document).ready(function(){
		 	$("#PWD").keydown(function(event){
	  			
	  			if(event.keyCode == 13) { // 엔터를 했을 경우
	  				goRegister();
	  			}
	    	 });
		
			$(".error").hide();
			$("#error_passwd").hide();
			
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
			});
			
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
				
	function goRegister(){

				
	  	$("#PWD").click(function(){ 
	  		var pwdval = $("#PWD").val().trim();
	  		if(pwdval == ""){
			  alert("암호를 입력하셔야 합니다.");
			  return;
	  		}
	   	  var frm = document.registerFrm;
	   	  frm.method = "POST";
	   	  frm.action = "memberedit.go";
	   	  frm.submit();
		// end of function goRegister(event)----------
	
	  	});
	}
	</script>
<section class="site-hero inner-page overlay" style="background-image: url(<%=ctxPath%>/resources/images/hero_4.jpg)"	data-stellar-background-ratio="0.5">
	<div class="container">
		<div class="row site-hero-inner justify-content-center align-items-center">
			<div class="col-md-10 text-center" data-aos="fade">
				<h1 class="heading mb-3">암호확인</h1>
			</div>
		</div>
	</div>

	<a class="mouse smoothscroll" href="#next">
		<div class="mouse-icon">
			<span class="mouse-wheel"></span>
		</div>
	</a>
</section>
	
<section class="section contact-section" id="next">
	<div class="container">
		<div class="row">
			<div class="col-md-5">
				<div class="row">
					<div class="col-md-10 ml-auto contact-info">
						<p class="loginborder">
							<span class="text-black">암호확인</span>
						</p>
					</div>
				</div>
			</div>
			<div class="col-md-7">
				<form name="registerFrm" class="bg-white p-md-5 p-4 mb-5 border">
					<div class="row">
						<div class="col-md-12 form-group">
							<label class="text-black font-weight-bold" for="PWD" required>암호</label><span class="star">*</span> <input type="password" name="PWD" id="PWD" class="form-control "> 
							<span id="error_passwd">암호는  영문자,숫자,특수기호가 혼합된 8~15 글자로만 입력가능합니다.</span>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12 form-group taC">
							<input type="button" id="btnRegister" value="확인" class="btn btn-primary text-white py-3 px-5 font-weight-bold" onClick="goRegister();">
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</section>

