<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@page import="java.net.InetAddress"%>    
<% String ctxPath = request.getContextPath(); 


// === 서버 IP 주소 알아오기 ===
InetAddress inet = InetAddress.getLocalHost();
 String serverIP = inet.getHostAddress();
//	String serverIP = "192.168.50.16";

// === 서버 포트번호 알아오기 ===
int portnumber = request.getServerPort();		

String serverName = "http://"+serverIP+":"+portnumber;
%>  
<script type="text/javascript" src="<%= ctxPath%>/resources/js/jquery-3.3.1.min.js"></script>
<style type="text/css">
	    
	table, th, td { border: solid 1px gray; }

	#table {width: 1800px; border-collapse: collapse;}
	#table th, #table td {padding: 5px;}
	#table th { background-color: #DDD; }
	.subjectStyle { font-weight: bold; color: navy; cursor: pointer; }
	
	  .topnav {
  background-color: #333;
  overflow: hidden;
}

/* Style the links inside the navigation bar */
.topnav a {
  float: left;
  color: #f2f2f2;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
  font-size: 17px;
}

/* Change the color of links on hover */
.topnav a:hover {
  background-color: #ddd;
  color: black;
}

/* Add a color to the active/current link */
.topnav a.active {
  background-color: #4CAF50;
  color: white;
}
</style>
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
/* //		$("#sizePerPage").val("${paramap.str_sizePerPage}");
//		$("#range").val("${paramap.range}"); */
		
	}
	 
	 $("#displayList").hide();
	 
	 $("#searchWord").keyup(function(){
		 
		 var form_data = {searchType:$("#searchType").val() , searchWord:$("#searchWord").val()};
		 
		 $.ajax({
			
			 url:"<%= request.getContextPath()%>/admin_wordSearchShow.go",
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
	
	 if(sessionStorage.getItem("idx") != null){
		 $("#modalhi").click();
	 }
	 
	 
});

function goSearch(){
	var frm = document.searchFrm;
	frm.method = "GET";
	frm.action = "<%= request.getContextPath()%>/admin_memberManage.go";
	frm.submit();
}

function goRange() {
	var frm = document.rangeFrm;
	frm.method = "GET";
	frm.action = "<%= request.getContextPath()%>/admin_memberManage.go";
	frm.submit();
}

function goOneView(idx){
	sessionStorage.setItem("idx", idx);
	history.go(0);
	
	
} 

function modalclo(){
	sessionStorage.removeItem("idx");
	
}
	

</script>  


<section class="site-hero inner-page overlay" style="background-image: url(/god/resources/images/hero_4.jpg)" data-stellar-background-ratio="0.5">
      <div class="container">
        <div class="row site-hero-inner justify-content-center align-items-center">
          <div class="col-md-10 text-center" data-aos="fade">
            <h1 class="heading mb-3">상품 관리</h1>
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

<div class="topnav" style="margin: 20px 0;">
  <a class="active" href="<%= request.getContextPath() %>/admin_manager.go">Home</a>
  <a href="<%= request.getContextPath() %>/admin_memberManage.go">회원관리</a>
  <a href="<%= request.getContextPath() %>/admin_reserveManage.go">예약관리</a>
  <a href="<%= request.getContextPath() %>/admin_productManage.go">상품관리</a>
  <a href="<%= request.getContextPath() %>/admin_inquiryBoardList.go">문의사항</a>
  <a href="<%= serverName%><%=ctxPath%>/admin_chatting.go">회의</a>
</div>


        
<div align="center" style="margin: 50px 0;">
	<h2 style="margin-bottom: 20px; cursor: pointer;" onclick="javascript:location.href='<%= request.getContextPath() %>/admin_memberManage.go'">회원 목록</h2>
	
	
	<table id="table">
		<tr>
			<th style="width: 70px; text-align: center;">회원번호</th>
			<th style="width: 30px; text-align: center;">아이디</th>
			<th style="width: 50px; text-align: center;">닉네임</th>
			<th style="width: 70px; text-align: center;">성명</th>
			<th style="width: 180px; text-align: center;">이메일</th>
			<th style="width: 180px; text-align: center;">연락처</th>
			<th style="width: 180px; text-align: center;">성별</th>
			<th style="width: 180px; text-align: center;">상세보기</th>
			
			
		</tr>	
			 <c:forEach var="jsmvo" items="${jsmvoList }" varStatus="status"> 
		<tr>
		
				 	<td align="center"><input type="hidden" id="hiddenidx" name="hiddenidx" value="${jsmvo.idx}" />${jsmvo.idx}</td>
				 	<td align="center">${jsmvo.memberId}</td>
				 	<td align="center">${jsmvo.nickName}</td>
				 	<td align="center">${jsmvo.name}</td>
				 	<td align="center">${jsmvo.email}</td>
				 	<td align="center">${jsmvo.tel}</td>
						<c:if test="${jsmvo.gender == 1}">
						<td align="center">남자</td>
						</c:if>
						<c:if test="${jsmvo.gender == 2}">
						<td align="center">여자</td>
						</c:if>
					<td align="center"><span><a id="modal_idx" onclick="goOneView(${jsmvo.idx})"   >보기</a></span></td>
						<a id="modalhi" style="cursor: pointer;" data-toggle="modal" data-target="#membershow" data-dismiss="modal" data-unique="${jsmvo.idx}" ></a>
		</tr>
		
		 		
		
			</c:forEach> 
	</table>
	
	<form name="goViewFrm">
		<input type="hidden" name="seq" />
	</form>
	
	<!-- #120 페이지바 보여주기 -->
	<div align="center" style="width: 70%; border: 0px solid gray; margin-top: 10px;">${pagebar}</div>
	
	<!-- #96 글 검색 폼 추가하기: 글제목,글쓴이로 검색하도록 한다. -->
	<form name="searchFrm" style="">
		<select name="searchType" id="searchType">
			<option value="idx" selected="selected">회원번호</option>
			<option value="memberid">아이디</option>
			<option value="nickname">닉네임</option>
			<option value="name">성명</option>
			<option value="email">이메일</option>
			<option value="tel">연락처</option>
		</select>
		<input type="text" name="searchWord" id="searchWord" autocomplete=off  style="width: 300px;"  />
		<button type="button" onclick="goSearch();">검색</button>
	</form>
	<!-- #101 검색어 입력시 자동글 완성하기 1 -->
	<div id="displayList" style=" width: 300px; height: 100px; overflow: auto; margin-left: 36px; border: solid gray 1px; border-top: -2px;">
	
	</div>
	
	<div class="modal fade" id="membershow" role="dialog">
			
			
				<div class="modal-dialog">
					<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close myclose" data-dismiss="modal">&times;</button>
							<h4 class="modal-title">상세보기</h4>
						</div>
						<div class="modal-body" style="height: 300px; width: 100%;">
							<div id="idFind">
								<input type="hidden" id="modalidx" name="modalidx" value="" />
								<iframe style="border: none; width: 100%; height: 280px;"
									src="<%= request.getContextPath() %>/admin_return.go">
									
								</iframe>
							</div>
							
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default myclose"
								data-dismiss="modal" onclick="modalclo();">Close</button>
						</div>
					</div>
				</div>
			</div>    

	
	
</div>   


		