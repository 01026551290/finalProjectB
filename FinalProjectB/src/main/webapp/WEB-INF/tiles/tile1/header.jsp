<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- ======= #25. tiles1 중 header 페이지 만들기  ======= --%>
<%
	String ctxPath = request.getContextPath();
%>

<header class="site-header js-site-header">
	<div class="container-fluid">
		<div class="row align-items-center">
			<div class="col-3 col-lg-3 site-logo" data-aos="fade">
				<a href="index.go">God</a>
			</div>
               
               <div class="col-6 col-lg-6">
                   <div data-aos="fade-up" data-aos-offset="-200">
				<!-- <form action="#">
					<div class="row">
						<div class="col-mdw-8 col-lg-8 col-sm-8">
							<div class="field-icon-wrap">
								<input type="text" id="" class="form-control" placeholder="숙박명 또는 지역명을 검색">
							</div>
						</div>
													
						<div class="col-md-4 col-lg-4 col-sm-4 align-self-end">
							<button class="btn btn-primary btn-block text-white pdlr0">검색</button>
						</div>
					</div>
				</form> -->
				<div class="searchType">
					<span class="styleWord">실시간검색어 : </span>				
				    <span class="searchWord">1.조아조아호텔(포이치문)</span>
				</div>
			</div>
               
               </div>
               
			<div class="col-3 col-lg-3">


				<div class="site-menu-toggle js-site-menu-toggle" data-aos="fade">
					<span></span> <span></span> <span></span>
				</div>
				<!-- END menu-toggle -->

				<div class="site-navbar js-site-navbar">
					<nav role="navigation">
						<div class="container">
							<div class="row full-height align-items-center">
								<div class="col-md-6 mx-auto">
									<ul class="list-unstyled menu">
										<li class="active"><a href="index.go">홈으로</a></li>
										<!-- 로그인 전 -->
										<li><a href="#">로그인</a></li>
										<li><a href="#">회원가입</a></li>
										<li><a href="#">고객센터</a></li>
										
										<!-- 로그인 후 보여지는 메뉴    
										<li class="active"><a href="index.go">홈으로</a></li>
										<li><a href="#">여행</a></li>
										<li><a href="#">찜목록</a></li>
										<li><a href="#">마이페이지</a></li>
										-->
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