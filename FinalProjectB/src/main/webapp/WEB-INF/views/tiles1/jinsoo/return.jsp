<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script type="text/javascript" src="<%= request.getContextPath()%>/resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">

$(document).ready(function(){

		
	
	 var idx = sessionStorage.getItem("idx");
	 
	
	 
 	$("#idx").val(idx);
 	
 	goreturn();
 
 });
 
 	function goreturn(){
	var frm = document.modalfrm;
	frm.action = "<%= request.getContextPath()%>/admin_memberOneShow.go";
	frm.submit();
 	}
 	
</script>

<form name="modalfrm">
	<input type="hidden" id="idx" name="idx" />
</form>