<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<% String ctxPath = request.getContextPath(); %>

<style type="text/css">
	     
	table, th, td { border: solid 1px gray; }

	#table {width: 970px; border-collapse: collapse;}
	#table th, #table td {padding: 5px;}
	#table th { background-color: #DDD; }
	.subjectStyle { font-weight: bold; color: navy; cursor: pointer; }
</style>
<script type="text/javascript" src="<%= ctxPath%>/resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
		
	
	$(".subject").bind("mouseover",function(event){
		var $target = $(event.target);
		$target.addClass("subjectStyle");
	});	
	
	$(".subject").bind("mouseout",function(event){
		var $target = $(event.target);
		$target.removeClass("subjectStyle");
	});	
	

	$("#searchWord").keydown(function(event){
			
			if(event.keyCode == 13) { // 엔터를 했을 경우
				goSearch();
			}
	 }); // end of $("#pwd").keydown();-----------------------
	
	
	if(${paramap != null}){
		$("#searchType").val("${paramap.searchType}");
		$("#searchWord").val("${paramap.searchWord}");
		
	}
	 
	 $("#displayList").hide();
	 
	 $("#searchWord").keyup(function(){
		 
		 var form_data = {searchType:$("#searchType").val() , searchWord:$("#searchWord").val()};
		 
		 $.ajax({
			
			 url:"<%= request.getContextPath()%>/wordSearchSow.action",
			 data:form_data,
			 dataType:"JSON",
			 success: function(json){
				 if(json.length > 0) { // 검색된 데이터가 있는 경우임. 만약에 조회된 데이터가 없을 경우 if(data == null) 이 아니고 if(data.length == 0) 이라고 써야 한다. 
						
						var html = "";
					
						$.each(json, function(entryIndex, item){
							var word = item.word;
							var index = word.toLowerCase().indexOf( $("#searchWord").val().toLowerCase() ); 
							//  alert("index : " + index);
							var len = $("#searchWord").val().length;
							var result = "";
							
							result = "<span class='first' style='color:blue;'>" +word.substr(0, index)+ "</span>" + "<span class='second' style='color:red; font-weight:bold;'>" +word.substr(index, len)+ "</span>" + "<span class='third' style='color:blue;'>" +word.substr(index+len, word.length - (index+len) )+ "</span>";  
							
							html += "<span style='cursor:pointer;'>"+ result +"</span><br/>"; 
						});
						
						$("#displayList").html(html);
						$("#displayList").show();
					}
					else {
						// 검색된 데이터가 존재하지 않을 경우
						$("#displayList").hide();
					} // end of if ~ else ----------------
				 
				 
			 },error: function(request, status, error){
					alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
				}
		 });
	 });
	
	 $("#displayList").click(function(event){
		 var word = "";
		 var $target = $(event.target);
		 if($target.is(".first")) {
				word = $target.text() + $target.next().text() + $target.next().next().text();
			}
			else if($target.is(".second")) {
				word = $target.prev().text() + $target.text() + $target.next().text();
			}
			else if($target.is(".third")) {
				word = $target.prev().prev().text() + $target.prev().text() + $target.text();
			}
			
			$("#searchWord").val(word); // 텍스트박스에 검색된 결과의 문자열을 입력해준다.
			
			$("#displayList").hide();
			goSearch();
	 });
	 
});

function goView(seq){
	
	var frm = document.goViewFrm;
	frm.seq.value = seq
	frm.method = "GET";
	frm.action = "<%= request.getContextPath()%>/jinsoo_inquiryBoardView.go"
	frm.submit();
	
}

	function goSearch(){
		var frm = document.searchFrm;
		frm.method = "GET";
		frm.action = "<%= request.getContextPath()%>/jinsoo/buisnessBoardList.go";
		frm.submit();
	}
	

</script>    


<div align="center" style="">
	<h2 style="margin-bottom: 20px;">글목록</h2>
	
	<table id="table">
		<tr>
			<th style="width: 70px; text-align: center;">글번호</th>
			<th style="width: 360px; text-align: center;">제목</th>
			<th style="width: 70px; text-align: center;">성명</th>
			<th style="width: 180px; text-align: center;">날짜</th>
			
			
			<%-- # 142 파일과 크기를 보여주도록 수정 --%>
			<th style="width: 70px; text-align: center;">파일</th>
			
		</tr>	
			<c:forEach var="boardvo" items="${inquiryBoardList }" varStatus="status">
		<tr>
					<td align="center">${boardvo.seq}</td>											
						
							<c:if test="${boardvo.commentCount == 0}">
							<td align="left"><span class="subject" onclick="goView('${boardvo.seq}')">${boardvo.subject}</span></td>
							</c:if>
							<c:if test="${boardvo.commentCount != 0}">
							<td align="left"><span class="subject" onclick="goView('${boardvo.seq}')">${boardvo.subject}<span style="color: red; font-size: 9pt;">[${boardvo.commentCount}]</span></span></td>
							</c:if>

					<td align="center">${boardvo.name}</td>
					<td align="center">${boardvo.regDate}</td>
					
					
					<td align="center">
						<c:if test="${not empty boardvo.orgFilename }">
							<img  src="<%= ctxPath%>/resources/images/disk.gif">
						</c:if>
					</td>				
		</tr>
			</c:forEach>
	</table>
	
	<form name="goViewFrm">
		<input type="hidden" name="seq" />
	</form>
	
	
	<div align="center" style="width: 70%; border: 0px solid gray;">${pagebar}</div>
	
	
	<form name="searchFrm" style="">
		<select name="searchType" id="searchType">
			<option value="subject">글제목</option>
			<option value="name">글쓴이</option>
		</select>
		<input type="text" name="searchWord" id="searchWord" autocomplete=off  style="width: 300px;"  />
		<button type="button" onclick="goSearch();">검색</button>
	</form>
	<!-- #101 검색어 입력시 자동글 완성하기 1 -->
	<div id="displayList" style=" width: 300px; height: 100px; overflow: auto; margin-left: 20px; border: solid gray 1px; border-top: -1px;">
	
	</div>
	
</div>    