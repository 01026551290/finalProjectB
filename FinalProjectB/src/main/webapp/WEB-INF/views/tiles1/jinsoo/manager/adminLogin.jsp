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


	<div class="container custom-border" style="border: 0px red soild; width: 500px; height: 500px;  position: absolute; left: 750px; top: 200px; ">

	<div class="row col-md-8 col-md-offset-2 col-sm-10 custom-border">
		<h2 class="text-primary">로그인</h2>
		<p class="bg-primary">&nbsp;</p>
		
		<form name="adminFrm">
		<div class="row custom-loginFrm custom-border">    
		    <div class="col-sm-8 col-lg-8 custom-border">
				<div class="form-group custom-input">  <%-- 폼에서는 class form-group 을 사용해야 하며, 그 뜻은 폼에서 사용되어지는 1개 행 즉, 클래스 row 와 같은 용도로 사용되어지는 것이다. --%>
					<div class="col-sm-3 col-lg-3">
						<label for="userid">사번</label>
					</div>
					<div class="col-sm-9 col-lg-9">
						<input type="text" class="form-control" name="seq" id="seq" value=""/> <%-- 부트스트랩에서 input 태그에는 항상 class form-control 이 사용되어져야 한다. --%>
					</div>
				</div>	
					
				<div class="form-group custom-input">
					<div class="col-sm-3 col-lg-3">
						<label for="pwd">비밀번호</label>
					</div>
					<div class="col-sm-9 col-lg-9">
						<input type="password" class="form-control" name="pwd" id="pwd" value="" /> 
					</div>
				</div>
			</div>
			
			<div class="col-sm-4 col-lg-4 custom-login-submit custom-border">
				<button class="btn btn-success" type="button" id="btnLOGIN" >확인</button> 
			</div>	 
		</div>
		</form>
	</div>
	
</div>


</body>
</html>