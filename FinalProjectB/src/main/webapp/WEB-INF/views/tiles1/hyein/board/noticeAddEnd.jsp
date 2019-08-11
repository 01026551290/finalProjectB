<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% String ctxPath = request.getContextPath(); %>

<script type="text/javascript">
	if(${n==1}) { 
		alert("글이 등록되었습니다!");
		location.href="<%= ctxPath%>/noticeList.go";
	}
</script>  