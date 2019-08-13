<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style type="text/css">

	/* table, th, td, input, textarea {border: solid gray 1px;}
	
	#table, #table2 {border-collapse: collapse;
	 		         width: 900px;
	 		        }
	#table th, #table td{padding: 5px;}
	#table th{width: 120px; background-color: #DDDDDD;}
	#table td{width: 750px;} */
	.long {width: 470px;}
	.short {width: 120px;}
	
	.move {cursor: pointer;}
	.moveColor {font-weight: bold;}
	
	a {text-decoration: none !important;} 
	
	span .bar {
		color: #dee2e6;
	}
</style>
    
<script type="text/javascript">

	$(document).ready(function(){
		
		$(".move").hover(function(){
			   $(this).addClass("moveColor");	
			 },
	         function(){
			   $(this).removeClass("moveColor");
		});
		
	}); // end of $(document).ready()-------------------

	function goView(seq) {
		
		 var frm = document.goViewFrm;
		 frm.seq.value = seq;
		 
		 frm.method = "GET";
		 frm.action = "noticeView.go";
	     frm.submit();
	 }
	
</script>  
    
    
    
<section class="site-hero inner-page overlay" style="background-image: url(/god/resources/images/hero_4.jpg)" data-stellar-background-ratio="0.5">
      <div class="container">
        <div class="row site-hero-inner justify-content-center align-items-center">
          <div class="col-md-10 text-center" data-aos="fade">
            <h1 class="heading mb-3">공지사항</h1>
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


	<section class="section contact-section" id="next">
    	<div class="container">
        	<div class="row">
        		<div class="col-md-12" data-aos="fade-up" data-aos-delay="100" >
					
				<div style="padding-left: 10%;" class= "bg-white p-md-5 p-4 mb-5">
				<!-- <h1 style="margin-bottom: 30px;">공지사항</h1> -->
				<c:if test="${adminvo != null}">
					<div style="text-align: right; margin-bottom: 20px;">
						<button type="button" class="btn btn-primary text-white py-2 px-4 font-weight-bold" onClick="javascript:location.href='<%= request.getContextPath() %>/noticeEdit.go?seq=${boardvo.seq}'">수정하기</button>
						<%-- <button type="button" class="btn btn-primary text-white py-3 px-5 font-weight-bold" onClick="javascript:location.href='<%= request.getContextPath() %>/noticeDelete.go?seq=${boardvo.seq}'">삭제하기</button> --%>
					</div>
				</c:if>
				<table class="table">
				<!-- style="word-wrap: break-word; table-layout: fixed;  -->
					<tr>
						<th style="text-align: center; font-size: 18px;" colspan="6">${boardvo.subject}</th>
						<%-- <td>${boardvo.seq}</td> --%>
					</tr>
					<tr style="text-align: left;">
						<td>날짜<span style="color: #dee2e6;"> | </span>${boardvo.regDate}&nbsp;&nbsp;&nbsp;&nbsp;작성자<span style="color: #dee2e6;"> | </span>${boardvo.name}&nbsp;&nbsp;&nbsp;&nbsp;조회수<span style="color: #dee2e6;"> | </span>${boardvo.readCount}</td>
						
					</tr>
					<tr>
						<td colspan="6"><c:out value="${boardvo.content}" escapeXml="false" /></td>
					</tr>
					<tr>
						<td></td>
					</tr>
					
					<!-- === #146. 첨부파일 이름 및 파일크기를 보여주고 첨부파일 다운로드 되도록 만들기 === -->
					<%-- <tr>
						<th>첨부파일</th>
						<td>
							<c:if test="${sessionScope.loginuser != null}">
								<a href="<%= request.getContextPath()%>/download.action?seq=${boardvo.seq}">
									${boardvo.orgFilename} <!-- 로그인을 하면 다운되어지게끔 만든다 -->
								</a>
							</c:if>
							<c:if test="${sessionScope.loginuser == null}">
								${boardvo.orgFilename}
							</c:if>
						</td>
					</tr> --%>
					<%-- <tr>
						<th>파일크기(bytes)</th>
						<td>${boardvo.fileSize}</td>
					</tr> --%>
					
				</table>
				
				<%-- 
				<div style="margin-bottom: 1%;">다음글 :&nbsp;&nbsp;<span class="move" onClick="javascript:location.href='noticeView.go?seq=${boardvo.nextseq}'">${boardvo.previoussubject}</span></div>
				<div style="margin-bottom: 1%;">이전글 :&nbsp;&nbsp;<span class="move" onClick="javascript:location.href='noticeView.go?seq=${boardvo.previousseq}'">${boardvo.nextsubject}</span></div>
				 --%>
				<br/>
				
				<%-- <button type="button" onClick="javascript:location.href='<%= request.getContextPath() %>/list.action'">목록보기1</button>  --%>
				<div>
					<button type="button" class="btn btn-primary text-white py-2 px-4 font-weight-bold" onClick="javascript:location.href='${gobackURL}'">목록보기</button>
				</div>
				<%--
				<!-- === #123. 답변글쓰기 버튼 추가하기(현재 보고있는 글이 작성하려는 답변글의 원글(부모글)이 된다.) === -->
				<button type="button" onClick="javascript:location.href='<%= request.getContextPath() %>/add.action?fk_seq=${boardvo.seq}&groupno=${boardvo.groupno}&depthno=${boardvo.depthno}'">답변글쓰기</button> <!-- depthno는 부모글을 가지고 가면서 db에서 +1 -->
				
				<!-- === #84. 댓글쓰기 폼 추가 === --> 
				<h3 style="margin-top: 50px;">댓글쓰기 및 보기</h3>
				<form name="addWriteFrm" style="margin-top: 20px;">
					      <input type="hidden" name="fk_userid" value="${sessionScope.loginuser.userid}" />
					성명 : <input type="text" name="name" value="${sessionScope.loginuser.name}" class="short" readonly />  
					&nbsp;&nbsp;
					댓글내용 : <input id="commentContent" type="text" name="content" class="long" /> 
					
					<!-- 댓글에 달리는 원게시물 글번호(즉, 댓글의 부모글 글번호) -->
					<input type="hidden" name="parentSeq" value="${boardvo.seq}" /> 
					
					<button id="btnComment" type="button" onclick="goAddWrite();">댓글쓰기완료</button> 
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
						<c:if test="${!empty commentList}">
							<c:forEach var="commentvo" items="${commentList}">
								<tr>
									<td style="text-align: center;">${commentvo.name}</td>
									<td>${commentvo.content}</td>
									<td style="text-align: center;">${commentvo.regDate}</td>
								</tr>
							</c:forEach>
						</c:if>
					</tbody>
				</table> --%>
			</div>
          </div>
        </div>
      </div>
    </section>


    <!-- <section class="section testimonial-section bg-light">
      <div class="container">
        <div class="row justify-content-center text-center mb-5">
          <div class="col-md-7">
            <h2 class="heading" data-aos="fade-up">People Says</h2>
          </div>
        </div>
        <div class="row">
          <div class="js-carousel-2 owl-carousel mb-5" data-aos="fade-up" data-aos-delay="200">
            
            <div class="testimonial text-center slider-item">
              <div class="author-image mb-3">
                <img src="images/person_1.jpg" alt="Image placeholder" class="rounded-circle mx-auto">
              </div>
              <blockquote>

                <p>&ldquo;A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth.&rdquo;</p>
              </blockquote>
              <p><em>&mdash; Jean Smith</em></p>
            </div> 

            <div class="testimonial text-center slider-item">
              <div class="author-image mb-3">
                <img src="images/person_2.jpg" alt="Image placeholder" class="rounded-circle mx-auto">
              </div>
              <blockquote>
                <p>&ldquo;Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life One day however a small line of blind text by the name of Lorem Ipsum decided to leave for the far World of Grammar.&rdquo;</p>
              </blockquote>
              <p><em>&mdash; John Doe</em></p>
            </div>

            <div class="testimonial text-center slider-item">
              <div class="author-image mb-3">
                <img src="images/person_3.jpg" alt="Image placeholder" class="rounded-circle mx-auto">
              </div>
              <blockquote>

                <p>&ldquo;When she reached the first hills of the Italic Mountains, she had a last view back on the skyline of her hometown Bookmarksgrove, the headline of Alphabet Village and the subline of her own road, the Line Lane.&rdquo;</p>
              </blockquote>
              <p><em>&mdash; John Doe</em></p>
            </div>


            <div class="testimonial text-center slider-item">
              <div class="author-image mb-3">
                <img src="images/person_1.jpg" alt="Image placeholder" class="rounded-circle mx-auto">
              </div>
              <blockquote>

                <p>&ldquo;A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth.&rdquo;</p>
              </blockquote>
              <p><em>&mdash; Jean Smith</em></p>
            </div> 

            <div class="testimonial text-center slider-item">
              <div class="author-image mb-3">
                <img src="images/person_2.jpg" alt="Image placeholder" class="rounded-circle mx-auto">
              </div>
              <blockquote>
                <p>&ldquo;Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life One day however a small line of blind text by the name of Lorem Ipsum decided to leave for the far World of Grammar.&rdquo;</p>
              </blockquote>
              <p><em>&mdash; John Doe</em></p>
            </div>

            <div class="testimonial text-center slider-item">
              <div class="author-image mb-3">
                <img src="images/person_3.jpg" alt="Image placeholder" class="rounded-circle mx-auto">
              </div>
              <blockquote>

                <p>&ldquo;When she reached the first hills of the Italic Mountains, she had a last view back on the skyline of her hometown Bookmarksgrove, the headline of Alphabet Village and the subline of her own road, the Line Lane.&rdquo;</p>
              </blockquote>
              <p><em>&mdash; John Doe</em></p>
            </div>

          </div>
            END slider
        </div>
      </div>
    </section> -->