<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<% String ctxPath = request.getContextPath(); %>
    
<script type="text/javascript">
function gobtn() {
	alert("시작1");
  	  var frm = document.registerFrm;
  	  frm.method = "POST";
  	  frm.action = "photoaddeditEnd.go";
  	  alert("시작2");
  	  frm.submit();
	}
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
      <div class="container">
        <div class="row">
          <div class="col-md-7" data-aos="fade-up" data-aos-delay="100">
            <div>::: 마이페이지 :::</div>
            <!-- /////////////////////////////////////////////////////////////////// -->
            <form name="registerFrm" enctype="multipart/form-data">                      
            <tr>
				<th>프로필사진</th><br/>
				<td><input type="file" id="attach" name="attach" /></td>
			</tr>
			<button type="button" class="btn btn-primary text-white" onclick="gobtn()";>수정</button>
			</form>
		</div>                
			</div>
				</div>
					</section>
    <!-- END section -->
  
   