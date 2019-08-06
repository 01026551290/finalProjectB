<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String ctxPath =  request.getContextPath();	%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="<%= ctxPath%>/resources/js/jquery-3.3.1.min.js"></script>
<title>관리자 로그인</title>
<script type="text/javascript">
    
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
	frm.action = "<%= ctxPath%>/jinsoo/adminLoginEnd.go";
	frm.submit();
	
}

</script>
</head>
<body>

	<form name="adminFrm">
		사번 : <input type="text" id="seq" name="seq" />
		비밀번호 : <input type="password" id="pwd" name="pwd" />
		
		<button type="button" onclick="adminlogin();">로그인</button>
	</form>

</body>
</html>