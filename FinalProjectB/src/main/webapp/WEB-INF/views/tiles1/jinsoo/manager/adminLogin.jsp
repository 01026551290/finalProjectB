<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String ctxPath =  request.getContextPath();	%>    
<script type="text/javascript" src="<%= ctxPath%>/resources/js/jquery-3.3.1.min.js"></script>

<style type="text/css">
	
	@media ( min-width : 769px) and ( max-width : 991px) {
		.custom-border {
		 	/* border: solid 1px red; */
		 }
		.custom-loginFrm {
			margin: 40px 0 0 0;
		}
		.custom-input {
			padding: 0 0 30px 0;
		}
		.custom-login-submit {
			padding: 45px 0 0 20px;
		}
	}
	
	@media ( min-width : 992px) {
		.custom-border {
		 	/* border: solid 1px red; */
		 }
		.custom-loginFrm {
			margin: 40px 0 0 0;
		}
		.custom-input {
			padding: 0 0 30px 0;
		}
		.custom-login-submit {
			padding: 45px 0 0 20px;
		}
	}
	
</style>

<script type="text/javascript">
   
$(document).ready(function(){
	
	 
	 $("#btnLOGIN").click(function() {
		 adminlogin();
	 }); // end of $("#btnLOGIN").click();-----------------------
	 
	 $("#pwd").keydown(function(event){
			
			if(event.keyCode == 13) { // 엔터를 했을 경우
				adminlogin();
			}
	 }); // end of $("#pwd").keydown();-----------------------	
	
});

function adminlogin() {
	
	 var seq = $("#seq").val(); 
	 var pwd = $("#pwd").val(); 
	
	 if(seq.trim()=="") {
	 	 alert("아이디를 입력하세요!!");
		 $("#seq").val(""); 
		 $("#seq").focus();
		 return;
	 }
	
	 if(pwd.trim()=="") {
		 alert("비밀번호를 입력하세요!!");
		 $("#pwd").val(""); 
		 $("#pwd").focus();
		 return;
	 }
	
	var frm = document.adminFrm;
	frm.method = "POST";
	frm.action = "<%= ctxPath%>/admin_adminLoginEnd.go";
	frm.submit();
	
}

</script>
<section class="site-hero inner-page overlay" style="background-color: #333;">
	<div class="container">
		<div class="row site-hero-inner justify-content-center align-items-center">
			<div class="col-md-10 text-center" data-aos="fade">
				<h1 class="heading mb-3">관리자로그인</h1>
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
							<span class="text-black">관리자 로그인</span>
						</p>
					</div>
				</div>
			</div>
			<div class="col-md-7">
				<form name="adminFrm" class="bg-white p-md-5 p-4 mb-5 border">
					<div class="row">
						<div class="col-md-12 form-group">
							<label class="text-black font-weight-bold" for="userid">사번</label>
							<input type="text" name="seq" id="seq" value="" class="form-control ">
						</div>
					</div>
					<div class="row">
						<div class="col-md-12 form-group">
							<label class="text-black font-weight-bold" for="pwd">비밀번호</label>
							<input type="password" id="pwd" name="pwd" value="" class="form-control ">
						</div>
					</div>
					<div class="row">
						<div class="col-md-12 form-group taC">
							<input type="button" value="로그인" id="btnLOGIN" class="btn btn-primary text-white py-3 mx-2 font-weight-bold">
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</section>
