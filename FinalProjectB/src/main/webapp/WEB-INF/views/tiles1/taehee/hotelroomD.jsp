<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
  
<style>
/*  .wrap {position: absolute;left: 0;bottom: 40px;width: 288px;height: 132px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;} */
    .wrap * {padding: 0;margin: 0;}
    .wrap .info {width: 286px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
    .wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
    .info .title {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}
    .info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
    .info .close:hover {cursor: pointer;}
    .info .body {position: relative;overflow: hidden;}
    .info .desc {position: relative;margin: 13px 0 0 90px;height: 75px;}
    .desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
    .desc .jibun {font-size: 11px;color: #888;margin-top: -2px;}
    .info .img {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;}
    .info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
    .info .link {color: #5085BB;}
    .radius_border{border:1px solid #919191;border-radius:5px;}
    .custom_zoomcontrol {/* position:absolute; */top:50px;right:10px;width:36px;height:80px;overflow:hidden;z-index:1;background-color:#f5f5f5;} 
   .custom_zoomcontrol span {display:block;width:36px;height:40px;text-align:center;cursor:pointer;}     
   .custom_zoomcontrol span img {width:15px;height:15px;padding:12px 0;border:none;}             
   .custom_zoomcontrol span:first-child{border-bottom:1px solid #bfbfbf;} 
   .display-4 {font-size: 2.1rem !important;  }
._gig1e7 {
    width: 100% !important;
    height: 100% !important;
    padding-top: 8px !important;
    padding-bottom: 12px !important;
}

   .hotelAddr{
      font-size: 12px;
   }
   .hotelName{
      font-size: 18px;
      font-weight: bold;
   }
   .hotelPrice{
      font-size: 14px;
   }
   .hotelStar{
      font-size: 12px;
   }
   
   .hotelBox{
      padding: 8px 8px 12px;
   }
   
   button#btn_heart {
          padding: 8px;
          margin: -8px;
          border: none;
          background-color: transparent;
          border: 1px solid red;
          position: absolute;
          right: 18px;
          top: 10px;
         color: #af3d3d;
          font-size: 22px;
      }
</style>
  
    <script type="text/javascript">
	$(document).ready(function(){
    

//////////////////////////////////////////////////////

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

// 주소로 좌표를 검색합니다
geocoder.addressSearch('${hotelroomvo.address}', function(result, status) {

    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {

        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });
         
        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
});    



//////////////////////////////////////////////////////



    
	var rangeDate = 31; // set limit day
	var setSdate, setEdate;
	$("#checkin_date").datepicker({
	    dateFormat: 'yy-mm-dd',
	    minDate: 0,
	    onSelect: function(selectDate){
	        var stxt = selectDate.split("-");
	            stxt[1] = stxt[1] - 1;
	        var sdate = new Date(stxt[0], stxt[1], stxt[2]);
	        var edate = new Date(stxt[0], stxt[1], stxt[2]);
	            edate.setDate(sdate.getDate() + rangeDate);
	        
	        $('#checkout_date').datepicker('option', {
	            minDate: selectDate,
	            beforeShow : function () {
	                $("#checkout_date").datepicker( "option", "maxDate", edate );                
	                setSdate = selectDate;
	                console.log(setSdate)
	        }});
	        //checkout_date 설정
	    }
	    //checkin_date 선택되었을 때
	});
	            
	$("#checkout_date").datepicker({ 
	    dateFormat: 'yy-mm-dd',
	    onSelect : function(selectDate){
	        setEdate = selectDate;
	        console.log(setEdate)
	    }
	});
	$("#btnSearch").on("click", function(e){
	    if($("input#checkin_date").val() == ""){
	        alert("시작일을 선택해주세요.");
	        $("input#checkin_date").focus();
	        return false;
	    }else if($("input#checkout_date").val() == ""){
	        alert("종료일을 선택해주세요.");
	        $("input#checkout_date").focus();
	        return false;
	    }
		
	    
	    var t1 = $("input#checkin_date").val().split("-");
	    var t2 = $("input#checkout_date").val().split("-");
	    var t1date = new Date(t1[0], t1[1], t1[2]);
	    var t2date = new Date(t2[0], t2[1], t2[2]);
	    var diff = t2date - t1date;
	    var currDay = 24 * 60 * 60 * 1000;
	    if(parseInt(diff/currDay) > rangeDate){
	        alert("로그 조회 기간은 " + rangeDate + "일을 초과할 수 없습니다.");        
	        return false;
	    }

		var checkin_dateVal = $("input#checkin_date").val();
		var checkout_dateVal = $("input#checkout_date").val();
		checkin_dateVal = checkin_dateVal.substring(0,4) + checkin_dateVal.substring(5,7) + checkin_dateVal.substring(8);
		checkout_dateVal = checkout_dateVal.substring(0,4) + checkout_dateVal.substring(5,7) + checkout_dateVal.substring(8);
		
		alert(checkin_dateVal);
		alert(checkout_dateVal);
	    
		alert("성공")
	});
	//조회 버튼 클릭
	
	 $("#searchType").bind("change",function(){
         
		 goSearchRoom($(this).val());
         
    });// end of $("#searchType").bind("change",function()
	
	
	});// end of ready
	
	///////////////////////////////////////////////////////////////////////////////////
    
	
		
	function goSearch() {
		var frm = document.infoSearchFrm;
		frm.method = "GET";
		frm.action = "<%=request.getContextPath()%>/list.go";
		//	frm.submit();
	}
	
	function goSearchRoom(searchTypeVal) {
	
		
	
		$.ajax({
			url:"<%= request.getContextPath()%>/reviewjson.action",
			type:"POST",
			dataType:"JSON",
			success:function(json){
				var html = "";
				$.each(json, function(index, item){
					html += "<tr>";
					html += "<td>"+item.adult+"</td>";
					html += "<td>"+item.children+"</td>";
					html += "</tr>";
				});
				
				$("# ").html(html);

			},
			error: function(request, status, error){
				alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
			}			
		});//end of $.ajax

	}
	
	function goView() {
		
		 var frm = document.goViewFrm;		
		 
		 frm.method = "GET";
		 frm.action = "accomodationInfo.go";
	     frm.submit();
	 }
	
	
	
<%-- 	function goShowReview() {

   case: 최신순
		$.ajax({
			url:"<%= request.getContextPath()%>/reviewjson.action",
			type:"POST",
			dataType:"JSON",
			success:function(json){
				var html = "";
				$.each(json, function(index, item){
					html += "<tr>";
					html += "<td style='text-align: center;'>"+item.name+"</td>";
					html += "<td>"+item.star+"</td>";
					html += "<td>"+item.content+"</td>";
					html += "<td style='text-align: center;'>"+item.regDate+"</td>";
					html += "</tr>";
				});
				
				$("#reviewDisplay").html(html);
				frm.content.value = "";
			},
			error: function(request, status, error){
				alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
			}
		}); 
	
	case: 별점 높은 순
	
	
		
	case: 별점 낮은 순	
		

		--%>

	// 이미지 split
	/* 
	 var imgString = '${hotelroomvo.picture}';
     var imgSplit = jbString.split(',');
     for ( var i in imgSplit ) {
       document.write( '<a>' + imgSplit[i] + '</a>' );
     }
 */
	
    </script>
       


    <section class="site-hero inner-page overlay" style="background-image: url(images/hero_4.jpg)" data-stellar-background-ratio="0.5">
   
      <div class="container">
        <div class="row site-hero-inner justify-content-center align-items-center">
          <div class="col-md-10 text-center" data-aos="fade">
            <h1 class="heading mb-3">Contact</h1>
            <ul class="custom-breadcrumbs mb-4">
              <li><a href="index.html">Home</a></li>
              <li>&bullet;</li>
              <li>Contact</li>
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
    
	<section class="py-5 bg-light">
      <div class="container">
        <div class="row align-items-center">
        <c:if test="${hotelroomvo!=null}">
          <div class="col-md-12 col-lg-7 ml-auto order-lg-2 position-relative mb-5  " >
            <img src="http://file.mk.co.kr/meet/neds/2016/02/image_readtop_2016_120257_14554975042357349.jpg" alt="Image" class="img-fluid rounded">
          </div>
          <div class="col-md-12 col-lg-4 order-lg-1 aos-init aos-animate" data-aos="fade-up">
            <h2 class="heading">${hotelroomvo.name}</h2>
            <p>${hotelroomvo.address}</p>
            
            <p class="mb-4">${hotelroomvo.info}</p>
            <p class="mb-4">${hotelroomvo.ontionType}</p>
            <p class="mb-4">문의 : ${hotelroomvo.businessTel}</p>
            
            
            <p><a href="#" class="btn btn-primary text-white py-2 mr-3">찜하기</a> <span class="mr-3 font-family-serif">
            <!-- <em>or</em></span> <a href="https://vimeo.com/channels/staffpicks/93951774" data-fancybox="" class="text-uppercase letter-spacing-1">See video</a></p> -->
          </div>
        </c:if>

        </div>
      </div>
    </section>
    
	<section class="section pb-4" style="margin-top:100px;">
      <div class="container">
       
        <div class="row check-availabilty" id="next">
          <div class="block-32" >
 			<form action="#">
              <div class="row">
                <div class="col-md-6 mb-3 mb-lg-0 col-lg-3">
                  <label for="checkin_date" class="font-weight-bold text-black">Check In</label>
                  <div class="field-icon-wrap">
                    <div class="icon"><span class="icon-calendar"></span></div>
                    <input value="${checkin_date}" type="text" id="checkin_date" class="form-control">
                  </div>
                </div>
                <div class="col-md-6 mb-3 mb-lg-0 col-lg-3">
                  <label for="checkout_date" class="font-weight-bold text-black">Check Out</label>
                  <div class="field-icon-wrap">
                    <div class="icon"><span class="icon-calendar"></span></div>
                    <input value="${checkout_date}" type="text" id="checkout_date" class="form-control">
                  </div>
                </div>
                <div class="col-md-6 mb-3 mb-md-0 col-lg-3">
                  <div class="row">
                    <div class="col-md-6 mb-3 mb-md-0">
                      <label for="adults" class="font-weight-bold text-black">Adults</label>
                      <div class="field-icon-wrap">
                        <div class="icon"><span class="ion-ios-arrow-down"></span></div>
							<select name="searchType adult" id="searchType adults"
								class="form-control">
								<c:if test="${adult!=null and adult!=''}">
									<c:forEach var="i" begin="1" end="4">
										<c:if test="${adult==i}">
											<option value="${i}" selected>${i}</option>
										</c:if>
										<c:if test="${adult!=i}">
											<option value="${i}">${i}</option>
										</c:if>
										<c:if test="${adult==null or adult==''}">
											<option value="1" selected>1</option>
											<option value="2">2</option>
											<option value="3">3</option>
											<option value="4">4+</option>
										</c:if>
									</c:forEach>
								</c:if>
							</select>
						</div>
                    </div>
                    <div class="col-md-6 mb-3 mb-md-0">
                      <label for="searchType children" class="font-weight-bold text-black">Children</label>
                      <div class="field-icon-wrap">
                        <div class="icon"><span class="ion-ios-arrow-down"></span></div>
                        <select name="children" id="searchType children" class="form-control">
                         <c:if test="${children!=null and children!=''}">
								<c:forEach var="i" begin="0" end="3">
									<c:if test="${children==i}">
										<option value="${i}" selected>${i}</option>
									</c:if>
									<c:if test="${children!=i}">
										<option value="${i}">${i}</option>
									</c:if>
									<c:if test="${children==null or children==''}">
										<option value="0" selected>0</option>
										<option value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
									</c:if>
								</c:forEach>
							</c:if>
		
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
	<section class="section slider-section bg-light">

      <!-- 객실 뽑을 for문 -->
    
      <div class="container">

        
            <div class="home-slider major-caousel owl-carousel mb-5" data-aos="fade-up" data-aos-delay="200">
              <div class="slider-item">

               <c:if test="${hotelroomvo.imgList!=null}">
        	<c:forEach var="list" items="${hotelroomvo.imgList}" varStatus="status">
                <c:if test="${status.index}">
                <a href="#" class="image d-block bg-image-2" style="background-image: url('/god/resources/images/room/${list}');"></a>
              	</c:if>
              </c:forEach>
        </c:if>

              </div>
              <div class="slider-item">
              <a href="#" class="image d-block bg-image-2" style="background-image: url('/god/resources/images/room/${list}');"></a>
              </div>
 
            </div>
            <!-- END slider -->
    
      </div>

    </section>
    <!-- END section -->
	<section class="section bg-light">
	<!-- 
            <h2 class="heading aos-init aos-animate" data-aos="fade">Great Offers</h2>
            <p data-aos="fade" class="aos-init aos-animate">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean.</p>
	 -->
	 <c:if test="${HotelRoomVO!=null}">
      <!-- 객실 뽑을 for문 -->
      <c:forEach var="hotelroomvo" items="${HotelRoomVO}">
<%--       <div  hidden="${historyvo.checkin}"></div>
      <div  hidden="${historyvo.checkout}"></div> --%>
        <div class="site-block-half d-block d-lg-flex bg-white  " >
        <c:if test="${hotelroomvo.imgList!=null}">
        	<c:forEach var="list" items="${hotelroomvo.imgList}">
        		<a href="#" class="image d-block bg-image-2" style="background-image: url('/god/resources/images/room/${list}');"></a>
        	</c:forEach>
        </c:if>
          <div class="text">
            <h5 class="mb-4" style="font-size: 25px;">${hotelroomvo.productName}</h5>
            <span class="d-block mb-4"><span class="text-uppercase letter-spacing-2">주중가 : </span><span class="display-4 text-primary" >${hotelroomvo.weekPrice} ~</span> <span class="text-uppercase letter-spacing-2">/ per night</span> </span>
            <span class="d-block mb-4"><span class="text-uppercase letter-spacing-2">주말가 : </span><span class="display-4 text-primary" >${hotelroomvo.weekenPrice} ~</span> <span class="text-uppercase letter-spacing-2">/ per night</span> </span>
            <h5 class="mb-4">침대갯수 : ${hotelroomvo.roomType.substring(1,2)}개 / 수용인원 : ${hotelroomvo.roomType.substring(2)}명</h5>
            <p class="mb-4">${hotelroomvo.roomInfo}</p>
            <p><a href="#" class="btn btn-primary text-white" onclick="goReserve(${productid})">예약하기</a></p>
          </div>
        </div>
        </c:forEach>
      <!-- 객실 뽑을 for문 -->
	</c:if>
    </section>
	
		
    <section class="section contact-section" id="next">
      <div class="container">
        
        
    
                   <div class="col-md-12" style="border: 1px solid gray;">
            <div class="row">
    		<div id="map" style="width:790px;height:500px; margin: 0 auto;"></div>
            </div>
          </div>
       

      </div>
    </section>

    
    <section class="section bg-image overlay" style="background-image: url('images/hero_3.jpg');">
      <div class="container">
        <div class="row justify-content-center text-center mb-5">
          <div class="col-md-7">
            <h2 class="heading text-white  " >REVIEW</h2>
          </div>
        </div>
        <div class="food-menu-tabs aos-init aos-animate" data-aos="fade">

          <!-- Ajax로 최신순 별점순 등등으로 정렬조회 -->
          <ul class="nav nav-tabs mb-5" id="myTab" role="tablist">
            <li class="nav-item">
              <a class="nav-link letter-spacing-2" id="mains-tab" data-toggle="tab" href="#mains" role="tab" aria-controls="mains" aria-selected="false">최신 리뷰</a>
            </li>
            <li class="nav-item">
              <a class="nav-link letter-spacing-2" id="desserts-tab" data-toggle="tab" href="#desserts" role="tab" aria-controls="desserts" aria-selected="false" onclick="goShowReview()">높은 평점 순</a>
            </li>
            <li class="nav-item">
              <a class="nav-link letter-spacing-2 active show" id="drinks-tab" data-toggle="tab" href="#drinks" role="tab" aria-controls="drinks" aria-selected="true" onclick="goShowReview()">낮은 평점 순</a>
            </li>
          </ul>
          <!-- Ajax로 최신순 별점순 등등으로 정렬조회 -->

          <div class="tab-content py-5" id="myTabContent">
            
            
            <div class="tab-pane fade text-left" id="mains" role="tabpanel" aria-labelledby="mains-tab">
              <div class="row">
                <div class="col-md-12">
                
                <!-- for문 부분  최신순  -->
                
                  <div class="food-menu mb-5">
                  <c:if test="${reviewList!=null}">
                  <c:forEach var="reviewvo" items="${reviewList}">
               
					<tr>
					   <span class="d-block text-primary h4 mb-3">작성자${reviewvo.memberidx} / 평점${reviewvo.star}</span>
                    <h3 class="text-white"><a href="#" class="text-white">후기 제목${reviewvo.title}</a></h3>
                    <p class="text-white text-opacity-7">후기 내용 ${reviewvo.content}</p>
            		<h6 class="text-white">작성일${reviewvo.regdate}</h6>
						<td style="text-align: center;">${reviewvo.name}</td>
						<td>${reviewvo.content}</td>
						<td style="text-align: center;">${reviewvo.regDate}</td>
					</tr>
				
				</c:forEach>
				</c:if>
                       </div>
                <!-- for문 부분 -->

                </div>
              </div>
            </div> <!-- .tab-pane -->

			<!-- for문 부분 높은 평점 순  -->
            <div class="tab-pane fade text-left" id="desserts" role="tabpanel" aria-labelledby="desserts-tab">
              <c:forEach var="reviewvo" items="${reviewList}">
              <c:if test="${reviewList!=null}">
              <div class="row">
                <div class="col-md-6">
                  <div class="food-menu mb-5">
                    <span class="d-block text-primary h4 mb-3">${reviewvo.title}</span>
                    <h3 class="text-white"><a href="#" class="text-white">Banana Split</a></h3>
                    <p class="text-white text-opacity-7">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
                </div>
              </div>
            </div> <!-- .tab-pane -->
            <div class="tab-pane fade text-left active show" id="drinks" role="tabpanel" aria-labelledby="drinks-tab">
              <div class="row">
                <div class="col-md-6">
                  <div class="food-menu mb-5">
                    <span class="d-block text-primary h4 mb-3">$32.00</span>
                    <h3 class="text-white"><a href="#" class="text-white">Spring Water</a></h3>
                    <p class="text-white text-opacity-7">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
                  </div>
                </div>
              </div>
            </div> <!-- .tab-pane -->
            </c:if>
            </c:forEach>
           </div>
           <!-- for문 부분  높은 평점 순  -->
           
           
           <!-- for문 부분  낮은 평점 순  -->
<!-- .tab-pane -->

            <div class="tab-pane fade text-left" id="drinks" role="tabpanel" aria-labelledby="drinks-tab">
              <div class="row">
                <div class="col-md-6">
 <c:if test="${reviewList!=null}">
                  <div class="food-menu mb-5">
                    <span class="d-block text-primary h4 mb-3">${reviewvo.title}</span>
                    <h3 class="text-white"><a href="#" class="text-white">Spring Water</a></h3>
                    <p class="text-white text-opacity-7">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
                  </div>
                  <div class="food-menu mb-5">
                    <span class="d-block text-primary h4 mb-3">$14.00</span>
                    <h3 class="text-white"><a href="#" class="text-white">Coke, Diet Coke, Coke Zero</a></h3>
                    <p class="text-white text-opacity-7">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
                  </div>
                  <div class="food-menu mb-5">
                    <span class="d-block text-primary h4 mb-3">$93.00</span>
                    <h3 class="text-white"><a href="#" class="text-white">Orange Fanta</a></h3>
                    <p class="text-white text-opacity-7">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
                  </div>
</c:if>
                </div>        
                </div>
              </div>
              

<!-- .tab-pane -->
           <!-- for문 부분  낮은 평점 순  -->
            </div> 
          </div>
        </div>
   
   	<form name="goView">
   		
		<input type="hidden" name="img" value="${hotelroomvo.imgList}"/>
		<input type="hidden" name="name" value="${hotelroomvo.name}" />
		<input type="hidden" name="address" value="${hotelroomvo.address}"/>
		
		<input type="hidden" name="checkIn" value="${checkin_date}"/>
		<input type="hidden" name="checkOut" value="${checkout_date}"/>
		
		<input type="hidden" name="productName" value="${hotelroomvo.productName}"/>
		
		<input type="hidden" name="roomType2" value="${hotelroomvo.roomType.substring(1,2)}"/> <!-- 침대갯수 -->
		<input type="hidden" name="roomType3" value="${hotelroomvo.roomType.substring(2)}"/>   <!-- 수용인원 -->
		
		<input type="hidden" name="roomType" value="${hotelroomvo.roomType}"/>
		<input type="hidden" name="weekPrice" value="${hotelroomvo.weekPrice}"/>
	</form>
   
   
   
    </section>