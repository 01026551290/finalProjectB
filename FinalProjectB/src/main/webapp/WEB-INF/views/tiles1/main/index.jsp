<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	String ctxPath = request.getContextPath();
%>

<section class="site-hero overlay" style="background-image: url(<%=ctxPath%>/resources/images/hero_4.jpg)"	data-stellar-background-ratio="0.5">
	<div class="container">
		<div class="row site-hero-inner justify-content-center align-items-center">
			<div class="col-md-10 text-center" data-aos="fade-up">
				<span class="custom-caption text-uppercase text-white d-block  mb-3">
                       Welcome	To 
                       <span class="fa fa-star text-primary"></span> 
                       God
				</span>
				<h1 class="heading">A Best Place To Stay</h1>
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

<section class="section bg-light pb-0">
	<div class="container">

		<div class="row check-availabilty" id="next">
			<div class="block-32" data-aos="fade-up" data-aos-offset="-200">

				<form action="#">
					<div class="row">
						<div class="col-md-6 mb-3 mb-lg-0 col-lg-3">
							<label for="text" class="font-weight-bold text-black">목적지</label>
							<div class="field-icon-wrap">
								<input type="text" id="" class="form-control" placeholder="숙박명 또는 지역명을 검색">
							</div>
						</div>
						<div class="col-md-6 mb-3 mb-md-0 col-lg-3">
							<div class="row">
								<div class="col-md-6 mb-3 mb-md-0">
									<label for="adults" class="font-weight-bold text-black">Adults</label>
									<div class="field-icon-wrap">
										<div class="icon">
											<span class="ion-ios-arrow-down"></span>
										</div>
										<select name="" id="adults" class="form-control">
											<option value="">1</option>
											<option value="">2</option>
											<option value="">3</option>
											<option value="">4+</option>
										</select>
									</div>
								</div>
								<div class="col-md-6 mb-3 mb-md-0">
									<label for="children" class="font-weight-bold text-black">Children</label>
									<div class="field-icon-wrap">
										<div class="icon">
											<span class="ion-ios-arrow-down"></span>
										</div>
										<select name="" id="children" class="form-control">
											<option value="">1</option>
											<option value="">2</option>
											<option value="">3</option>
											<option value="">4+</option>
										</select>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-6 mb-3 mb-lg-0 col-lg-2">
							<label for="checkin_date" class="font-weight-bold text-black">체크인</label>
							<div class="field-icon-wrap">
								<div class="icon">
									<span class="icon-calendar"></span>
								</div>
								<input type="text" id="checkin_date" class="form-control">
							</div>
						</div>
						<div class="col-md-6 mb-3 mb-lg-0 col-lg-2">
							<label for="checkout_date" class="font-weight-bold text-black">체크아웃</label>
							<div class="field-icon-wrap">
								<div class="icon">
									<span class="icon-calendar"></span>
								</div>
								<input type="text" id="checkout_date" class="form-control">
							</div>
						</div>
						<div class="col-md-6 col-lg-2 align-self-end">
							<button class="btn btn-primary btn-block text-white">검색</button>
						</div>
					</div>
				</form>
			</div>


		</div>
	</div>
</section>

<section class="section">
	<div class="container">
		<div class="row justify-content-center text-center mb-5">
			<div class="col-md-7">
				<h2 class="heading">Best 숙소</h2>
				<p>퀄리티와 인테리어 디자인이 검증된 숙소 셀렉션</p>
			</div>
		</div>
		<div class="row">
			<div class="col-md-6 col-lg-4">
				<a href="#" class="room">
					<figure class="img-wrap">
						<img src="<%=ctxPath%>/resources/images/img_1.jpg" alt="Free website template" class="img-fluid mb-3">
					</figure>
					<div class="p-3 text-center room-info">
						<h2>Single Room</h2>
						<span class="text-uppercase letter-spacing-1">90$ / per	night</span>
					</div>
				</a>
			</div>

			<div class="col-md-6 col-lg-4">
				<a href="#" class="room">
					<figure class="img-wrap">
						<img src="<%=ctxPath%>/resources/images/img_2.jpg" alt="Free website template" class="img-fluid mb-3">
					</figure>
					<div class="p-3 text-center room-info">
						<h2>Family Room</h2>
						<span class="text-uppercase letter-spacing-1">120$ / per night</span>
					</div>
				</a>
			</div>

			<div class="col-md-6 col-lg-4">
				<a href="#" class="room">
					<figure class="img-wrap">
						<img src="<%=ctxPath%>/resources/images/img_3.jpg" alt="Free website template" class="img-fluid mb-3">
					</figure>
					<div class="p-3 text-center room-info">
						<h2>Presidential Room</h2>
						<span class="text-uppercase letter-spacing-1">250$ / per night</span>
					</div>
				</a>
			</div>


		</div>
	</div>
</section>

<section class="section blog-post-entry bg-light">
	<div class="container">
		<div class="row justify-content-center text-center mb-5">
			<div class="col-md-7">
				<h2 class="heading">최신 숙소</h2>
				<p>새로 오픈한 숙소를 둘러보세요.</p>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-4 col-md-6 col-sm-6 col-12 post">

				<div class="media media-custom d-block mb-4 h-100">
					<a href="#" class="mb-4 d-block"><img src="<%=ctxPath%>/resources/images/img_1.jpg" alt="Image placeholder" class="img-fluid"></a>
					<div class="media-body">
						<span class="meta-post">February 26, 2018</span>
						<h2 class="mt-0 mb-3">
							<a href="#">Travel Hacks to Make Your Flight More
								Comfortable</a>
						</h2>
						<p>Far far away, behind the word mountains, far from the
							countries Vokalia and Consonantia, there live the blind texts.</p>
					</div>
				</div>

			</div>
			<div class="col-lg-4 col-md-6 col-sm-6 col-12 post">
				<div class="media media-custom d-block mb-4 h-100">
					<a href="#" class="mb-4 d-block"><img src="<%=ctxPath%>/resources/images/img_2.jpg" alt="Image placeholder" class="img-fluid"></a>
					<div class="media-body">
						<span class="meta-post">February 26, 2018</span>
						<h2 class="mt-0 mb-3">
							<a href="#">5 Job Types That Aallow You To Earn As You
								Travel The World</a>
						</h2>
						<p>Separated they live in Bookmarksgrove right at the coast
							of the Semantics, a large language ocean.</p>
					</div>
				</div>
			</div>
			<div class="col-lg-4 col-md-6 col-sm-6 col-12 post">
				<div class="media media-custom d-block mb-4 h-100">
					<a href="#" class="mb-4 d-block"><img src="<%=ctxPath%>/resources/images/img_3.jpg" alt="Image placeholder" class="img-fluid"></a>
					<div class="media-body">
						<span class="meta-post">February 26, 2018</span>
						<h2 class="mt-0 mb-3">
							<a href="#">30 Great Ideas On Gifts For Travelers</a>
						</h2>
						<p>A small river named Duden flows by their place and
							supplies it with the necessary regelialia. t is a paradisematic
							country, in which roasted parts of sentences.</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<section class="section bg-image overlay"
	style="background-image: url('<%=ctxPath%>/resources/images/hero_3.jpg');">
	<div class="container">
		<div class="row justify-content-center text-center mb-5">
			<div class="col-md-7">
				<h2 class="heading text-white" data-aos="fade">Our Restaurant Menu</h2>
				<p class="text-white" data-aos="fade" data-aos-delay="100">Far
					far away, behind the word mountains, far from the countries
					Vokalia and Consonantia, there live the blind texts. Separated
					they live in Bookmarksgrove right at the coast of the Semantics, a
					large language ocean.</p>
			</div>
		</div>
		<div class="food-menu-tabs" data-aos="fade">
			<ul class="nav nav-tabs mb-5" id="myTab" role="tablist">
				<li class="nav-item"><a
					class="nav-link active letter-spacing-2" id="mains-tab"
					data-toggle="tab" href="#mains" role="tab" aria-controls="mains"
					aria-selected="true">Mains</a></li>
				<li class="nav-item"><a class="nav-link letter-spacing-2"
					id="desserts-tab" data-toggle="tab" href="#desserts" role="tab"
					aria-controls="desserts" aria-selected="false">Desserts</a></li>
				<li class="nav-item"><a class="nav-link letter-spacing-2"
					id="drinks-tab" data-toggle="tab" href="#drinks" role="tab"
					aria-controls="drinks" aria-selected="false">Drinks</a></li>
			</ul>
			<div class="tab-content py-5" id="myTabContent">


				<div class="tab-pane fade show active text-left" id="mains"
					role="tabpanel" aria-labelledby="mains-tab">
					<div class="row">
						<div class="col-md-6">
							<div class="food-menu mb-5">
								<span class="d-block text-primary h4 mb-3">$20.00</span>
								<h3 class="text-white">
									<a href="#" class="text-white">Murgh Tikka Masala</a>
								</h3>
								<p class="text-white text-opacity-7">Far far away, behind
									the word mountains, far from the countries Vokalia and
									Consonantia, there live the blind texts.</p>
							</div>
							<div class="food-menu mb-5">
								<span class="d-block text-primary h4 mb-3">$35.00</span>
								<h3 class="text-white">
									<a href="#" class="text-white">Fish Moilee</a>
								</h3>
								<p class="text-white text-opacity-7">Far far away, behind
									the word mountains, far from the countries Vokalia and
									Consonantia, there live the blind texts.</p>
							</div>
							<div class="food-menu mb-5">
								<span class="d-block text-primary h4 mb-3">$15.00</span>
								<h3 class="text-white">
									<a href="#" class="text-white">Safed Gosht</a>
								</h3>
								<p class="text-white text-opacity-7">Far far away, behind
									the word mountains, far from the countries Vokalia and
									Consonantia, there live the blind texts.</p>
							</div>
						</div>
						<div class="col-md-6">
							<div class="food-menu mb-5">
								<span class="d-block text-primary h4 mb-3">$10.00</span>
								<h3 class="text-white">
									<a href="#" class="text-white">French Toast Combo</a>
								</h3>
								<p class="text-white text-opacity-7">Far far away, behind
									the word mountains, far from the countries Vokalia and
									Consonantia, there live the blind texts.</p>
							</div>
							<div class="food-menu mb-5">
								<span class="d-block text-primary h4 mb-3">$8.35</span>
								<h3 class="text-white">
									<a href="#" class="text-white">Vegie Omelet</a>
								</h3>
								<p class="text-white text-opacity-7">Far far away, behind
									the word mountains, far from the countries Vokalia and
									Consonantia, there live the blind texts.</p>
							</div>
							<div class="food-menu mb-5">
								<span class="d-block text-primary h4 mb-3">$22.00</span>
								<h3 class="text-white">
									<a href="#" class="text-white">Chorizo &amp; Egg Omelet</a>
								</h3>
								<p class="text-white text-opacity-7">Far far away, behind
									the word mountains, far from the countries Vokalia and
									Consonantia, there live the blind texts.</p>
							</div>
						</div>
					</div>


				</div>
				<!-- .tab-pane -->

				<div class="tab-pane fade text-left" id="desserts" role="tabpanel" aria-labelledby="desserts-tab">
					<div class="row">
						<div class="col-md-6">
							<div class="food-menu mb-5">
								<span class="d-block text-primary h4 mb-3">$11.00</span>
								<h3 class="text-white">
									<a href="#" class="text-white">Banana Split</a>
								</h3>
								<p class="text-white text-opacity-7">Far far away, behind
									the word mountains, far from the countries Vokalia and
									Consonantia, there live the blind texts.</p>
							</div>
							<div class="food-menu mb-5">
								<span class="d-block text-primary h4 mb-3">$72.00</span>
								<h3 class="text-white">
									<a href="#" class="text-white">Sticky Toffee Pudding</a>
								</h3>
								<p class="text-white text-opacity-7">Far far away, behind
									the word mountains, far from the countries Vokalia and
									Consonantia, there live the blind texts.</p>
							</div>
							<div class="food-menu mb-5">
								<span class="d-block text-primary h4 mb-3">$26.00</span>
								<h3 class="text-white">
									<a href="#" class="text-white">Pecan</a>
								</h3>
								<p class="text-white text-opacity-7">Far far away, behind
									the word mountains, far from the countries Vokalia and
									Consonantia, there live the blind texts.</p>
							</div>
						</div>
						<div class="col-md-6">
							<div class="food-menu mb-5">
								<span class="d-block text-primary h4 mb-3">$42.00</span>
								<h3 class="text-white">
									<a href="#" class="text-white">Apple Strudel</a>
								</h3>
								<p class="text-white text-opacity-7">Far far away, behind
									the word mountains, far from the countries Vokalia and
									Consonantia, there live the blind texts.</p>
							</div>
							<div class="food-menu mb-5">
								<span class="d-block text-primary h4 mb-3">$7.35</span>
								<h3 class="text-white">
									<a href="#" class="text-white">Pancakes</a>
								</h3>
								<p class="text-white text-opacity-7">Far far away, behind
									the word mountains, far from the countries Vokalia and
									Consonantia, there live the blind texts.</p>
							</div>
							<div class="food-menu mb-5">
								<span class="d-block text-primary h4 mb-3">$22.00</span>
								<h3 class="text-white">
									<a href="#" class="text-white">Ice Cream Sundae</a>
								</h3>
								<p class="text-white text-opacity-7">Far far away, behind
									the word mountains, far from the countries Vokalia and
									Consonantia, there live the blind texts.</p>
							</div>
						</div>
					</div>
				</div>
				<!-- .tab-pane -->
				<div class="tab-pane fade text-left" id="drinks" role="tabpanel" aria-labelledby="drinks-tab">
					<div class="row">
						<div class="col-md-6">
							<div class="food-menu mb-5">
								<span class="d-block text-primary h4 mb-3">$32.00</span>
								<h3 class="text-white">
									<a href="#" class="text-white">Spring Water</a>
								</h3>
								<p class="text-white text-opacity-7">Far far away, behind
									the word mountains, far from the countries Vokalia and
									Consonantia, there live the blind texts.</p>
							</div>
							<div class="food-menu mb-5">
								<span class="d-block text-primary h4 mb-3">$14.00</span>
								<h3 class="text-white">
									<a href="#" class="text-white">Coke, Diet Coke, Coke Zero</a>
								</h3>
								<p class="text-white text-opacity-7">Far far away, behind
									the word mountains, far from the countries Vokalia and
									Consonantia, there live the blind texts.</p>
							</div>
							<div class="food-menu mb-5">
								<span class="d-block text-primary h4 mb-3">$93.00</span>
								<h3 class="text-white">
									<a href="#" class="text-white">Orange Fanta</a>
								</h3>
								<p class="text-white text-opacity-7">Far far away, behind
									the word mountains, far from the countries Vokalia and
									Consonantia, there live the blind texts.</p>
							</div>
						</div>
						<div class="col-md-6">
							<div class="food-menu mb-5">
								<span class="d-block text-primary h4 mb-3">$18.00</span>
								<h3 class="text-white">
									<a href="#" class="text-white">Lemonade, Lemon Squash</a>
								</h3>
								<p class="text-white text-opacity-7">Far far away, behind
									the word mountains, far from the countries Vokalia and
									Consonantia, there live the blind texts.</p>
							</div>
							<div class="food-menu mb-5">
								<span class="d-block text-primary h4 mb-3">$38.35</span>
								<h3 class="text-white">
									<a href="#" class="text-white">Sparkling Mineral Water</a>
								</h3>
								<p class="text-white text-opacity-7">Far far away, behind
									the word mountains, far from the countries Vokalia and
									Consonantia, there live the blind texts.</p>
							</div>
							<div class="food-menu mb-5">
								<span class="d-block text-primary h4 mb-3">$69.00</span>
								<h3 class="text-white">
									<a href="#" class="text-white">Lemon, Lime &amp; Bitters</a>
								</h3>
								<p class="text-white text-opacity-7">Far far away, behind
									the word mountains, far from the countries Vokalia and
									Consonantia, there live the blind texts.</p>
							</div>
						</div>
					</div>
				</div>
				<!-- .tab-pane -->
			</div>
		</div>
	</div>
</section>

<!-- END section -->