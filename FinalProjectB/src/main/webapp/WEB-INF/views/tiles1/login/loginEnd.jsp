<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String ctxPath =  request.getContextPath(); %>    
<script type="text/javascript">
	var loginuser = "${loginuser}"
	
	if(loginuser != null){
		alert("로그인 성공");
		location.href="<%= ctxPath%>/index.action";
	}
</script>
