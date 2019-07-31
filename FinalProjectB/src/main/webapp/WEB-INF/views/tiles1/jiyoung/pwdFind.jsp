<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String ctxPath = request.getContextPath();
    //    /MyMVC
%>    
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="<%= ctxPath %>/css/style.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style>
	#div_name {
		width: 70%;
		height: 15%;
		margin-bottom: 5%;
		margin-left: 10%;
		position: relative;
	}
	
	#div_mobile {
		width: 70%;
		height: 15%;
		margin-bottom: 5%;
		margin-left: 10%;
		position: relative;
	}
	
	#div_findResult {
		width: 70%;
		height: 15%;
		margin-bottom: 5%;
		margin-left: 10%;		
		position: relative;
	}
	
	#div_btnFind {
		width: 70%;
		height: 15%;
		margin-bottom: 5%;
		margin-left: 10%;
		position: relative;
	}
	
</style>

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
	    

		
		/* $(opener.document).find("#pwd").val(pwd); */
	    
		
		self.close();
		
	});
	
</script>

<form name="pwdFindFrm">

	<div id="div_userid" align="center">
      <span style="color: blue; font-size: 12pt;">아이디</span><br/> 
      <input type="text" name="userid" id="userid" size="15" placeholder="ID" required />
   </div>
   
   <div id="div_email" align="center">
   	  <span style="color: blue; font-size: 12pt;">이메일</span><br/>
      <input type="text" name="email" id="email" size="15" placeholder="abc@def.com" required />
   </div>
  
	<div id="div_findResult" align="center">
   	   <c:if test="${n==1}">
   	      <div id="pwdConfirmCodeDiv">
   	      	  <span style="font-size: 10pt;">인증코드가 ${email}로 발송되었습니다.</span><br/>
   	      	  <span style="font-size: 10pt;">인증코드를 입력해주세요</span><br/>
   	      	 <input type="text" name="input_confirmCode" id="input_confirmCode" required />
   	      	 <br/><br/>
   	      	 <button type="button" class="btn btn-info" id="btnConfirmCode">인증하기</button>    
   	      </div>
   	   </c:if>
   	   
   	   <c:if test="${n==0}">
   	   	  <span style="color: red;">사용자 정보가 없습니다.</span>
   	   </c:if>
   	   
   	   <c:if test="${n==-1}">
   	   	  <span style="color: red;">${sendMailFailMsg}</span>
   	   </c:if>
   	   
   </div>
  
  
   <div id="btnFind" align="center">
   		<button type="button" class="btn btn-success" id="btnFind">찾기</button> <!-- btn-success 부트스트랩에 있는 버튼타입(녹색)이다. -->
   </div> 
</form>
<form name="verifyCertificationFrm">
	<input type="hidden" name="userid">
	<input type="hidden" name="userCertificationCode" >
</form>



