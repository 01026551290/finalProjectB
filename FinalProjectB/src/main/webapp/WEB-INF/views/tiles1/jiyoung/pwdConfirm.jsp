<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
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
		
		$("#btnUpdate").click(function(){
			
			var pwd = $("#pwd").val();
			var pwd2 = $("#pwd2").val();
			
			var regexp_passwd = new RegExp(/^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9]).*$/g); 
			/* 암호는 숫자,영문자,특수문자가 포함된 형태의 8~15글자 이하만 허락해주는 정규표현식 객체 생성 */
			
			var bool = regexp_passwd.test(pwd);
			/* 암호 정규표현식 검사를 하는 것 
			      정규표현식에 만족하면 리턴값은 true,
			      정규표현식에 틀리면 리턴값은 false */
			      
			if(!bool) {
				alert("암호는 8글자 이상 15글자 이하에 영문자, 숫자, 특수기호가 혼합되어야 합니다."); 
				$("#pwd").val("");
				$("#pwd2").val("");
				return;
			}   
			else if(pwd != pwd2) {
				alert("암호가 일치하지 않습니다.");
				$("#pwd").val("");
				$("#pwd2").val("");
				return;
			}
			else {
				var frm = document.pwdConfirmFrm;
				frm.method = "POST";
				frm.action = "<%= ctxPath%>/PwdConfirmEnd.go";
				frm.submit();
			}
		});
				
	});
	
</script>


<form name="pwdConfirmFrm">
	<div class="row">
		<div class="col-md-12 form-group">
			<label class="text-black font-weight-bold" for="pwd">새암호</label>
			<input type="password" name="pwd" id="pwd" class="form-control" placeholder="PASSWORD" required />
		</div>
	</div>
	<div class="row">
		<div class="col-md-12 form-group">
			<label class="text-black font-weight-bold" for="pwd2">새암호확인</label>
			<input type="password" name="pwd2" id="pwd2" class="form-control" placeholder="PASSWORD" required />
		</div>
	</div>

	<input type="hidden" name="userid" id="userid" value="${userid}" />

	<c:if test="${method.equals('POST') && n==1}">
		<div id="div_confirmResult" class="tac">
			<label class="text-black font-weight-bold">ID</label> : <span style="color: #ffaa34; font-size: 16pt; font-weight: bold;">${userid}님의 암호가 변경되었습니다.</span> 
		</div>
	</c:if>
	
	<div class="col-md-12 form-group taC mgt10">
		<input type="button" value="암호변경하기" id="btnUpdate" class="btn btnModal text-white py-3 mx-2 font-weight-bold">
	</div>

</form>

