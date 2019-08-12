<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
	    
		var method = "${method}";
		
	
	    if(method == "GET") {
			$("#div_findResult").hide();
			$("#btnFind").show();
					
	    }
	    else if(method == "POST") {
	    	$("#name").val("${name}").attr("disabled",true);
	    	$("#email").val("${email}").attr("disabled",true);
	    	$("#div_findResult").show();
	    	$("#btnFind").hide();
	    			
	    }
	    
		$("#btnFind").click(function(){
			
			var nameVal = $("#name").val().trim();
			var emailVal = $("#email").val().trim();
			
			if(nameVal != "" && emailVal != "") {
				var frm = document.idFindFrm;
				frm.action = "<%= ctxPath%>/idFindEnd.go";
				frm.method = "POST";
				frm.submit();
			}
			else {
				alert("이름과 이메일을 입력하세요!!!");
			}	
		});
		
		
	});
	
</script>
	<form name="idFindFrm">
		<div class="row">
			<div class="col-md-12 form-group">
				<label class="text-black font-weight-bold" for="name">성명</label>
				<input type="text" name="name" id="name" class="form-control" placeholder="홍길동" required />
			</div>
		</div>
		<div class="row">
			<div class="col-md-12 form-group">
				<label class="text-black font-weight-bold" for="email">이메일</label>
				<input type="text" name="email" id="email" class="form-control" placeholder="abc@def.com" required />
			</div>
		</div>
		<c:if test="${n==0}">
		<span style="color: red;">사용자 정보가 없습니다.</span>
	   </c:if>
		<div class="col-md-12 form-group taC mgt10">
			<input type="button" value="찾기" id="btnFind" class="btn btnModal text-white py-3 mx-2 font-weight-bold">
			<span id="div_findResult">
				<label class="text-black font-weight-bold">ID</label> : <span style="color: #ffaa34; font-size: 16pt; font-weight: bold;">${idFind}</span> 
			</span>
		</div>
	</form>


