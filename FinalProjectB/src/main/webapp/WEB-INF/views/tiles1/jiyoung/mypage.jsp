<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>


    
<script type="text/javascript">
	
	$(document).ready(function(){		
				
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

 	 
   	  var frm = document.registerFrm;
   	  frm.method = "POST";
   	  frm.action = "memberInsert.go";
   	  frm.submit();
	}// end of function goRegister(event)----------
	
</script>


<section class="site-hero inner-page overlay" style="background-image: url(images/hero_4.jpg)" data-stellar-background-ratio="0.5" >
      <div class="container">
        <div class="row site-hero-inner justify-content-center align-items-center">
          <div class="col-md-10 text-center" data-aos="fade">
            <h1 class="heading mb-3">My Page</h1>
            <ul class="custom-breadcrumbs mb-4">
              <li><a href="index.go">홈으로</a></li>
              <li>&bullet;</li>
              <li>예약하기</li>
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
      <div class="container" >
        <div class="row">
          <div class="col-md-7" data-aos="fade-up" data-aos-delay="100">
            <div>::: 마이페이지 :::</div>
            <div style=" width: 300px; height: 300px; "  ></div>
            <tr>
				<th>프로필사진</th><br/>
				<td><input type="file" name="attach" name="attach" /></td>
			</tr>
            <form name="registerFrm" enctype="multipart/form-data">                      
              <div style="position: relative; top: -300px; left: 300px;" >
              <div class="row">
                <div class="col-md-12 form-group">
              <div class="row">
                <div class="col-md-12 form-group">
                  <label class="text-black font-weight-bold" for="NAME" >${userid}님의 페이지</label>
                  
                </div>
              </div>
                  <label class="text-black font-weight-bold" for="MEMBERID">내 구매기록 조회</label>
                </div>
              </div>
              <div class="row">
                <div class="col-md-12 form-group">
                  <label class="text-black font-weight-bold" for="PWD">내 정보수정</label>
                </div>
              </div>
              <div class="row">
                <div class="col-md-12 form-group">
                  <label class="text-black font-weight-bold" for="PWDcheck">내 글 조회</label>
                </div>
              </div>
              <div class="row">
                <div class="col-md-12 form-group">
                  <label class="text-black font-weight-bold" for="NICKNAME">찜목록</label>
                </div>
              </div>
             </div>
            </form>

          </div>                  
        </div>
      </div>
    </section>  
   