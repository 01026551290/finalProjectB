<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String ctxPath =  request.getContextPath();%>
<%-- ======= #27. tiles1 중 footer 페이지 만들기  ======= --%>

<footer class="section footer-section">
	<div class="container">
		<div class="row mb-4">
			<div class="col-md-4 mb-5">
				<ul class="list-unstyled link">
					<li><a href="#">About Us</a></li>
					<li><a href="#">Terms &amp; Conditions</a></li>
					<li><a href="#">Privacy Policy</a></li>
					<li><a href="#">Rooms</a></li>
				</ul>
			</div>
			<div class="col-md-4 mb-5">
				<ul class="list-unstyled link">
					<li><a href="#">The Rooms &amp; Suites</a></li>
					<li><a href="#">About Us</a></li>
					<li><a href="#">Contact Us</a></li>
					<li><a href="#">Restaurant</a></li>
				</ul>
			</div>
			<div class="col-md-4 mb-5 pr-md-5 contact-info">
				<!-- <li>198 West 21th Street, <br> Suite 721 New York NY 10016</li> -->
				<p>
					<span class="d-block">
					<span class="ion-ios-location h5 mr-3 text-primary"></span>Address:</span>
					<span>198 West 21th Street, <br> Suite 721 New York NY 10016</span>
				</p>
				<p>
					<span class="d-block">
					<span class="ion-ios-telephone h5 mr-3 text-primary"></span>Phone:</span>
					<span>(02) 777 7777</span>
				</p>
				<p>
					<span class="d-block">
					<span class="ion-ios-email h5 mr-3 text-primary"></span>Email:</span>
					<span>info@domain.com</span>
				</p>
			</div>
		</div>
		<div class="row pt-5">
			<p class="col-md-12 text-center">
				<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
				Copyright &copy;
				<script>
					document.write(new Date().getFullYear());
				</script>
				All rights reserved | This hompage is made with <i
					class="icon-heart-o" aria-hidden="true"></i> by <a
					href="#" target="_blank">God</a>
				<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
			</p>

			<!-- 
			<p class="col-md-6 text-right social">
				<a href="#"><span class="fa fa-tripadvisor"></span></a>
				<a href="#"><span class="fa fa-facebook"></span></a>
				<a href="#"><span class="fa fa-twitter"></span></a>
				<a href="#"><span class="fa fa-linkedin"></span></a>
				<a href="#"><span class="fa fa-vimeo"></span></a>
			</p> 
			-->
		</div>
	</div>
</footer>

<script src="<%=ctxPath%>/resources/js/jquery-3.3.1.min.js"></script>
<script src="<%=ctxPath%>/resources/js/jquery-migrate-3.0.1.min.js"></script>
<script src="<%=ctxPath%>/resources/js/popper.min.js"></script>
<script src="<%=ctxPath%>/resources/js/bootstrap.min.js"></script>
<script src="<%=ctxPath%>/resources/js/owl.carousel.min.js"></script>
<script src="<%=ctxPath%>/resources/js/jquery.stellar.min.js"></script>
<script src="<%=ctxPath%>/resources/js/jquery.fancybox.min.js"></script>


<script src="<%=ctxPath%>/resources/js/aos.js"></script>

<script src="<%=ctxPath%>/resources/js/bootstrap-datepicker.js"></script>
<script src="<%=ctxPath%>/resources/js/jquery.timepicker.min.js"></script>

<script src="<%=ctxPath%>/resources/js/main.js"></script>