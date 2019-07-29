<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<%
	String ctxPath = request.getContextPath(); //  /MyMVC
%>    
    
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="<%= request.getContextPath()%>/resources/js/jquery-3.3.1.min.js"></script>
<meta charset="UTF-8">
<title>중복 EMAIL 검사하기</title>
<script type="text/javascript">
	
	$(document).ready(function(){
		$("#error").hide();
		$("#error2").hide();
	});// end of $(document).ready(function(){ })-----------------
	
	
	function goCheck() {
		var EMAIL = $("#EMAIL").val().trim();
		
		if(EMAIL == "") {
			$("#error").show();
			$("#EMAIL").val("");
			$("#EMAIL").focus();
			
			return;
		}
		else {
			var regExp_EMAIL = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;  
			var bool = regExp_EMAIL.test(EMAIL);
			
			if(!bool) {
				$("#error2").show();
				$("#EMAIL").val("");
				$("#EMAIL").focus();
				
				return; 
			}
			$("#error").hide();
			
			var frm = document.frmIdcheck;
			frm.method = "POST";
			frm.action = "emailDuplicateCheck.go";
			frm.submit();
		}
		
	}// end of function goCheck()------------------
	
	
	function setUserID(userid) {
		
	/*	
	// === 1. 팝업창에서 부모창으로 값 넘기는 방법 (javascript) === //
		var openerfrm = opener.document.registerFrm;
		//    opener 는 팝업창을 열게한 부모창을 말한다.
		// opener.document 은 부모창의 소스파일을 말한다. 즉, memberform.jsp 이다.
		
		openerfrm.userid.value = userid;
		openerfrm.pwd.focus();
		
		self.close();
		// 여기서 self는 팝업창 자기자신을 뜻한다.
		// 지금의 self는 idcheck.jsp 페이지이다.
	*/	
		
		// === 2. 팝업창에서 부모창으로 값 넘기는 방법 (jQuery) === //
		
	//	$("#userid", opener.document).val(userid);
	//	$("#pwd", opener.document).focus();
	
	//  또는
	    $(opener.document).find("#EMAIL").val(userid);
	    $(opener.document).find("#GENDER").focus();
		
		self.close();
		// 여기서 self는 팝업창 자기자신을 뜻한다.
		// 지금의 self는 idcheck.jsp 페이지이다.
		
	}// end of function setUserID(userid)----------------
	
</script>

</head>
<body>

<span style="font-size: 10pt; font-weight: bold;" >${method}</span>
    
	 <!--  전송방식이 GET 이라면 ID중복검사를 하기위한 form 을 띄워주어야 한다. -->
	<c:if test="${method =='GET'}">
	<form name="frmIdcheck"> <!-- 회원가입, 로그인, 글 작성하거나 파일 전송할때 사용한다. 사용자의 데이터를 전송하는 것이다. -->
		<table style="width: 95%; height: 100px;">
			<tr>
				<td style="text-align: center;">
					이메일을 입력하세요<br style="line-height: 200%;"/>					
					<input type="text" name="email" id="EMAIL" size="20" maxlength="20" class="box" /><br style="line-height: 300%;"/> <!-- id는 css에서 쓰고, name은 데이터베이스에서 쓴다. -->
					<span id="error" style="color: red; font-size: 12pt; font-weight: bold;">이메일을 입력하세요!</span><br/> 
					<span id="error2" style="color: red; font-size: 12pt; font-weight: bold;">XXXXX형식XXXXX</span><br/> 
					<button type="button" class="box" onclick="goCheck();" >확인</button>     
				</td>
			</tr>
		</table>
	</form>
	</c:if>
 <!--   전송방식이 POST 이라면 DB에 들어가서 입력한 ID가 사용가능한 ID인지 
		이미 사용중인 ID인지 ID중복검사를 해와야 한다. 
		form에서 input 태그의 name의 값이 "userid" 에 입력된 값을 받아와서 
		그 userid 값이 데이터베이스의 jsp_member 테이블에 존재하는지 존재하지 않는지 검사해야 한다.-->
	
	<c:if test="${method =='POST'}">
		<!-- userid 가 중복되어 사용중인 아이디이라면 isUseUserid 값은 false 를 갖고,
			 userid 가 사용가능한 아이디이라면 isUseUserid 값은 true 를 갖는다. -->
		<c:if test="${isUseemail ==true}">

			<div align="center">
			    <br style="line-height: 400%"/>
				EMAIL로[<span style="color: red; font-weight: bold;">${email}</span>] 사용가능합니다.
				<br/><br/><br/>
				<button type="button" class="box" onclick="setUserID('${email}')">닫기</button>
			</div>
			</c:if>
		
		<%-- ID가 중복되어 사용불가능한 경우  --%>
		<c:if test="${isUseemail ==false}">
			<div align="center">
			  EMAIL[<span style="color: red; font-weight: bold;">${email}</span>] 는 이미 사용중입니다.
			  <br/><br/>
			  <form name="frmIdcheck">
				<table style="width: 95%; height: 100px;">
					<tr>
						<td style="text-align: center;">
						          이메일을 입력하세요  <br style="line-height: 200%;"/>							    					     
							<input type="text" name="EMAIL" id="EMAIL" size="20" maxlength="20" class="box" /><br style="line-height: 300%;"/>  
							<span id="error" style="color: red; font-size: 12pt; font-weight: bold;">이메일을 입력하세요!</span><br/> 
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