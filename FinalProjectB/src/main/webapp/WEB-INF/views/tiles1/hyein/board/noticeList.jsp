<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>


<style type="text/css">

	table, th, td {border: solid 1px gray;}

    #table {width: 970px; border-collapse: collapse;}
    #table th, #table td {padding: 5px;}
    /* #table th {background-color: #DDD;} */
     
    .subjectStyle {font-weight: bold;
                   color: navy;
                   cursor: pointer;} 
	
</style>
    
<script type="text/javascript">

	$(document).ready(function(){
		
		<!-- === #102. 검색어 입력시 자동글 완성하기 2 === -->
		$("#displayList").hide();
		
	}); // end of $(document).ready()-------------------


	
</script>  
    
    
    
<section class="site-hero inner-page overlay" style="background-image: url(images/hero_4.jpg)" data-stellar-background-ratio="0.5">
      <div class="container">
        <div class="row site-hero-inner justify-content-center align-items-center">
          <div class="col-md-10 text-center" data-aos="fade">
            <h1 class="heading mb-3">Notice</h1>
            <ul class="custom-breadcrumbs mb-4">
              <li><a href="index.html">Home</a></li>
              <li>&bullet;</li>
              <li>Reservation</li>
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
					
					<div style="padding-left: 3%;">
					<h2 style="margin-bottom: 30px;">글목록</h2>
					
					<table id="table">
						<tr>
							<th style="width: 70px;  text-align: center;">글번호</th>
							<th style="width: 360px; text-align: center;">제목</th>
							<th style="width: 70px;  text-align: center;">성명</th>
							<th style="width: 180px; text-align: center;">날짜</th>
							<th style="width: 70px;  text-align: center;">조회수</th>
							
							<!-- === #143. 파일과 크기를 보여주도록 수정 === -->
							<th style="width: 70px; text-align: center;">파일</th>
							<!-- <th style="width: 100px; text-align: center;">크기(bytes)</th> -->
						</tr>	
						<c:forEach var="boardvo" items="${boardList}" varStatus="status">
							<tr>
								<td align="center">${boardvo.seq}</td>
								<td align="left"> 
								   <%-- === 댓글쓰기가 없는 게시판 === 
								        <span class="subject" onclick="goView('${boardvo.seq}');">${boardvo.subject}</span>
								   --%> 
								   
								   <%-- === 댓글쓰기가 있는 게시판 === --%> 
								   <%--
								   <c:if test="${boardvo.commentCount > 0}">	
								   	  <span class="subject" onclick="goView('${boardvo.seq}');">${boardvo.subject}&nbsp;<span style="vertical-align: super;">[<span style="color: red; font-size: 9pt; font-style: italic; font-weight: bold;">${boardvo.commentCount}</span>]</span></span>
								   </c:if>
								   <c:if test="${boardvo.commentCount == 0}">
								   	  <span class="subject" onclick="goView('${boardvo.seq}');">${boardvo.subject}</span>
								   </c:if>
								   --%> 
								   
								   
								   
								   <%-- === 댓글쓰기 및 답변형 게시판 === 
								   			답변글인 경우 글제목 앞에 공백(여백)과 함께 └Re 라는 글자를 붙이도록 하겠다.
								   --%> 
								   <!-- 답변글이 아닌 원글인 경우 -->
								   <%-- 
								   <c:if test="${boardvo.depthno == 0}"> <!-- 원글이라면 -->
									   <c:if test="${boardvo.commentCount > 0}">	
									   	  <span class="subject" onclick="goView('${boardvo.seq}');">${boardvo.subject}&nbsp;<span style="vertical-align: super;">[<span style="color: red; font-size: 9pt; font-style: italic; font-weight: bold;">${boardvo.commentCount}</span>]</span></span>
									   </c:if>
									   <c:if test="${boardvo.commentCount == 0}">
									   	  <span class="subject" onclick="goView('${boardvo.seq}');">${boardvo.subject}</span>
									   </c:if>
								    </c:if>
								   
								   <!-- 답변글인 원글인 경우 -->
								   <c:if test="${boardvo.depthno > 0}"> <!-- 답변글이라면 -->
									   <c:if test="${boardvo.commentCount > 0}">	
									   	  <span class="subject" onclick="goView('${boardvo.seq}');"><span style="color: red; font-style: italic; padding-left: ${boardvo.depthno * 20}px;">└Re&nbsp;</span>${boardvo.subject}&nbsp;<span style="vertical-align: super;">[<span style="color: red; font-size: 9pt; font-style: italic; font-weight: bold;">${boardvo.commentCount}</span>]</span></span>
									   </c:if>
									   <c:if test="${boardvo.commentCount == 0}">
									   	  <span class="subject" onclick="goView('${boardvo.seq}');"><span style="color: red; font-style: italic; padding-left: ${boardvo.depthno * 20}px;">└Re&nbsp;</span>${boardvo.subject}</span>
									   </c:if>
								   </c:if>
								    --%>
								   
								</td>
								<td align="center">${boardvo.name}</td>
								<td align="center">${boardvo.regDate}</td>
								<td align="center">${boardvo.readCount}</td>
								
								<!-- === #144. 파일과 크기를 보여주도록 수정 === 
									     /BoardTeacher/src/main/webapp/resources/images/disk.gif 이미지 파일을 사용하여 첨부파일의 유무를 보여주도록 한다. 
								-->
								<td align="center">
									<c:if test="${not empty boardvo.fileName}"> 
										<img src="<%= request.getContextPath()%>/resources/images/disk.gif" />
									</c:if>
								</td>
								<%-- <td align="center">
									<c:if test="${not empty boardvo.fileSize}">
										${boardvo.fileSize} <!-- 파일크기 -->
									</c:if>
								</td> --%>
						    </tr>
						</c:forEach>
					</table>
					<br/>
					
					<form name="goViewFrm">
						<input type="hidden" name="seq"/>
						<input type="hidden" name="gobackURL" value="${gobackURL}" />
					</form>
					
					<!-- === #120. 페이지바 보여주기 === -->
					<div align="center" style="width: 70%; border: 0px solid gray; margin-left: 50px; margin-bottom: 20px;">
						${pagebar}
					</div>
					
					
					<!-- === #96. 글검색 폼 추가하기 : 글제목, 글쓴이로 검색을 하도록 한다. === --> 
					<form name="searchFrm" style="">
						<select name="searchType" id="searchType" style="height: 26px;">
							<option value="subject">글제목</option>
							<option value="name">글쓴이</option>
						</select>
						<input type="text" name="searchWord" id="searchWord" size="40" autocomplete="off" /> 
						<button type="button" onclick="goSearch()" class= "btn btn-primary text-white py-3 px-5 font-weight-bold" style="padding: 0;">검색</button>
					</form>
					
					<!-- === #101. 검색어 입력시 자동글 완성하기 1 === -->
					<div id="displayList" style="width: 314px; height: 100px; overflow: auto; margin-left: 70px; margin-top: -1px; border-top: 0px; border: solid gray 1px;">
					</div>
	
			</div>
			<!-- <div class="col-md-5" data-aos="fade-up" data-aos-delay="200">
            <div class="row">
              <div class="col-md-10 ml-auto contact-info">
                <p><span class="d-block">Address:</span> <span class="text-black"> 98 West 21th Street, Suite 721 New York NY 10016</span></p>
                <p><span class="d-block">Phone:</span> <span class="text-black"> (+1) 435 3533</span></p>
                <p><span class="d-block">Email:</span> <span class="text-black"> info@yourdomain.com</span></p>
              </div>
            </div>
          </div>-->
          </div>
        </div>
      </div>
    </section>


    <section class="section testimonial-section bg-light">
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
            <!-- END slider -->
        </div>
      </div>
    </section>