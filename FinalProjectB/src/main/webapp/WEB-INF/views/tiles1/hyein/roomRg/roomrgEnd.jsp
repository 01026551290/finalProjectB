<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% String ctxPath = request.getContextPath(); %>

<script type="text/javascript">
	if(${n==1}) { 
		alert("숙소가 등록되었습니다! 이제 객실을 등록해주세요!");
		location.href="<%= ctxPath%>/roomrg2.go";
	}
	else { 
		alert("숙소 등록이 실패되었습니다!");
		location.href="<%= ctxPath%>/roomrg.go";
	}	
	
</script>  