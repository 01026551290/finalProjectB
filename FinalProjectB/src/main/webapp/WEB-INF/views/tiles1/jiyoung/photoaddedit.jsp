<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<% String ctxPath = request.getContextPath(); %>

<script type="text/javascript">

function gobtn() {
  	  var frm = document.registerFrm;
  	  frm.method = "POST";
  	  frm.action = "photoaddeditEnd.go";
  	  frm.submit();
	}
	
</script>
<section class="site-hero inner-page overlay"style="background-image: url(<%=ctxPath%>/resources/images/hero_4.jpg)" data-stellar-background-ratio="0.5">
	<div class="container">
		<div class="row site-hero-inner justify-content-center align-items-center">
			<div class="col-md-10 text-center" data-aos="fade">
				<h1 class="heading mb-3">사진추가/변경</h1>
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
			<div class="col-md-5">
				<div class="row">
					<div class="col-md-10 ml-auto contact-info">
						<p class="loginborder">
							<span class="text-black">사진 변경/추가</span>
						</p>
					</div>
				</div>
			</div>
			<div class="col-md-7">
				<form name="registerFrm" class="bg-white p-md-5 p-4 mb-5 border" enctype="multipart/form-data">
					<div class="row">
						<div class="col-md-12 form-group"></div>
					</div>
					<tr>
						<th>프로필사진</th>
						<br/>
						<td><input type="file" id="attach" name="attach" /></td>
					</tr>
					<button type="button" class="btn btn-primary text-white" onclick="gobtn();">수정</button>
				</form>
			</div>
		</div>
	</div>
</section>
<!-- END section -->

