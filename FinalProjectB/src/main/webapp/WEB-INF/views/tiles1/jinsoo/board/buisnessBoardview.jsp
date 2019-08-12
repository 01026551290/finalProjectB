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

<section class="site-hero inner-page overlay" style="background-image: url(/god/resources/images/hero_4.jpg)" data-stellar-background-ratio="0.5">
      <div class="container">
        <div class="row site-hero-inner justify-content-center align-items-center">
          <div class="col-md-10 text-center" data-aos="fade">
            <h1 class="heading mb-3">문의 사항</h1>
            <ul class="custom-breadcrumbs mb-4">
            </ul>
          </div>
        </div>
      </div>

      <a class="mouse smoothscroll" href="#next">
        <div class="mouse-icon">
          <span class="mouse-wheel"></span>
        </div>
      </a>
    </section>
    <!-- END section -->

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
			<th>조회수</th>
			<td>${boardvo.readCount}</td>
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
	
	<div style="margin-bottom: 1%;">이전글 : <span class="move" onClick="javascript:location.href='<%= ctxPath%>/admin_buisnessBoardView.go?seq=${boardvo.previousSeq}'">${boardvo.previousSubject}</span></div>
	<div style="margin-bottom: 1%;">다음글 : <span class="move" onClick="javascript:location.href='<%= ctxPath%>/admin_buisnessBoardView.go?seq=${boardvo.nextSeq}'">${boardvo.nextSubject}</span></div>
	
	<br/>
	
<%-- 	<button type="button" onClick="javascript:location.href='<%= request.getContextPath() %>/list.action'">목록보기</button> --%> 
	<button type="button" onClick="javascript:location.href='<%= request.getContextPath() %>/${gobackURL}'">목록보기</button> 
	<button type="button" onClick="javascript:location.href='<%= request.getContextPath() %>/admin_buisnessBoardedit.go?seq=${boardvo.seq}'">수정</button>
	<button type="button" onClick="javascript:location.href='<%= request.getContextPath() %>/admin_buisnessBoarddel.go?seq=${boardvo.seq}'">삭제</button>
	
	
	<!-- #121 답변글 쓰기 버튼 추가 현재보고있는 글을 작성하려는 답변글의 원글이 된다. -->
	
	<button type="button" onclick="javascript:location.href='<%= request.getContextPath() %>/admin_buisnessBoard.go?fk_seq=${boardvo.seq}&groupno=${boardvo.groupNo}&depthno=${boardvo.depthno}'">답변글쓰기</button>
	
	<!-- # 84 댓글쓰기 폼추가 -->
	<h3 style="margin-top: 50px;">댓글</h3>
	
	
	
		<c:if test="${loginuser == null and  adminvo == null }">
			<span style="color: red;">로그인 후 댓글을 쓰실수있습니다.</span>
		</c:if>		
		<form name="addWriteFrm" style="margin-top: 20px;">
		<c:if test="${loginuser != null }">
				 <input type="hidden" name="fk_memberid" value="${loginuser.userid}" class="short" readonly />
			성명 : <input type="text" name="name" value="${loginuser.name}" class="short" readonly />
			댓글내용 : <input type="text" name="content" class="long"  />
			
			<!-- 댓글에 달리는 원게시물 글번호(즉,댓글의 부모글 글번호) -->
			<input type="hidden" name="parentSeq" value="${boardvo.seq}" />
			<button type="button" onclick="goAddWrite();">댓글쓰기 완료</button>
		
		</c:if>
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
				<th style="width: 15%; text-align: center;">댓글작성자</th>
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











