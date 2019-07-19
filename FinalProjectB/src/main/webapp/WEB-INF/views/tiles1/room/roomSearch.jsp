<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>

<style>
._gig1e7 {
    width: 100% !important;
    height: 100% !important;
    padding-top: 8px !important;
    padding-bottom: 12px !important;
}
</style>

<script type="text/javascript">
	function googleMapSearch(){
		
	}
</script>



<section class="site-hero inner-page overlay" style="background-image: url(images/hero_4.jpg)" data-stellar-background-ratio="0.5">
      <div class="container">
        <div class="row site-hero-inner justify-content-center align-items-center">
          <div class="col-md-10 text-center" data-aos="fade">
            <h1 class="heading mb-3">Rooms</h1>
            <ul class="custom-breadcrumbs mb-4">
              <li><a href="index.html">Home</a></li>
              <li>&bullet;</li>
              <li>Rooms</li>
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

    <section class="section pb-4">
      <div class="container">
       
        <div class="row check-availabilty" id="next">
          <div class="block-32" data-aos="fade-up" data-aos-offset="-200">

            <form action="#">
              <div class="row">
                <div class="col-md-6 mb-3 mb-lg-0 col-lg-3">
                  <label for="checkin_date" class="font-weight-bold text-black">Check In</label>
                  <div class="field-icon-wrap">
                    <div class="icon"><span class="icon-calendar"></span></div>
                    <input type="text" id="checkin_date" class="form-control">
                  </div>
                </div>
                <div class="col-md-6 mb-3 mb-lg-0 col-lg-3">
                  <label for="checkout_date" class="font-weight-bold text-black">Check Out</label>
                  <div class="field-icon-wrap">
                    <div class="icon"><span class="icon-calendar"></span></div>
                    <input type="text" id="checkout_date" class="form-control">
                  </div>
                </div>
                <div class="col-md-6 mb-3 mb-md-0 col-lg-3">
                  <div class="row">
                    <div class="col-md-6 mb-3 mb-md-0">
                      <label for="adults" class="font-weight-bold text-black">Adults</label>
                      <div class="field-icon-wrap">
                        <div class="icon"><span class="ion-ios-arrow-down"></span></div>
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
                        <div class="icon"><span class="ion-ios-arrow-down"></span></div>
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
                <div class="col-md-6 col-lg-3 align-self-end">
                  <button class="btn btn-primary btn-block text-white">Check Availabilty</button>
                </div>
              </div>
            </form>
          </div>


        </div>
      </div>
    </section>

    
    <section class="section">
      <div class="container">
        <div class="row">
        
          <iframe style="border: none; width: 830px; height: 680px;" src="<%=request.getContextPath() %>/searchStoreMap.go?searchWord=${searchWord}"></iframe>
          
          </div>
        </div>
      </div>
    </section>
    
    <section class="section bg-light">
      <div class="container">
      <!-- 
      	<div class="row justify-content-center text-center mb-9">
          <div class="col-md-9">
            <h2 class="heading aos-animate">Great Offers</h2>
            <p class="aos-init aos-animate">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean.</p>
          </div>
        </div>
         -->
         <div class="row">
			<div class="col-md-3">
		  		<div>
					<form>
					<fieldset>
						<h3 aria-expanded="true" role="button" tabindex="0">검색할 이름</h3>
						<div>
							<span><input type="text" value="" name="f-name" id="f-name" placeholder="숙박 시설 이름…"></span>
							<button type="submit" id="f-name-cta" name="nameSubmit">검색
							</button>
						</div>
					</fieldset>
					<div data-field-collection="non-name">
						<fieldset class="checkbox-filters" data-filter-name="popular" id="filter-popular">
							<legend class="filter-legend">
								<h3 aria-expanded="true" role="button" tabindex="0">인기 필터</h3>
							</legend>
							<div id="filter-popular-contents" class="filter-contents">
								<ul>
									<input type="hidden" name="vrFilterApplied" value="">
									<li class="">
										<input type="checkbox" value="2048" data-id="f-facilities-2048" id="f-popular-2048" aria-labelledby="f-label-popular-2048" name="f-amid">
										<label for="f-popular-2048" id="f-label-popular-2048">무료 아침 식사</label>
									</li>
									<li class="">
										<input type="checkbox" value="128" data-id="f-facilities-128" id="f-popular-128" aria-labelledby="f-label-popular-128" name="f-amid">
										<label for="f-popular-128" id="f-label-popular-128">수영장</label>
									</li>
									<li class="">
										<input type="checkbox" value="527" data-id="f-facilities-527" id="f-popular-527" aria-labelledby="f-label-popular-527" name="f-amid">
										<label for="f-popular-527" id="f-label-popular-527">무료 WiFi</label>
									</li>
									<li class="">
										<input type="checkbox" value="134234112" data-id="f-facilities-134234112" id="f-popular-134234112" aria-labelledby="f-label-popular-134234112" name="f-amid">
										<label for="f-popular-134234112" id="f-label-popular-134234112">주차(무료)</label>
									</li>
									<li class="">
										<input type="checkbox" value="64" data-id="f-facilities-64" id="f-popular-64" aria-labelledby="f-label-popular-64" name="f-amid">
										<label for="f-popular-64" id="f-label-popular-64">애완동물 동반 가능</label>
									</li>
								</ul>
							</div>
						</fieldset>
						<fieldset class="widget-slider-enabled" data-filter-name="price" id="filter-price">
							<legend class="filter-legend">
								<h3 aria-expanded="true" role="button" tabindex="0">1박 요금</h3>
							</legend>
							<div id="filter-price-contents" class="filter-contents">
								<input name="f-price-currency-code" type="hidden" value="KRW">
								<input name="f-price-multiplier" type="hidden" value="1">
								<div class="input-wrapper">
									<label for="f-price-min" id="f-price-min-label">최저 (₩)</label>
									<input type="text" aria-labelledby="f-price-min-label" value="" name="f-price-min" id="f-price-min" placeholder="0" data-range-value="0" tabindex="-1">
								</div>
								<div class="input-wrapper">
									<label for="f-price-max" id="f-price-max-label">최고 (₩)</label>
									<input type="text" aria-labelledby="f-price-max-label" value="" name="f-price-max" id="f-price-max" placeholder="1000000+" data-range-value="1000000" tabindex="-1">
								</div>
							</div>
							<div class="filter-contents">
								<div class="widget-slider">
									<div class="widget-slider-current-values">
										<span class="min">₩0</span> ~ <span class="max">₩1,000,000+</span>
									</div>
								</div>
							</div>
						</fieldset>
						<fieldset class="checkbox-filters inline-touch-controls " data-filter-name="star-rating" id="filter-star-rating">
							<legend class="filter-legend">
								<h3 aria-expanded="true" role="button" tabindex="0">숙박 시설 등급</h3>
							</legend>
							<div id="filter-star-rating-contents" class="filter-contents">
								<ul>
									<li class=""><input type="checkbox" role="checkbox" name="f-star-rating" value="5" id="f-star-rating-5" aria-labelledby="f-label-star-rating-5">
										<label for="f-star-rating-5" id="f-label-star-rating-5">
											<span class="star-rating">5성급</span>
										</label>
									</li>
									<li class="">
										<input type="checkbox" role="checkbox" name="f-star-rating" value="4" id="f-star-rating-4" aria-labelledby="f-label-star-rating-4">
										<label for="f-star-rating-4" id="f-label-star-rating-4">
											<span class="star-rating">4성급</span>
										</label>
									</li>
									<li class="">
										<input type="checkbox" role="checkbox" name="f-star-rating" value="3" id="f-star-rating-3" aria-labelledby="f-label-star-rating-3">
										<label for="f-star-rating-3" id="f-label-star-rating-3">
											<span class="star-rating">3성급</span>
										</label>
									</li>
									<li class="">
										<input type="checkbox" role="checkbox" name="f-star-rating" value="2" id="f-star-rating-2" aria-labelledby="f-label-star-rating-2">
										<label for="f-star-rating-2" id="f-label-star-rating-2">
											<span class="star-rating">2성급</span>
										</label>
									</li>
									<li class="">
										<input type="checkbox" role="checkbox" name="f-star-rating" value="1" id="f-star-rating-1" aria-labelledby="f-label-star-rating-1">
										<label for="f-star-rating-1" id="f-label-star-rating-1">
											<span class="star-rating">1성급</span>
										</label>
									</li>
								</ul>
							</div>
						</fieldset>
						<fieldset class="widget-slider-enabled" data-filter-name="guest-rating" id="filter-guest-rating">
							<h3 aria-expanded="true" role="button" tabindex="0" aria-controls="filter-guest-rating-contents">고객 평점</h3>
							<div id="filter-guest-rating-contents" class="filter-contents">
								<div class="input-wrapper">
									<label for="f-guest-rating-min" id="f-guest-rating-min-label">최저</label>
									<input type="number" value="" name="f-guest-rating-min" id="f-guest-rating-min" placeholder="0" data-range-value="0" min="0" max="10" step="0.5" tabindex="-1">
								</div>
									<div class="input-wrapper">
									<label for="f-guest-rating-max" id="f-guest-rating-max-label">최고</label>
									<input type="number" value="" name="f-guest-rating-max" id="f-guest-rating-max" placeholder="10" data-range-value="10" min="0" max="10" step="0.5" tabindex="-1">
								</div>
							</div>
							<div class="filter-contents">
								<div class="widget-slider">
									<div class="widget-slider-current-values">
										<span class="min">0</span> ~ <span class="max">10</span>
									</div>
									<div class="widget-slider-cont">
										<div class="widget-slider-highlight" style="margin-left: 0%; margin-right: 0%;"></div>
										<div tabindex="0" class="cta cta-control widget-slider-handle widget-slider-handle-min" role="slider" aria-valuemin="0" aria-valuemax="10" aria-labelledby="f-guest-rating-min-label" aria-controls="f-guest-rating-min" aria-valuenow="0" style="left: 0%;"> </div>
										<div tabindex="0" class="cta cta-control widget-slider-handle widget-slider-handle-max" role="slider" aria-valuemin="0" aria-valuemax="10" aria-labelledby="f-guest-rating-max-label" aria-controls="f-guest-rating-max" aria-valuenow="10" style="left: 100%;"> </div>
									</div>
								</div>
							</div>
						</fieldset>
						<fieldset class="checkbox-filters filter-collapsed" data-filter-name="accommodation-type" id="filter-accommodation-type">
							<legend class="filter-legend">
								<h3 aria-expanded="false" role="button" tabindex="0">숙박 시설 유형</h3>
							</legend>
							<div id="filter-accommodation-type-contents" class="filter-contents">
								<ul>
									<li class="">
										<input type="checkbox" name="f-accid" value="30" id="f-accid-30" aria-labelledby="f-label-accid-30">
										<label for="f-accid-30" id="f-label-accid-30">게스트하우스</label>
									</li>
									<li class="">
										<input type="checkbox" name="f-accid" value="3" id="f-accid-3" aria-labelledby="f-label-accid-3">
										<label for="f-accid-3" id="f-label-accid-3">리조트</label>
									</li>
									<li class="">
										<input type="checkbox" name="f-accid" value="7" id="f-accid-7" aria-labelledby="f-label-accid-7">
										<label for="f-accid-7" id="f-label-accid-7">모텔</label>
									</li>
									<li class="">
										<input type="checkbox" name="f-accid" value="25" id="f-accid-25" aria-labelledby="f-label-accid-25">
										<label for="f-accid-25" id="f-label-accid-25">펜션</label>
									</li>
									<li class="">
										<input type="checkbox" name="f-accid" value="12" id="f-accid-12" aria-labelledby="f-label-accid-12">
										<label for="f-accid-12" id="f-label-accid-12">호스텔</label>
									</li>
									<li class="">
										<input type="checkbox" name="f-accid" value="1" id="f-accid-1" aria-labelledby="f-label-accid-1">
										<label for="f-accid-1" id="f-label-accid-1">호텔</label>
									</li>
								</ul>
							</div>
						</fieldset>
						<fieldset class="checkbox-filters filter-collapsed" data-filter-name="facilities" id="filter-facilities">
							<legend class="filter-legend">
							<h3 aria-expanded="false" role="button" tabindex="0">시설</h3>
							</legend>
							<div id="filter-facilities-contents" class="filter-contents">
								<ul>
									<li class="">
										<input type="checkbox" name="f-amid" value="517" id="f-facilities-517" aria-labelledby="f-label-facilities-517">
										<label for="f-facilities-517" id="f-label-facilities-517">객실 내 욕조</label>
									</li>
									<li class="">
										<input type="checkbox" name="f-amid" value="523" id="f-facilities-523" aria-labelledby="f-label-facilities-523">
										<label for="f-facilities-523" id="f-label-facilities-523">객실 연결 가능</label>
									</li>
									<li class="">
										<input type="checkbox" name="f-amid" value="513" id="f-facilities-513" aria-labelledby="f-label-facilities-513">
										<label for="f-facilities-513" id="f-label-facilities-513">공항 교통편</label>
									</li>
									<li class="">
										<input type="checkbox" name="f-amid" value="529" id="f-facilities-529" aria-labelledby="f-label-facilities-529">
										<label for="f-facilities-529" id="f-label-facilities-529">금연</label>
									</li>
									<li class="">
										<input type="checkbox" name="f-amid" value="256" id="f-facilities-256" aria-labelledby="f-label-facilities-256">
										<label for="f-facilities-256" id="f-label-facilities-256">레스토랑</label>
									</li>
									<li class="">
										<input type="checkbox" name="f-amid" value="527" id="f-facilities-527" aria-labelledby="f-label-facilities-527">
										<label for="f-facilities-527" id="f-label-facilities-527">무료 WiFi</label>
									</li>
									<li class="">
										<input type="checkbox" name="f-amid" value="2048" id="f-facilities-2048" aria-labelledby="f-label-facilities-2048">
										<label for="f-facilities-2048" id="f-label-facilities-2048">무료 아침 식사</label>
									</li>
									<li class="">
										<input type="checkbox" name="f-amid" value="515" id="f-facilities-515" aria-labelledby="f-label-facilities-515">
										<label for="f-facilities-515" id="f-label-facilities-515">바</label>
									</li>
									<li class="">
										<input type="checkbox" name="f-amid" value="519" id="f-facilities-519" aria-labelledby="f-label-facilities-519">
										<label for="f-facilities-519" id="f-label-facilities-519">비즈니스 시설</label>
									</li>
									<li class="">
										<input type="checkbox" name="f-amid" value="128" id="f-facilities-128" aria-labelledby="f-label-facilities-128">
										<label for="f-facilities-128" id="f-label-facilities-128">수영장</label>
									</li>
									<li class="">
										<input type="checkbox" name="f-amid" value="531" id="f-facilities-531" aria-labelledby="f-label-facilities-531">
										<label for="f-facilities-531" id="f-label-facilities-531">스키 셔틀</label>
									</li>
									<li class="">
										<input type="checkbox" name="f-amid" value="535" id="f-facilities-535" aria-labelledby="f-label-facilities-535">
										<label for="f-facilities-535" id="f-label-facilities-535">스키 타고 출입 가능</label>
									</li>
									<li class="">
										<input type="checkbox" name="f-amid" value="539" id="f-facilities-539" aria-labelledby="f-label-facilities-539">
										<label for="f-facilities-539" id="f-label-facilities-539">스파</label>
									</li>
									<li class="">
										<input type="checkbox" name="f-amid" value="64" id="f-facilities-64" aria-labelledby="f-label-facilities-64">
										<label for="f-facilities-64" id="f-label-facilities-64">애완동물 동반 가능</label>
									</li>
									<li class="">
										<input type="checkbox" name="f-amid" value="525" id="f-facilities-525" aria-labelledby="f-label-facilities-525">
										<label for="f-facilities-525" id="f-label-facilities-525">유아용 침대 제공</label>
									</li>
									<li class="">
										<input type="checkbox" name="f-amid" value="8" id="f-facilities-8" aria-labelledby="f-label-facilities-8">
										<label for="f-facilities-8" id="f-label-facilities-8">인터넷</label>
									</li>
									<li class="">
										<input type="checkbox" name="f-amid" value="1073743315" id="f-facilities-1073743315" aria-labelledby="f-label-facilities-1073743315">
										<label for="f-facilities-1073743315" id="f-label-facilities-1073743315">전기차 충전소</label>
									</li>
									<li class="">
										<input type="checkbox" name="f-amid" value="32" id="f-facilities-32" aria-labelledby="f-label-facilities-32">
										<label for="f-facilities-32" id="f-label-facilities-32">주방</label>
									</li>
									<li class="">
										<input type="checkbox" name="f-amid" value="134234112" id="f-facilities-134234112" aria-labelledby="f-label-facilities-134234112">
										<label for="f-facilities-134234112" id="f-label-facilities-134234112">주차(무료)</label>
									</li>
									<li class="">
										<input type="checkbox" name="f-amid" value="16384" id="f-facilities-16384" aria-labelledby="f-label-facilities-16384">
										<label for="f-facilities-16384" id="f-label-facilities-16384">주차 가능</label>
									</li>
									<li class="">
										<input type="checkbox" name="f-amid" value="521" id="f-facilities-521" aria-labelledby="f-label-facilities-521">
										<label for="f-facilities-521" id="f-label-facilities-521">탁아서비스</label>
									</li>
									<li class="">
										<input type="checkbox" name="f-amid" value="2" id="f-facilities-2" aria-labelledby="f-label-facilities-2">
										<label for="f-facilities-2" id="f-label-facilities-2">피트니스</label>
									</li>
									<li class="">
										<input type="checkbox" name="f-amid" value="1" id="f-facilities-1" aria-labelledby="f-label-facilities-1">
										<label for="f-facilities-1" id="f-label-facilities-1">회의 시설</label>
									</li>
									<li class="">
										<input type="checkbox" name="f-amid" value="537" id="f-facilities-537" aria-labelledby="f-label-facilities-537">
										<label for="f-facilities-537" id="f-label-facilities-537">흡연 가능</label>
									</li>
								</ul>
							</div>
						</fieldset>
					</div>
					<div class="filters-submit-row">
						<button class="cta">선택 사항 적용</button>
					</div>
				</form>
			</div>
		</div>
    	<div class="col-md-9 aos-animate">
    	
    			<div>
    			<div class="row">
    			
 					<!-- 웅앵웅어쩌구 하트랑있는 에어비엔비 소스 시작 -->
   					<div class="col-12 col-sm-6 col-lg-4 single_gallery_item wow fadeInUpBig" data-wow-delay="0.2s">
	   					<div class="_y89bwt">
		   					<div class="_1dp4576">
			   					<div aria-hidden="false" class="_e296pg">
				   					<div class="_e296pg">
					   					<div class="_13ky0r6y" style="padding-top: 66.6667%; background: rgb(216, 216, 216);">
						   					<div class="_1szwzht">
							   					<a href="/rooms/8087041?location=Paris&amp;adults=1&amp;previous_page_section_name=1001" target="listing_8087041" aria-hidden="true" tabindex="-1">
							   					<span class="_krjbj">Bright Apartment Close to Monmartre</span>
								   					<div class="_qptau">
									   					<div class="_yydl86">
										   					<div class="_1na7kj9b">
											   					<div class="_e296pg" style="width: 100%; height: 100%;">
												   					<div class="_1df8dftk" role="img" aria-label="Bright Apartment Close to Monmartre" style="width: 100%; height: 100%; background-image: url(&quot;https://a0.muscache.com/im/pictures/09c13788-75fa-456f-b8ad-844ce737ba58.jpg?aki_policy=large&quot;);">
												   					</div>
											   					</div>
										   					</div>
									   					</div>
								   					</div>
							   					</a>
							   					<div class="_17bbo57">
								   					<div class="_189umuy">
									   					<div class="_14hndxaq" style="transform: scale(1); width: 18px; opacity: 1;"></div>
									   					<div class="_1qellvc4" style="transform: scale(1); width: 16px; opacity: 1;"></div>
									   					<div class="_1qellvc4" style="transform: scale(1); width: 16px; opacity: 1;"></div>
									   					<div class="_1qellvc4" style="transform: scale(1); width: 16px; opacity: 1;"></div>
									   					<div class="_1qellvc4" style="transform: scale(1); width: 16px; opacity: 1;"></div>
									   					<div class="_1qellvc4" style="transform: scale(0.666667); width: 10.6667px; opacity: 0.875;"></div>
								   					</div>
							   					</div>
						   					</div>
					   					</div>
					   					<div class="_1r8d33l9" aria-hidden="false">
						   					<div class="_tk908t">
							   					<button type="button" aria-label="Bright Apartment Close to Monmartre, 이전 이미지" class="_4fditnk">
							   						<div class="_n0qiwy"></div>
							   					</button>
							   					<button type="button" aria-label="Bright Apartment Close to Monmartre, 다음 이미지" class="_1imd680n">
							   						<div class="_grtzc2"></div>
							   					</button>
						   					</div>
					   					</div>
				   					</div>
				   					<div class="_1j1huff">
					   					<div class="_zjunba">
						   					<div></div>
						   					<div>
							   					<div class="_k1g2qh">
								   					<button type="button" class="_1rp5252" id="8087041" aria-busy="false" style="padding: 8px; margin: -8px;">
									   					<svg viewBox="0 0 24 24" fill="#484848" fill-opacity="0.5" stroke="#ffffff" stroke-width="2" focusable="false" aria-label="목록에 숙소 추가하기" role="img" stroke-linecap="round" stroke-linejoin="round" style="height: 28px;width: 28px;display: block;overflow: visible;">
									   						<path d="m17.5 2.9c-2.1 0-4.1 1.3-5.4 2.8-1.6-1.6-3.8-3.2-6.2-2.7-1.5.2-2.9 1.2-3.6 2.6-2.3 4.1 1 8.3 3.9 11.1 1.4 1.3 2.8 2.5 4.3 3.6.4.3 1.1.9 1.6.9s1.2-.6 1.6-.9c3.2-2.3 6.6-5.1 8.2-8.8 1.5-3.4 0-8.6-4.4-8.6" stroke-linejoin="round"></path>
									   					</svg>
								   					</button>
							   					</div>
						   					</div>
						   				</div>
				   						<div></div>
				   					</div>
			   					</div>
		   					</div>
		   					<div class="_gxc04lv">
			   					<a href="/rooms/8087041?location=Paris&amp;adults=1&amp;previous_page_section_name=1001" target="listing_8087041" rel="noopener" data-check-info-section="true" class="_1ol0z3h">
				   					<div role="text">
					   					<div class="_5ioaf7q" style="color: rgb(118, 118, 118);">
						   					<div class="_1etkxf1" style="color: rgb(118, 118, 118);">
							   					<span class="_1xxanas2">
							   						<span style="color: rgb(118, 118, 118);">아파트 전체<span aria-hidden="true"> · </span>침대 1개</span>
							   					</span>
						   					</div>
					   					</div>
					   					<div style="margin-top: 6px;">
						   					<div class="_88rsw9a">
							   					<div class="_b9qfkc2">
							   						<div class="_1dss1omb">Bright Apartment Close to Monmartre</div>
							   					</div>
						   					</div>
					   					</div>
					   					<div style="margin-top: 2px;">
						   					<div class="_aq2oyh">
							   					<div class="_36rlri">
								   					<span class="_q27mtmr">
									   					<span role="img" aria-label="평점 5/5" class="_rs3rozr" style="width: 50px;">
										   					<span class="_83zdpk" style="width: 50px;">
											   					<span class="_ogu8zgi" style="width: 50px;"></span>
									       					</span>
								       					</span>
							       					</span>
						       					<span class="_krjbj">후기 124개</span>
						       					<span class="_1gvnvab" aria-hidden="true"><span class="_j2qalb2">124</span></span>
						       					</div>
						       					<span class="_j2qalb2"><span aria-hidden="true"> · </span>슈퍼호스트</span>
					       					</div>
				       					</div>
			       					</div>
		       					</a>
	       					</div>
       					</div>
					</div>	
					<!-- 웅앵웅어쩌구 하트랑있는 에어비엔비 소스 종료 -->
										
										
                    					<div class="col-12 col-sm-6 col-lg-4 single_gallery_item wow fadeInUpBig" data-wow-delay="0.2s">
                    					<!-- Product Image -->
	                                    <div class="product-img">
	                                    	<a href="">
	                                        <img src="http://www.trevia.co.kr/storage/upload/tour_item/2016/05/a6b2d652a852c111d58ac64d570fa1b0.jpg">
	                                        <div class="product-quicview">
	                                            <a href="#" data-toggle="modal" data-target="#quickview"><i class="ti-plus"></i></a>
	                                        </div>
	                                        </a>
	                                    </div>
	                                    <!-- Product Description -->
	                                    <div class="product-description">
				                            <h4 class="product-price"></h4>
	                                         <p>sss</p>
	                                        <!-- Add to Cart -->
	                                        <a href="#" class="add-to-cart-btn">ADD TO CART</a>
	                                    </div>
	                                </div>
                    					<div class="col-12 col-sm-6 col-lg-4 single_gallery_item wow fadeInUpBig" data-wow-delay="0.2s">
                    					<!-- Product Image -->
	                                    <div class="product-img">
	                                    	<a href="">
	                                        <img src="http://www.trevia.co.kr/storage/upload/tour_item/2016/05/a6b2d652a852c111d58ac64d570fa1b0.jpg">
	                                        <div class="product-quicview">
	                                            <a href="#" data-toggle="modal" data-target="#quickview"><i class="ti-plus"></i></a>
	                                        </div>
	                                        </a>
	                                    </div>
	                                    <!-- Product Description -->
	                                    <div class="product-description">
				                            <h4 class="product-price"></h4>
	                                         <p>sss</p>
	                                        <!-- Add to Cart -->
	                                        <a href="#" class="add-to-cart-btn">ADD TO CART</a>
	                                    </div>
	                                </div>
                    					<div class="col-12 col-sm-6 col-lg-4 single_gallery_item wow fadeInUpBig" data-wow-delay="0.2s">
                    					<!-- Product Image -->
	                                    <div class="product-img">
	                                    	<a href="">
	                                        <img src="http://www.trevia.co.kr/storage/upload/tour_item/2016/05/a6b2d652a852c111d58ac64d570fa1b0.jpg">
	                                        <div class="product-quicview">
	                                            <a href="#" data-toggle="modal" data-target="#quickview"><i class="ti-plus"></i></a>
	                                        </div>
	                                        </a>
	                                    </div>
	                                    <!-- Product Description -->
	                                    <div class="product-description">
				                            <h4 class="product-price"></h4>
	                                         <p>sss</p>
	                                        <!-- Add to Cart -->
	                                        <a href="#" class="add-to-cart-btn">ADD TO CART</a>
	                                    </div>
	                                </div>
                    					<div class="col-12 col-sm-6 col-lg-4 single_gallery_item wow fadeInUpBig" data-wow-delay="0.2s">
                    					<!-- Product Image -->
	                                    <div class="product-img">
	                                    	<a href="">
	                                        <img src="http://www.trevia.co.kr/storage/upload/tour_item/2016/05/a6b2d652a852c111d58ac64d570fa1b0.jpg">
	                                        <div class="product-quicview">
	                                            <a href="#" data-toggle="modal" data-target="#quickview"><i class="ti-plus"></i></a>
	                                        </div>
	                                        </a>
	                                    </div>
	                                    <!-- Product Description -->
	                                    <div class="product-description">
				                            <h4 class="product-price"></h4>
	                                         <p>sss</p>
	                                        <!-- Add to Cart -->
	                                        <a href="#" class="add-to-cart-btn">ADD TO CART</a>
	                                    </div>
	                                </div>
                    					<div class="col-12 col-sm-6 col-lg-4 single_gallery_item wow fadeInUpBig" data-wow-delay="0.2s">
                    					<!-- Product Image -->
	                                    <div class="product-img">
	                                    	<a href="">
	                                        <img src="http://www.trevia.co.kr/storage/upload/tour_item/2016/05/a6b2d652a852c111d58ac64d570fa1b0.jpg">
	                                        <div class="product-quicview">
	                                            <a href="#" data-toggle="modal" data-target="#quickview"><i class="ti-plus"></i></a>
	                                        </div>
	                                        </a>
	                                    </div>
	                                    <!-- Product Description -->
	                                    <div class="product-description">
				                            <h4 class="product-price"></h4>
	                                         <p>sss</p>
	                                        <!-- Add to Cart -->
	                                        <a href="#" class="add-to-cart-btn">ADD TO CART</a>
	                                    </div>
	                                </div>
                    			</div>
    			
	    			<!-- <div class="col-12 col-sm-6 col-lg-4">
	    				<div>
	    					<a><img src="http://www.trevia.co.kr/storage/upload/tour_item/2016/05/a6b2d652a852c111d58ac64d570fa1b0.jpg" ></a>
	    				</div>
	    				<div>
	    					<h4>호텔명</h4>
	    					<p>호텔위치샬라샬라~</p>
	    					<p>★★★★☆</p>
	    				</div>
	    			</div>
	    			<div class="col-12 col-sm-6 col-lg-4">
	    				<div>
	    					<a><img src="http://www.trevia.co.kr/storage/upload/tour_item/2016/05/a6b2d652a852c111d58ac64d570fa1b0.jpg" ></a>
	    				</div>
	    				<div>
	    					<h4>호텔명</h4>
	    					<p>호텔위치샬라샬라~</p>
	    					<p>★★★★☆</p>
	    				</div>
	    			</div>
	    			<div class="col-12 col-sm-6 col-lg-4">
	    				<div>
	    					<a><img src="http://www.trevia.co.kr/storage/upload/tour_item/2016/05/a6b2d652a852c111d58ac64d570fa1b0.jpg" ></a>
	    				</div>
	    				<div>
	    					<h4>호텔명</h4>
	    					<p>호텔위치샬라샬라~</p>
	    					<p>★★★★☆</p>
	    				</div>
	    			</div>
	    			<div class="col-12 col-sm-6 col-lg-4">
	    				<div>
	    					<a><img src="http://www.trevia.co.kr/storage/upload/tour_item/2016/05/a6b2d652a852c111d58ac64d570fa1b0.jpg" ></a>
	    				</div>
	    				<div>
	    					<h4>호텔명</h4>
	    					<p>호텔위치샬라샬라~</p>
	    					<p>★★★★☆</p>
	    				</div>
	    			</div>
	    			<div class="col-12 col-sm-6 col-lg-4">
	    				<div>
	    					<a><img src="http://www.trevia.co.kr/storage/upload/tour_item/2016/05/a6b2d652a852c111d58ac64d570fa1b0.jpg" ></a>
	    				</div>
	    				<div>
	    					<h4>호텔명</h4>
	    					<p>호텔위치샬라샬라~</p>
	    					<p>★★★★☆</p>
	    				</div>
	    			</div>
	    			<div class="col-12 col-sm-6 col-lg-4">
	    				<div>
	    					<a><img src="http://www.trevia.co.kr/storage/upload/tour_item/2016/05/a6b2d652a852c111d58ac64d570fa1b0.jpg" ></a>
	    				</div>
	    				<div>
	    					<h4>호텔명</h4>
	    					<p>호텔위치샬라샬라~</p>
	    					<p>★★★★☆</p>
	    				</div>
	    			</div> -->
    		
    			
    		</div>
    	
    		<%-- <div>
	    		<table>
	    			<tr>
	    			</tr>
	    			<c:if test="${roomList!=null}">
	    				<c:forEach var="list" items="${roomList}" varStatus="status">
			    			<tr>
			    				<td>${list.name}</td>
			    				<td>${list.address}</td>
			    				<td>${list.name}</td>
			    				<td>${list.name}</td>
			    			</tr>
	    				
	    				</c:forEach>
	    			</c:if>
	    		</table>
    		</div> --%>
    	
          <!-- <a href="#" class="image d-block bg-image-2" style="background-image: url('images/img_1.jpg');"></a>
          	<div class="text">
	            <span class="d-block mb-4"><span class="display-4 text-primary">$199</span> <span class="text-uppercase letter-spacing-2">/ per night</span> </span>
	            <h2 class="mb-4">Family Room</h2>
	            <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean.</p>
	            <p><a href="#" class="btn btn-primary text-white">Book Now</a></p>
          	</div> -->
          	
          	
		</div>
	</div>			
</div>
</section>