<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<<<<<<< HEAD
<% String ctxPath =  request.getContextPath(); %>    
<script type="text/javascript">
	var loginuser = "${loginuser}"
	
	if(loginuser != null){
		alert("로그인 성공");
		location.href="<%= ctxPath%>/index.action";
	}
</script>
=======


<script type="text/javascript">
	var loginuser = "${sessionScope.loginuser}";
	
	if(loginuser != null) {
		alert("로그인 성공!!");
		location.href="<%= ctxPath%>/index.action";
	}
</script>
>>>>>>> branch 'master' of https://github.com/01026551290/finalProjectB.git
