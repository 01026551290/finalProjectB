<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<%
	String ctxPath = request.getContextPath(); 
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중복 ID 검사하기</title>

<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/css/style.css" />
<script type="text/javascript" src="<%= ctxPath%>/js/jquery-3.3.1.min.js"></script>

<script type="text/javascript">
	
	$(document).ready(function(){
		$("#error").hide();
	});
	
	
	function goCheck() {
		var userid = $("#userid").val().trim();
		
		if(userid == "") {
			$("#error").show();
			$("#userid").val("");
			$("#userid").focus();
			
			return;
		}
		else {
			$("#error").hide();
			
			var frm = document.frmIdcheck;
			frm.method = "POST";
			frm.action = "idDuplicateCheck.go";
			frm.submit();
		}
		
	}
	
	
	function setUserID(userid) {
		
	
	    $(opener.document).find("#userid").val(userid);
	    $(opener.document).find("#pwd").focus();
		
		self.close();
		
		
	}
	
</script>

</head>
<body>
<span style="font-size: 10pt; font-weight: bold;" >${method}</span>   	
	<c:if test="${method =='GET'}">
	<form name="frmIdcheck">
		<table style="width: 95%; height: 100px;">
			<tr>
				<td style="text-align: center;">
					아이디를 입력하세요<br style="line-height: 200%;"/>					
					<input type="text" name="userid" id="userid" size="20" maxlength="20" class="box" /><br style="line-height: 300%;"/>
					<span id="error" style="color: red; font-size: 12pt; font-weight: bold;">아이디를 입력하세요!</span><br/> 
					<button type="button" class="box" onclick="goCheck();" >확인</button>     
				</td>
			</tr>
		</table>
	</form>
	</c:if>	
	<c:if test="${method =='POST'}">		
		<c:if test="${isUseUserid ==true}">

			<div align="center">
			    <br style="line-height: 400%"/>
				ID로[<span style="color: red; font-weight: bold;">${userid}</span>] 사용가능합니다.
				<br/><br/><br/>
				<button type="button" class="box" onclick="setUserID('${userid}')">닫기</button>
			</div>
			</c:if>		
		<c:if test="${isUseUserid ==false}">
			<div align="center">
			  [<span style="color: red; font-weight: bold;">${userid}</span>] 는 이미 사용중입니다.
			  <br/><br/>
			  <form name="frmIdcheck">
				<table style="width: 95%; height: 100px;">
					<tr>
						<td style="text-align: center;">
						          아이디를 입력하세요  <br style="line-height: 200%;"/>							    					     
							<input type="text" name="userid" id="userid" size="20" maxlength="20" class="box" /><br style="line-height: 300%;"/>  
							<span id="error" style="color: red; font-size: 12pt; font-weight: bold;">아이디를 입력하세요!</span><br/> 
							<button type="button" class="box" onclick="goCheck();" >확인</button>     
						</td>
					</tr>
				</table>
			</form>
		</div>
	</c:if>			
</c:if>	
</body>
</html>