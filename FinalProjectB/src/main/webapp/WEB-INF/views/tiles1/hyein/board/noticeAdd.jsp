<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	String ctxPath = request.getContextPath();
%>

<style type="text/css">

	/* table, th, td {border: solid 1px gray;}

    #table {width: 970px; border-collapse: collapse;}
    #table th, #table td {padding: 5px;}
    #table th {background-color: #DDD;} */
     
    .subjectStyle {font-weight: bold;
                   cursor: pointer;} 
	/* .long {width: 470px;}
	.short {width: 120px;}  */
	
</style>
    
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
	    
	    <%-- ====== 스마트 에디터 구현 끝 ====== --%>
	     
	    //쓰기버튼
	    $("#btnWrite").click(function(){
	        //id가 content인 textarea에 에디터에서 대입
	        obj.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
	        
	     // 글제목 유효성 검사
			var subjectval = $("#subject").val().trim();
			if(subjectval == "") {
				alert("글제목을 입력하세요!!");
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
			<%-- ====== 스마트 에디터 구현 끝 =========== --%>
			
			// 글내용 유효성 검사
			var contentval = $("#content").val().trim();
			if(contentval == "") {
				alert("글내용을 입력하세요!!");
				return;
			}
			
			// 글암호 유효성 검사
			var pwval = $("#pw").val().trim();
			if(pwval == "") {
				alert("글암호를 입력하세요!!");
				return;
			}
	        
	     	// 폼을 submit
			var frm = document.addFrm;
			frm.method = "POST"; // 파일을 첨부할 경우라면 반드시 POST이어야만 가능하다. GET이라면 파일첨부가 안되어진다.
			frm.action = "<%= ctxPath%>/noticeAddEnd.go";
			frm.submit();
	    });
		
	}); // end of $(document).ready()-------------------

	function goView(seq) {
		
		 var frm = document.goViewFrm;
		 frm.seq.value = seq;
		 
		 frm.method = "GET";
		 frm.action = "<%= request.getContextPath()%>/noticeView.go";
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
        		<div class="col-md-12 aos-init aos-animate" data-aos="fade-up" data-aos-delay="100" >
					
				<div style="padding-left: 10%; border: solid 0px red;" class= "bg-white p-md-5 p-4 mb-5">
				<h1 style="margin-bottom: 50px; color: #6c757d;">글쓰기</h1>
				
				<%--<form name="addFrm"> 첨부파일이 없을 때 폼이름 --%>
				<%--
				=== #131. 파일첨부하기 ===
				        먼저 위의 문장을 주석처리한 후 아래와 같이 해야 한다.
				    enctype="multipart/form-data" 를 해주어야만 파일첨부가 되어진다. 
				--%>
				<form name="addFrm" enctype="multipart/form-data">
					<table class="table">
						<tr>
							<th width="130px;">작성자</th>
							<td>	
							    <%-- <input type="hidden" name="fk_userid" value="${sessionScope.loginuser.userid}" readonly /> --%>
								<!-- <input type="text" name="name" value="관리자" class="short" readonly /> -->          
								관리자
								<c:if test="${loginuser != null}">
									<input type="hidden" id="fk_member" name="fk_member" value="${loginuser.member}"  readonly />
									<input type="text" id="name" name="name" value="${loginuser.name}" class="short" readonly />
								</c:if>
								<c:if test="${adminvo != null}">
									<input type="hidden" id="fk_member" name="fk_member" value="${adminvo.seq}"  readonly />
									<input type="hidden" id="name" name="name" value="관리자" class="short" readonly />
								</c:if>
							</td>
						</tr>
						<tr>
							<th>제목</th>
							<td><input type="text" name="subject" id="subject" style="width: 860px;"/></td>
						</tr>
						<tr>
							<th>내용</th>
							<td>
							<textarea name="content" id="content" rows="10" cols="100" style="width: 95%; height: 412px;"></textarea>	
							</td>
						</tr>
						
						<%-- === #132. 파일첨부 타입 추가하기 === --%>
						<!-- <tr>
							<th>파일첨부</th>
							<td><input type="file" name="attach" /></td>
						</tr> -->
						
						<tr>
							<th>글암호</th>
							<td><input type="password" name="pw" id="pw" class="short" /></td>
						</tr>
						<tr>
							<th>파일첨부</th>
							<td><input type="file" name="attach" id="attach" class="short" /></td>
						</tr>
						<tr>
							<td colspan="2"></td>
						</tr>
					</table>
					
					<!-- === #125. 답변글쓰기인 경우 === 
								      부모글의 seq 값인 fk_seq 값과
								      부모글의 groupno 값과
								      부모글의 depthno 값을 hidden 타입으로 보내준다. -->
					<input type="hidden" name="fk_seq" value="${fk_seq}"/>					      
					<input type="hidden" name="groupno" value="${groupno}"/>					      
					<input type="hidden" name="depthno" value="${depthno}"/>					      
					
					<div style="margin: 20px;">
						<button type="button" id="btnWrite" style="margin-right: 5px;" class="btn btn-primary text-white py-2 px-4 font-weight-bold">쓰기</button>
						<button type="button" onclick="javascript:history.back();" class="btn btn-primary text-white py-2 px-4 font-weight-bold">취소</button>
					</div>
					
				</form>
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