<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>

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
      
    .heartAreaIn {
		background: url(..<%=request.getContextPath()%>/resources/images/heart_bgb.png);
	    background-size: 22px 22px;
	    display: inline-flex;
	    width: 22px;
	    height: 22px;
	}
	.heartAreaOut {
		background: url(..<%=request.getContextPath()%>/resources/images/heart_bg.png);
	    background-size: 22px 22px;
	    display: inline-flex;
	    width: 22px;
	    height: 22px;
	}
</style>

 <script type="text/javascript">
   map = null;
   
   $(document).ready(function(){
      
      var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
       mapOption = {
           center: new kakao.maps.LatLng(33.510485, 126.491321), // 지도의 중심좌표
           level: 9 // 지도의 확대 레벨
       };  
      
      var map = new kakao.maps.Map(mapContainer, mapOption); 
      var geocoder = new kakao.maps.services.Geocoder();

      
      $.ajax({
         url:"/god/searchRoomMap.go",
         type:"GET",
         dataType:"JSON",
         success:function(json){

            if(json.length > 0) { 
               // 검색된 데이터가 있는 경우임. 만약에 조회된 데이터가 없을 경우 if(json == null) 이 아니고 if(json.length == 0) 이라고 써야 한다. 
               
               var html = "";
                content = "";
               cnt = 0;
            
               $.each(json, function(entryIndex, item){
                  var addr = item.addr;
                  var name = item.name;
                  var img = item.img;
                  var largeCategoryontionCode = item.largeCategoryontionCode;
                  var price = item.price;
                  cnt++;
                  
                  geocoder.addressSearch(addr, function(result, status) {

                     // 정상적으로 검색이 완료됐으면 
                       if (status === kakao.maps.services.Status.OK) {

                          var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

                          // 결과값으로 받은 위치를 마커로 표시합니다
                          var marker = new kakao.maps.Marker({
                              map: map,
                              position: coords,
                              clickable: true
                          });

                          var iwContent = '<div class="wrap">' + 
                          '    <div class="info">' + 
                          '        <div class="title">' + 
                          '            '+name + 
                          '            <div class="close" onclick="closeOverlay()" ></div>' + 
                          '        </div>' + 
                          '        <div class="body">' + 
                          '            <div class="img ">' +
                          '                <img src="/god/resources/images/hotel/'+img+'" width="73" height="70">' +
                          '           </div>' + 
                          '            <div class="desc">' + 
                          '                <div class="ellipsis">'+addr+'</div>' +
                          '                <div class="jibun ellipsis">'+price+'원~</div>' +
                          '                <div><a href="http://www.kakaocorp.com/main" target="_blank" class="link">상세조회</a></div>' + 
                          '            </div>' + 
                          '        </div>' + 
                          '    </div>' +    
                           '</div>';//,
                          //iwRemoveable = true;
                          
                          var infowindow = new kakao.maps.InfoWindow({
                        	  content : iwContent//,
                          	  //removable : iwRemoveable
                          });
                          
                          kakao.maps.event.addListener(marker,'click',function(){
                        	  infowindow.open(map,marker);
                          })
                          
                        
                          var overlay = new kakao.maps.CustomOverlay({
                                content: content,
                                map: map,
                                position: marker.getPosition()       
                            });
                          
                          kakao.maps.event.addListener(marker, 'click', function() {
                                overlay.setMap(map);
                            });
                          
                           if(cnt==1)
                             map.setCenter(coords);
                      } 
                       
                       
                           
                  }); 
                  
                  console.log(addr);
               });
               
               
            }
         },
         error: function(request, status, error){
            alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
         }
      });//ajax

      function closeOverlay() {
  	    overlay.setMap(null);     
  	}         
        
      $("#displayList").hide();
		
		$("#searchWord").keyup(function(){
			
			var form_data = {searchWord:$("#searchWord").val()};
			
			$.ajax({
				url:"<%=request.getContextPath()%>/autosearch/wordSearchView.go",
				type:"GET",
				data:form_data,
				dataType:"JSON",
				success:function(json) {
					
					// === 검색어 입력시 자동글 완성하기 7 ===
					if(json.length > 0) {
					
						var html = "";
						
						$.each(json, function(entryIndex, item){
							var name = item.name;
							var addr = item.addr;
							
							var len = $("#searchWord").val().length;
							var result = "";
							
							if(name != null && name.length > 0) {
							var indexN = name.toLowerCase().indexOf( $("#searchWord").val().toLowerCase() );
								result += "<span class='clickWord' style='display: inline-block; width: 100%;'><span class='first'>" +name.substr(0, indexN)+ "</span>" + "<span class='second' style='color:#ffaa34;'>" +name.substr(indexN, len)+ "</span>" + "<span class='third'>" +name.substr(indexN+len)+ "</span></span>";
							}
							
							if(addr != null && addr.length > 0) {
							var indexA = addr.toLowerCase().indexOf( $("#searchWord").val().toLowerCase() );
								result += "<span class='clickWord' style='display: inline-block; width: 100%;'><span class='first'>" +addr.substr(0, indexA)+ "</span>" + "<span class='second' style='color:#ffaa34;'>" +addr.substr(indexA, len)+ "</span>" + "<span class='third'>" +addr.substr(indexA+len)+ "</span></span>";
							}
								html += "<span style='cursor:pointer;'>"+ result +"</span><br/>";
						});
						
						$("#displayList").html(html);
						$("#displayList").show();
						
					}
					else {
						// 검색된 데이터가 존재하지 않을 경우
						$("#displayList").hide();
					}
					
				},
				error: function(request, status, error){
					alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
				}
			});
		});	
		// === 검색어 입력시 자동글 완성하기 8 ===
		$("#displayList").click(function(event){
			var word = "";
			var $target = $(event.target);
			
			if($target.is(".clickWord")) {
				word = $target.text();
			}
			else if($target.is(".first")) {
				word = $target.text() + $target.next().text() + $target.next().next().text();
			}
			else if($target.is(".second")) {
				word = $target.prev().text() + $target.text() + $target.next().text();
			}
			else if($target.is(".third")) {
				word = $target.prev().prev().text() + $target.prev().text() + $target.text();
			}	
			$("#searchWord").val(word); // 텍스트박스에 검색된 결과의 문자열을 입력해준다.
			
			$("#displayList").hide();
			
			goSearch();
		});
		
		///////////////////////////////////////////////////////////////////////////////////
		
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
		
		///////////////////////////////////////////////////////////////////////////////////
		
		
		
        
   });//document.ready

	function goSearch() {
		var frm = document.infoSearchFrm;
		frm.method = "GET";
		frm.action = "<%=request.getContextPath()%>/search.go";
		//	frm.submit();
	}
	
       
</script> 


<section class="site-hero inner-page overlay" style="background-image: url(/god/resources/images/hero_4.jpg)" data-stellar-background-ratio="0.5">
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

				<form name="infoSearchFrm">
					<div class="row">
						<div class="col-md-6 mb-3 mb-lg-0 col-lg-3">
							<label for="text" class="font-weight-bold text-black">목적지</label>
							<div class="field-icon-wrap">
								<input type="text" id="searchWord" class="form-control"
									placeholder="숙박명 또는 지역명을 검색" autocomplete="off">

								<!-- === 검색어 입력시 자동글 완성하기 1 === -->
								<div id="displayList"></div>
								<!-- //end 검색어 입력시 자동글 완성하기 1 -->

							</div>
						</div>
						<div class="col-md-6 mb-3 mb-md-0 col-lg-3">
							<div class="row">
								<div class="col-md-6 mb-3 mb-md-0">
									<label for="adult" class="font-weight-bold text-black">성인</label>
									<div class="field-icon-wrap">
										<div class="icon">
											<span class="ion-ios-arrow-down"></span>
										</div>
										<select name="adult" id="adults" class="form-control">
											<option value="1" selected>1</option>
											<option value="2">2</option>
											<option value="3">3</option>
											<option value="4">4+</option>
										</select>
									</div>
								</div>
								<div class="col-md-6 mb-3 mb-md-0">
									<label for="children" class="font-weight-bold text-black">아동</label>
									<div class="field-icon-wrap">
										<div class="icon">
											<span class="ion-ios-arrow-down"></span>
										</div>
										<select name="children" id="children" class="form-control">
											<option value="0" selected>0</option>
											<option value="1">1</option>
											<option value="2">2</option>
											<option value="3">3</option>
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
								<input type="text" id="checkin_date" name="checkin_date" type="date" class="form-control" style="padding-right:0;" autocomplete="off">
							</div>
						</div>
						<div class="col-md-6 mb-3 mb-lg-0 col-lg-2">
							<label for="checkout_date" class="font-weight-bold text-black">체크아웃</label>
							<div class="field-icon-wrap">
								<div class="icon">
									<span class="icon-calendar"></span>
								</div>
								<input type="text" id="checkout_date" type="date" name="checkout_date" class="form-control" style="padding-right:0;" autocomplete="off">
							</div>
						</div>
						<div class="col-md-6 col-lg-2 align-self-end">
							<button id="btnSearch" class="btn btn-primary btn-block text-white">검색</button>
						</div>
					</div>
				</form>
			</div>

		</div>
      </div>
    </section>

    
    <section class="section section_map">
      <div class="container">
        <div class="row">
           <div class="map_wrap col-md-12">
              <div id="map" style="height:680px; margin: 0 auto;" class="block-32 aos-init aos-animate"></div>
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
         <div class="col-md-3 col-sm-5">
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
       <div class="col-md-9 aos-animate col-sm-7">       
            <div>
             <div class="row">
               
         <c:if test="${hotelRoomVOList!=null}">
            <c:forEach var="vo" items="${hotelRoomVOList}">
               <div class="col-lg-4 col-md-6 col-sm-12 hotelBox ">
                     <!-- 상단(이미지,찜하트) -->
                     <div style="    position: relative;">
                     <button type="button" onclick="location.href='/god/addHeart.go?largeCategoryontionCode=${vo.largeCategoryontionCode}'" class="heart" id="btn_heart${status}" aria-busy="false" style="padding: 8px; margin: -8px; border: none; background-color: transparent;">
                        <span class="heartAreaOut">
	                     <c:if test="${vo.regDay!=null}">
							<span class="heartAreaIn" style="width: 22px;"><span class="blind">heart</span></span>
	                     	</c:if>
 			      		 </span>
                     </button>
                        <img src="/god/resources/images/hotel/${vo.img}" style="width: 100%;">
                     </div>
                     <!-- 하단(설명,호텔명,가격,평점) -->
                     <div style="padding: 12px 0 0 0;">
                        <div class="hotelAddr">${vo.address}</div>
                        <div class="hotelName">${vo.name}</div>
                        <div class="hotelPrice">${vo.weekPrice}원 ~</div>
                        <c:if test="${vo.starcnt!=0}">
	                        <div class="hotelStar">★★★★☆ ${vo.star}&nbsp;${vo.starcnt}개의 후기</div>
                        </c:if>
                        <c:if test="${vo.starcnt==0}">
	                        <div class="hotelStar">아직 후기가 없습니다.</div>                    
                        </c:if>
                     </div>
                      </div>
            </c:forEach>
         </c:if>
                  
             </div>
            </div>
       
      </div>
   </div>         
</div>
</section> 