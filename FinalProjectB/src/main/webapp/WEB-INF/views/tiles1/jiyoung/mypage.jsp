<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<% String ctxPath = request.getContextPath(); %>
    
<script type="text/javascript">
	
	$(document).ready(function(){		
		
		 $("#pwd").keydown(function(event){
	  			
	  			if(event.keyCode == 13) { // 엔터를 했을 경우
	  				func_Login();
	  			}
	    	 });
		
		
		$("#NAME").focus();
	
		$(".form-control").each(function(){
			$(this).blur(function(){
				var data = $(this).val().trim();
				if(data == "") {
					// 입력하지 않거나 공백만 입력했을 경우
					$(this).parent().find(".error").show();
					$(":input").attr("disabled",true).addClass("bgcol"); 
					$(this).attr("disabled",false).removeClass("bgcol");
					$(this).focus();
				}
				else {
					// 공백이 아닌 글자를 입력했을 경우
					$(this).parent().find(".error").hide();
					$(":input").attr("disabled",false).removeClass("bgcol"); 
				}
			});
		}); // end of $(".form-control").each()-------

	}); // end of $(document).ready()-------------------

</script>


<section class="site-hero inner-page overlay" style="background-image: url(<%=ctxPath%>/resources/images/hero_4.jpg)" data-stellar-background-ratio="0.5">
      <div class="container">
        <div class="row site-hero-inner justify-content-center align-items-center">
          <div class="col-md-10 text-center" data-aos="fade">
            <h1 class="heading mb-3">My Page</h1>
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
      <div class="container" >
        <div class="row">
           <div class="col-md-12">
            <!-- /////////////////////////////////////////////////////////////////// -->
			<c:if test="${loginuser != null }">  
				<div class="col-md-5">
					<img style = "width: 150px;" src="<%=ctxPath%>/resources/images/member/${loginuser.picture}" title="뜨나요" style="padding-bottom: 30px;"> 
				</div>
				<div class="col-md-7">
           			<h3><a class="text-black" href="mypage.go">${loginuser.name}님의 페이지</a></h3>
           			<p><a class="text-black" href="<%= ctxPath%>/photoaddedit.go">내 사진 추가/변경</</p>
					<p><a class="text-black" href="#">내 구매기록 조회</a>                           </p>
					<p><a class="text-black" href="<%= ctxPath%>/pwdpass.go">내 정보수정</a>         </p>
					<p><a class="text-black" href="#">내 글 조회</a>                                 </p>
					<p><a class="text-black" href="#">찜목록</a>                                     </p>
				</div>
			</c:if>
			</div>
            
          <%--   
            
            <form name="registerFrm" enctype="multipart/form-data">                      
			<div class="container">
				<div class="row full-height align-items-center">
					<div class="col-md-6 mx-auto">
						<ul class="list-unstyled menu">
							<div class="col-md-12">
							<c:if test="${loginuser != null }">  
								<div class="col-md-5">
								<!-- 돌아가는거!!! -->
							
								<li><img style = "width: 150px;" src="<%=ctxPath%>/resources/images/member/${loginuser.picture}" title="뜨나요" style="padding-bottom: 30px;"></li> 
								</div >
								<div class="col-md-7">
	                   			<li class="active"><a href="mypage.go">${loginuser.name}님의 페이지</a></li>
	                   			<li><a href="<%= ctxPath%>/photoaddedit.go">내 사진 추가/변경</a></li>
								<li><a href="#">내 구매기록 조회</a></li>
								<li><a href="<%= ctxPath%>/pwdpass.go">내 정보수정</a></li>
								<li><a href="#">내 글 조회</a></li>
								<li><a href="#">찜목록</a></li>
								</div>
							</c:if>
							</div>
						</ul>
					</div>
				</div>
			</div>
            </form> --%>
            <!-- /////////////////////////////////////////////////////////////////// -->
            
          </div>                  
        </div>
    </section>  
   