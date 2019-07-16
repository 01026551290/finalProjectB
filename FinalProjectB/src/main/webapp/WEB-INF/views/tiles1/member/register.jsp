<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<%
	String ctxPath = request.getContextPath();
%>     

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중복 ID 검사하기</title>

<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/css/style.css" />
<script type="text/javascript" src="<%= ctxPath%>/js/jquery-3.3.1.min.js"></script>

<script type="text/javascript">
	
	$(document).ready(function(){
		$("#error").hide();
	});
	function goCheck() {
		var userid = $("#userid").val().trim();
		
		if(userid == "") {
			$("#error").show();
			$("#userid").val("");
			$("#userid").focus();
			
			return;
		}
		else {
			$("#error").hide();
			
			var frm = document.frmIdcheck;
			frm.method = "POST";
			frm.action = "idDuplicateCheck.kh";
			frm.submit();
		}
		
	}
	function setUserID(userid) {
		$(opener.document).find("#userid").val(userid);
	    $(opener.document).find("#pwd").focus();
	    
	    self.close();
	}
 <body>
    
 </script>
 </head>
  <!--  전송방식이 GET 이라면 ID중복검사를 하기위한 form 을 띄워주어야 한다. -->
	<c:if test="${method =='GET'}">
	<form name="frmIdcheck"> <!-- 회원가입, 로그인, 글 작성하거나 파일 전송할때 사용한다. 사용자의 데이터를 전송하는 것이다. -->
		<table style="width: 95%; height: 100px;">
			<tr>
				<td style="text-align: center;">
					아이디를 입력하세요<br style="line-height: 200%;"/>					
					<input type="text" name="userid" id="userid" size="20" maxlength="20" class="box" /><br style="line-height: 300%;"/> <!-- id는 css에서 쓰고, name은 데이터베이스에서 쓴다. -->
					<span id="error" style="color: red; font-size: 12pt; font-weight: bold;">아이디를 입력하세요!</span><br/> 
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
		<c:if test="${isUseUserid ==true}">

			<div align="center">
			    <br style="line-height: 400%"/>
				ID로[<span style="color: red; font-weight: bold;">${userid}</span>] 사용가능합니다.
				<br/><br/><br/>
				<button type="button" class="box" onclick="setUserID('${userid}')">닫기</button>
			</div>
			</c:if>
		
		<%-- ID가 중복되어 사용불가능한 경우  --%>
		<c:if test="${isUseUserid ==false}">
			<div align="center">
			  [<span style="color: red; font-weight: bold;">${userid}</span>] 는 이미 사용중입니다.
			  <br/><br/>
			  <form name="frmIdcheck">
				<table style="width: 95%; height: 100px;">
					<tr>
						<td style="text-align: center;">
						          아이디를 입력하세요  <br style="line-height: 200%;"/>							    					     
							<input type="text" name="userid" id="userid" size="20" maxlength="20" class="box" /><br style="line-height: 300%;"/>  
							<span id="error" style="color: red; font-size: 12pt; font-weight: bold;">아이디를 입력하세요!</span><br/> 
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
    <header class="site-header js-site-header">
      <div class="container-fluid">
        <div class="row align-items-center">
          <div class="col-6 col-lg-4 site-logo" data-aos="fade"><a href="index.html">Sogo Hotel</a></div>
          <div class="col-6 col-lg-8">


            <div class="site-menu-toggle js-site-menu-toggle"  data-aos="fade">
              <span></span>
              <span></span>
              <span></span>
            </div>
            <!-- END menu-toggle -->

            <div class="site-navbar js-site-navbar">
              <nav role="navigation">
                <div class="container">
                  <div class="row full-height align-items-center">
                    <div class="col-md-6 mx-auto">
                      <ul class="list-unstyled menu">
                        <li><a href="index.html">Home</a></li>
                        <li><a href="rooms.html">Rooms</a></li>
                        <li><a href="about.html">About</a></li>
                        <li><a href="events.html">Events</a></li>
                        <li><a href="contact.html">Contact</a></li>
                        <li class="active"><a href="reservation.html">Reservation</a></li>
                      </ul>
                    </div>
                  </div>
                </div>
              </nav>
            </div>
          </div>
        </div>
      </div>
    </header>
    <!-- END head -->

    <section class="site-hero inner-page overlay" style="background-image: url(images/hero_4.jpg)" data-stellar-background-ratio="0.5">
      <div class="container">
        <div class="row site-hero-inner justify-content-center align-items-center">
          <div class="col-md-10 text-center" data-aos="fade">
            <h1 class="heading mb-3">Reservation Form</h1>
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
          <div class="col-md-7" data-aos="fade-up" data-aos-delay="100">            
            <form action="#" method="post" class="bg-white p-md-5 p-4 mb-5 border">
              <div class="row">
                <div class="col-md-6 form-group">
                  <label class="text-black font-weight-bold" for="name">회원아이디</label>
                  <input type="text" id="" class="form-control ">
                </div>
                <div class="col-md-6 form-group">
                  <label class="text-black font-weight-bold" for="phone">닉네임</label>
                  <input type="text" id="phone" class="form-control ">
                </div>
              </div>
          
              <div class="row">
                <div class="col-md-12 form-group">
                  <label class="text-black font-weight-bold" for="email">암호</label>
                  <input type="email" id="email" class="form-control ">
                </div>
              </div>
              
              <div class="row">
                <div class="col-md-12 form-group">
                  <label class="text-black font-weight-bold" for="email">암호확인</label>
                  <input type="email" id="email" class="form-control ">
                </div>
              </div>
              <div class="row">
                <div class="col-md-12 form-group">
                  <label class="text-black font-weight-bold" for="email">성명</label>
                  <input type="email" id="email" class="form-control ">
                </div>
              </div>
              <div class="row">
                <div class="col-md-12 form-group">
                  <label class="text-black font-weight-bold" for="email">이메일</label>
                  <input type="email" id="email" class="form-control ">
                </div>
              </div>
              
              <div class="row">
                <div class="col-md-12 form-group">
                  <label class="text-black font-weight-bold" for="email">전화번호</label>
                  <input type="email" id="email" class="form-control ">
                </div>
              </div>
              
              <div class="row">
                <div class="col-md-12 form-group">
                  <label class="text-black font-weight-bold" for="email">생년월일</label>
                   <input type="number" id="birthyyyy" name="birthyyyy" min="1950" max="2050" step="1" value="1995" style="width: 80px;" required />
                   
                </div>
              </div>
              <div class="row">
                <div class="col-md-12 form-group">
                  <label class="text-black font-weight-bold" for="email">성별</label>
                  <input type="radio" id="male" name="gender" value="1" /><label for="male" style="margin-left: 2%;">남자</label>
			   <input type="radio" id="female" name="gender" value="2" style="margin-left: 10%;" /><label for="female" style="margin-left: 2%;">여자</label>
                </div>
              </div>
              <div class="row">
                <div class="col-md-6 form-group">
                  <input type="submit" value="Reserve Now" class="btn btn-primary text-white py-3 px-5 font-weight-bold">
                </div>
              </div>
            </form>

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

    
    
    <section class="section bg-image overlay" style="background-image: url('images/hero_4.jpg');">
        <div class="container" >
          <div class="row align-items-center">
            <div class="col-12 col-md-6 text-center mb-4 mb-md-0 text-md-left" data-aos="fade-up">
              <h2 class="text-white font-weight-bold">A Best Place To Stay. Reserve Now!</h2>
            </div>
            <div class="col-12 col-md-6 text-center text-md-right" data-aos="fade-up" data-aos-delay="200">
              <a href="reservation.html" class="btn btn-outline-white-primary py-3 text-white px-5">Reserve Now</a>
            </div>
          </div>
        </div>
      </section>
      
      