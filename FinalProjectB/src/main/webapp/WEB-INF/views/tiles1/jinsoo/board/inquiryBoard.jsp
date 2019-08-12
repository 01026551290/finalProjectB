<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String ctxPath = request.getContextPath(); %>
   
<style type="text/css">
	table, th, td, input, textarea {border: solid gray 1px;}
	
	#table {border-collapse: collapse;
	 		width: 1000px;
	 		}
	#table th, #table td{padding: 5px;}
	#table th{width: 120px; background-color: #DDDDDD;}
	#table td{width: 860px;}
	.long {width: 470px;}
	.short {width: 120px;} 		

</style>
<script type="text/javascript" src="<%= ctxPath%>/resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">
	$(document).ready(function(){
		
		
		
		<%-- ====== 스마트 에디터 구현 시작 =========== --%>
		
		
		 //전역변수
	    var obj = [];
	    
	    //스마트에디터 프레임생성
	    nhn.husky.EZCreator.createInIFrame({
	        oAppRef: obj,
	        elPlaceHolder: "content",
	        sSkinURI: "<%= request.getContextPath() %>/resources/smarteditor/SmartEditor2Skin.html",
	        htParams : {
	            // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
	            bUseToolbar : true,            
	            // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
	            bUseVerticalResizer : true,    
	            // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
	            bUseModeChanger : true,
	        }
	    });
	    
	    
	    <%-- ====== 스마트 에디터 구현 끝 =========== --%>
	  
		// 쓰기 버튼
		$("#btnWriter").click(function(){
			
			<%-- ====== 스마트 에디터 구현 시작 =========== --%>
			//id가 content인 textarea에 에디터에서 대입
			obj.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
			
			<%-- ====== 스마트 에디터 구현 끝 =========== --%>
			
			// 글제목 유효성 검사
			var subjectval = $("#subject").val().trim();
			
			if(subjectval == ""){
				alert("글제목을 입력하세요");
				return;
			}
			
			<%-- ====== 스마트 에디터 구현 시작 =========== --%>			
			//스마트에디터 사용시 무의미하게 생기는 p태그 제거
	           var contentval = $("#content").val();
		        
		        // === 확인용 ===
		        // alert(contentval); // content에 내용을 아무것도 입력치 않고 쓰기할 경우 알아보는것.
		        // "<p>&nbsp;</p>" 이라고 나온다.
		        
		        // 스마트에디터 사용시 무의미하게 생기는 p태그 제거하기전에 먼저 유효성 검사를 하도록 한다.
		        // 글내용 유효성 검사 
		        if(contentval == "" || contentval == "<p>&nbsp;</p>") {
		        	alert("글내용을 입력하세요!!");
		        	return;
		        }
		        
		        // 스마트에디터 사용시 무의미하게 생기는 p태그 제거하기
		        contentval = $("#content").val().replace(/<p><br><\/p>/gi, "<br>"); //<p><br></p> -> <br>로 변환
		    /*    
		              대상문자열.replace(/찾을 문자열/gi, "변경할 문자열");
		        ==> 여기서 꼭 알아야 될 점은 나누기(/)표시안에 넣는 찾을 문자열의 따옴표는 없어야 한다는 점입니다. 
		                     그리고 뒤의 gi는 다음을 의미합니다.

		        	g : 전체 모든 문자열을 변경 global
		        	i : 영문 대소문자를 무시, 모두 일치하는 패턴 검색 ignore
		        
		        
		    */    
		        contentval = contentval.replace(/<\/p><p>/gi, "<br>"); //</p><p> -> <br>로 변환  
		        contentval = contentval.replace(/(<\/p><br>|<p><br>)/gi, "<br><br>"); //</p><br>, <p><br> -> <br><br>로 변환
		        contentval = contentval.replace(/(<p>|<\/p>)/gi, ""); //<p> 또는 </p> 모두 제거시
		    
		        $("#content").val(contentval);
		     // alert(contentval);
			
			
			<%-- ====== 스마트 에디터 구현 끝 =========== --%>
			
			// 글내용 유효성 검사
			var contentval = $("#content").val().trim();
			
			if(contentval == ""){
				alert("글내용을 입력하세요");
				return;
			}
			// 글 암호 유효성 검사
			
			var pwval = $("#pw").val().trim();
			
			if(pwval == ""){
				alert("글암호를 입력하세요");
				return;
			}
			
			
			var frm = document.addFrm;
			frm.method = "POST";	// 파일을 첨부할 경우이라면 반드시 POST 방식이여만 한다. GET 이라면 파일첨부가 안되어진다.
			frm.action = "<%= ctxPath%>/admin_inquiryBoardEnd.go";
			frm.submit();
		});
		
	});
</script>
<div style="padding-left: 10%; margin-bottom: -2%; border: solid 1px red;">
	<h1>글쓰기</h1>

	<%-- <form name="addFrm">  첨부파일이 없는 경우 --%>
	<%-- #131 파일첨부하기 enctype="multipart/form=data" 를 해주어야만 파일 첨부가 되어진다.  --%>
	
	<form name="addFrm" enctype="multipart/form-data">
		<table id="table">
			<tr>
				<th>성명</th>
				<td>					
						<input type="hidden" id="fk_member" name="fk_member" value="${loginuser.memberId}"  readonly />
						<input type="text" id="name" name="name" value="${loginuser.name}" class="short" readonly />									
				</td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" name="subject" id="subject" class="long"  /></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea name="content" id="content" rows="10" cols="100" style="width: 95%; height: 412px;"></textarea></td>
			</tr>
			<tr>
				<th>글암호</th>
				<td><input type="password" name="pw" id="pw" class="short"  /></td>
			</tr>
			<tr>
				<th>파일첨부</th>
				<td><input type="file" name="attach" id="attach" class="short"  /></td>
			</tr>
		</table>		
		
		<div style="margin: 20px;">
			<button type="button" id="btnWriter">쓰기</button>
			<button type="button" onclick="javascript:history.back();">취소</button>
		</div>
	</form>
    	
</div>
    