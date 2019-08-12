<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String ctxPath = request.getContextPath(); %>    
<script type="text/javascript">
	    
	if(${n == 1}){
		alert("글쓰기에 성공했습니다.");
		location.href="/admin_buisnessBoardList.go";
	}
	else{
		alert("글쓰기에 실패했습니다.");
		location.href="<%= ctxPath%>/index.go";
	}
	

</script>
    