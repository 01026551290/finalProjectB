<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String ctxPath = request.getContextPath();
%>    
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="<%= ctxPath %>/resources/css/style.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script type="text/javascript">
	
	$(document).ready(function(){
	    
		var method = "${method}";
	
		// 처음 이 모달이 떴을 때
	    if(method == "GET") {
			$("#div_findResult").hide();
	    }
	 	// 아이디&이메일 DB랑 일치한 후에, 인증번호 인증하라고 띄우는 부분
	    else if(method == "POST") {
			$("#btnFind").hide();
	    	$("#userid").val("${userid}");
	    	$("#email").val("${email}");
	    	$("#div_findResult").show();
	    }

	    
	    // 아이디 & 이메일 보내기 -> 이후 인증코드 보내기도 수행함.
		$("#btnFind").click(function(){
			var frm = document.pwdFindFrm;
			frm.action = "<%= ctxPath%>/pwdFindEnd.go";
			frm.method = "POST";
			frm.submit();
		});
	    
	    
	    
		// 인증하기
		$("#btnConfirmCode").click(function(){
			var frm = document.verifyCertificationFrm;
			frm.userid.value = $("#userid").val();
			frm.userCertificationCode.value = $("#input_confirmCode").val();
			
			frm.method = "POST";
			frm.action = "<%= ctxPath%>/verifyCertificationFrm.go";
			frm.submit();
		});
	    
	});
	
</script>

<form name="pwdFindFrm">
	<div class="row">
		<div class="col-md-12 form-group">
			<label class="text-black font-weight-bold" for="userid">아이디</label>
			<input type="text" name="userid" id="userid" class="form-control" placeholder="ID" required />
		</div>
	</div>
	<div class="row">
		<div class="col-md-12 form-group">
			<label class="text-black font-weight-bold" for="email">이메일</label>
			<input type="text" name="email" id="email" class="form-control" placeholder="abc@def.com" required />
		</div>
	</div>

	<div id="div_findResult" align="center">
		<c:if test="${n==1}">
			<div id="pwdConfirmCodeDiv">
				<span style="font-size: 10pt;">인증코드가 ${email}로 발송되었습니다.</span><br />
				<span style="font-size: 10pt;">인증코드를 입력해주세요</span><br /> <input
					type="text" name="input_confirmCode" id="input_confirmCode"
					required /> <br />
				<br />
				<input type="button" value="인증하기" id="btnConfirmCode" class="btn btnModal text-white py-3 mx-2 font-weight-bold">
			</div>
		</c:if>

		<c:if test="${n==0}">
			<span style="color: red;">사용자 정보가 없습니다.</span>
			<div class="col-md-12 form-group taC mgt10">
				<input type="button" value="찾기" id="btnFind" class="btn btnModal text-white py-3 mx-2 font-weight-bold">
			</div>
		</c:if>

		<c:if test="${n==-1}">
			<span style="color: red;">${sendMailFailMsg}</span>
		</c:if>

	</div>


	<div class="col-md-12 form-group taC mgt10">
		<input type="button" value="찾기" id="btnFind" class="btn btnModal text-white py-3 mx-2 font-weight-bold">
	</div>
	
	
</form>

<form name="verifyCertificationFrm">
	<input type="hidden" name="userid">
	<input type="hidden" name="userCertificationCode" >
</form>



