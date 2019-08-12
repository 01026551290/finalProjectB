<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<% String ctxPath = request.getContextPath(); %>   
<style type="text/css">
		
	table, th, td, input, textarea {border: solid gray 1px;}
	
	#table, #table2 {border-collapse: collapse;
	 		width: 1000px;
	 		}
	#table th, #table td{padding: 5px;}
	#table th{width: 120px; background-color: #DDDDDD;}
	#table td{width: 860px;}
	.long {width: 470px;}
	.short {width: 120px;} 		
	.move { cursor: pointer; }
	.moveColor { color: #660029; font-weight: bold; }
</style>

<script type="text/javascript">
    
	$(document).ready(function(){
	
		$(".move").hover(function(){
			$(this).addClass("moveColor");	
		}, function(){
			$(this).removeClass("moveColor");
		});
		/* 
		if(${loginuser == null}){
			$(".commnetcontent").attr("disabled",true);
		}
		else{
			$(".commnetcontent").attr("disabled",false);
		} */
		
	});// end of $(document).ready()----------------------
  
	function goAddWrite(){
		var frm = document.addWriteFrm;
		var contentVal = frm.content.value.trim();
		if(contentVal == ""){
			alert("댓글을 입력하세요");
			return;
		}
		
		var form_data = $("form[name=addWriteFrm]").serialize();
		
		$.ajax({
				url: "<%= request.getContextPath()%>/addComment.go",
				data : form_data,
				type: "POST" ,
				dataType: "JSON",
				success : function(json){
					var	html = "";
					$.each(json, function(index, item){
						
						html += "<tr style='text-align=center;'>";
						html += "<td >"+item.name+"</td>";
						html += "<td>"+item.content+"</td>";
						html += "<td>"+item.regDate+"</td>";
						html += "</tr>";
						
						
					});
					$("#commentDisplay").html(html);
					frm.content.value = "";
				},error: function(request, status, error){
					alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
				}
		});
	}
	
	
	
</script>

<div style="padding-left: 10%; border: solid 0px red;">
	<h1>글내용보기</h1>
	
	<table id="table" style="word-wrap: break-word; table-layout: fixed;">
		<tr>
			<th>글번호</th>
			<td>${boardvo.seq}</td>
		</tr>
		<tr>
			<th>성명</th>
			<td>${boardvo.name}</td>
		</tr>
		<tr>
           		<th>제목</th>
           		<td>${boardvo.subject}</td>
        	</tr>
		<tr>
			<th>내용</th>
			<td>${boardvo.content}</td>
		</tr>
		<tr>
			<th>날짜</th>
			<td>${boardvo.regDate}</td>
		</tr>
		
		<tr>
			<th>첨부파일</th>
			
				<c:if test="${loginuser != null}">
					<td><a href="<%= request.getContextPath()%>/download.go?seq=${boardvo.seq}">
						${boardvo.orgFilename}
					</a></td>
				</c:if>
				<c:if test="${loginuser == null}">
					<td>${boardvo.orgFilename}</td>	
				</c:if>
			
		</tr>
		<tr>
			<th>파일크기</th>
			<td>${boardvo.fileSize}</td>
		</tr>
	</table>
	
	<br/>

	<br/>
	

	<button type="button" onClick="javascript:location.href='<%= request.getContextPath() %>/${gobackURL}'">목록보기</button> 
	<button type="button" onClick="javascript:location.href='<%= request.getContextPath() %>/jinsoo/buisnessBoardedit.go?seq=${boardvo.seq}'">수정</button>
	<button type="button" onClick="javascript:location.href='<%= request.getContextPath() %>/admin_inquiryBoarddel.go?seq=${boardvo.seq}'">삭제</button>
	
	
	<h3 style="margin-top: 50px;">답변</h3>
	
		
		<form name="addWriteFrm" style="margin-top: 20px;">
		
		<c:if test="${adminvo != null }">		
				 <input type="hidden" name="fk_memberid" value="${adminvo.name}" class="short" readonly />
			성명 : <input type="text" name="name" value="${adminvo.name}" class="short" readonly />
			댓글내용 : <input type="text" name="content" class="long"  />
			
			<!-- 댓글에 달리는 원게시물 글번호(즉,댓글의 부모글 글번호) -->
			<input type="hidden" name="parentSeq" value="${boardvo.seq}" />
			<button type="button" onclick="goAddWrite();">댓글쓰기 완료</button>
		</c:if>
		</form>
				
		
	
	
	
	<!-- ===== #91. 댓글 내용 보여주기 ===== -->

	<table id="table2" style="margin-top: 2%; margin-bottom: 3%;">
			<thead>
			<tr>
				<th style="width: 15%; text-align: center;">작성자</th>
				<th style="width: 67%; text-align: center;">내용</th>
				<th style="text-align: center;">작성일자</th>
			</tr>
			</thead>
			<tbody id="commentDisplay">
				<c:if test="${!empty commentlist}">
					<c:forEach var="commentvo" items="${commentlist}">
						<tr>
							<td>${commentvo.name }</td>
							<td>${commentvo.content }</td>
							<td>${commentvo.regDate }</td>
						</tr>
					</c:forEach>
				</c:if>
			</tbody>
		</table>
	
	
	
</div>











