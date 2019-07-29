<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<section class="site-hero inner-page overlay" style="background-image: url(images/hero_4.jpg)" data-stellar-background-ratio="0.5">
      <div class="container">
        <div class="row site-hero-inner justify-content-center align-items-center">
          <div class="col-md-10 text-center" data-aos="fade">
            <h1 class="heading mb-3">Room Registration</h1>
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
          <div class="col-md-12" data-aos="fade-up" data-aos-delay="100" >
            
            <form action="#" method="post" class="bg-white p-md-5 p-4 mb-5 border">
              
                <div class="row">
                
                <div class="col-md-6 form-group">
                  <label class="text-black font-weight-bold" for="gtype">객실 종류</label>
                  <div class="field-icon-wrap">
                    <div class="icon"><span class="ion-ios-arrow-down"></span></div>
                    <select name="" id="gtype" class="form-control">
                      <option value="" selected disabled hidden>선택하세요</option>
                      <option value="">싱글룸</option>
                      <option value="">더블룸</option>
                      <option value="">트윈룸</option>
                      <option value="">패밀리룸</option>
                    </select>
                  </div>
                </div>
                <div class="col-md-6 form-group">
                  <label class="text-black font-weight-bold" for="gperson">수용 인원</label>
                  <div class="field-icon-wrap">
                    <div class="icon"><span class="ion-ios-arrow-down"></span></div>
                    <select name="" id="gperson" class="form-control">
                      <option value="" selected disabled hidden>선택하세요</option>
                      <option value="">1인</option>
                      <option value="">2인</option>
                      <option value="">3인</option>
                      <option value="">4인</option>
                      <option value="">5인</option>
                    </select>
                  </div>
                </div>
              </div>
                
              <div class="row">
                <div class="col-md-6 form-group">
                  <label class="text-black font-weight-bold" for="gname">주중가</label>
                  <input type="text" id="gname" class="form-control" placeholder="원">
                </div>
                <div class="col-md-6 form-group">
                  <label class="text-black font-weight-bold" for="gphone">주말가</label>
                  <input type="text" id="gphone" class="form-control" placeholder="원">
                </div>
              </div>
                
                <div class="row">
                <div class="col-md-4 form-group">
                  <label class="text-black font-weight-bold" for="gname">숙소 등록 가능일</label>
                  <input type="text" id="gname" class="form-control" placeholder="년">
                </div>
                <div class="col-md-4 form-group">
                  <label class="text-black font-weight-bold" for="gphone">&nbsp;</label>
                  <input type="text" id="gphone" class="form-control" placeholder="월">
                </div>
                <div class="col-md-4 form-group">
                  <label class="text-black font-weight-bold" for="gphone">&nbsp;</label>
                  <input type="text" id="gphone" class="form-control" placeholder="일">
                </div>
              </div>
              
              <div class="row">
                <div class="col-md-4 form-group">
                  <label class="text-black font-weight-bold" for="gname">숙소 등록 종료일</label>
                  <input type="text" id="gname" class="form-control" placeholder="년">
                </div>
                <div class="col-md-4 form-group">
                  <label class="text-black font-weight-bold" for="gphone">&nbsp;</label>
                  <input type="text" id="gphone" class="form-control" placeholder="월">
                </div>
                <div class="col-md-4 form-group">
                  <label class="text-black font-weight-bold" for="gphone">&nbsp;</label>
                  <input type="text" id="gphone" class="form-control" placeholder="일">
                </div>
              </div>
				
				<div class="row"> 
                <div class="col-md-12 form-group">
                    <label class="text-black font-weight-bold" for="goption">객실 옵션</label><br/>
                    <input type="checkbox" id="essential" name="essential">&nbsp;<label for="essential" class="chk">필수품목</label>
                    <input type="checkbox" id="roomtv">&nbsp;<label for="roomtv" class="chk">TV</label>
                    <input type="checkbox" id="cabletv" name="cabletv" >&nbsp;<label for="cabletv" class="chk">케이블 TV</label>
                    <input type="checkbox" id="aircon" name="aircon">&nbsp;<label for="aircon" class="chk">에어컨</label>
                    <input type="checkbox" id="heating" name="heating">&nbsp;<label for="heating" class="chk">난방</label>
                    <input type="checkbox" id="kitchen" name="kitchen">&nbsp;<label for="kitchen" class="chk">부엌</label>
                    <input type="checkbox" id="internet" name="internet">&nbsp;<label for="internet" class="chk">인터넷</label>
                    <input type="checkbox" id="wifi" name="wifi">&nbsp;<label for="wifi" class="chk">무선 인터넷</label>
                    <input type="checkbox" id="24checkin" name="24checkin">&nbsp;<label for="24checkin" class="chk">24시간 체크인</label>
                </div>
               </div>
				
              <div class="row">
                <div class="col-md-6 form-group">
                  <input type="submit" value="Register" class="btn btn-primary text-white py-3 px-5 font-weight-bold">
                </div>
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