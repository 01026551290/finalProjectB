<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	String ctxPath = request.getContextPath();
%>

<style>
.wrap * {
	padding: 0;
	margin: 0;
}

.wrap .info {
	width: 286px;
	height: 120px;
	border-radius: 5px;
	border-bottom: 2px solid #ccc;
	border-right: 1px solid #ccc;
	overflow: hidden;
	background: #fff;
}

.wrap .info:nth-child(1) {
	border: 0;
	box-shadow: 0px 1px 2px #888;
}

.info .title {
	padding: 5px 0 0 10px;
	height: 30px;
	background: #eee;
	border-bottom: 1px solid #ddd;
	font-size: 18px;
	font-weight: bold;
}

.info .close {
	position: absolute;
	top: 10px;
	right: 10px;
	color: #888;
	width: 17px;
	height: 17px;
	background:
		url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');
}

.info .close:hover {
	cursor: pointer;
}

.info .body {
	position: relative;
	overflow: hidden;
}

.info .desc {
	position: relative;
	margin: 13px 0 0 90px;
	height: 75px;
}

.desc .ellipsis {
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}

.desc .jibun {
	font-size: 11px;
	color: #888;
	margin-top: -2px;
}

.info .img {
	position: absolute;
	top: 6px;
	left: 5px;
	width: 73px;
	height: 71px;
	border: 1px solid #ddd;
	color: #888;
	overflow: hidden;
}

.info:after {
	content: '';
	position: absolute;
	margin-left: -12px;
	left: 50%;
	bottom: 0;
	width: 22px;
	height: 12px;
	background:
		url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')
}

.info .link {
	color: #5085BB;
}

.radius_border {
	border: 1px solid #919191;
	border-radius: 5px;
}

.custom_zoomcontrol { /* position:absolute; */
	top: 50px;
	right: 10px;
	width: 36px;
	height: 80px;
	overflow: hidden;
	z-index: 1;
	background-color: #f5f5f5;
}

.custom_zoomcontrol span {
	display: block;
	width: 36px;
	height: 40px;
	text-align: center;
	cursor: pointer;
}

.custom_zoomcontrol span img {
	width: 15px;
	height: 15px;
	padding: 12px 0;
	border: none;
}

.custom_zoomcontrol span:first-child {
	border-bottom: 1px solid #bfbfbf;
}

.display-4 {
	font-size: 2.1rem !important;
}

._gig1e7 {
	width: 100% !important;
	height: 100% !important;
	padding-top: 8px !important;
	padding-bottom: 12px !important;
}

.hotelAddr {
	font-size: 12px;
}

.hotelName {
	font-size: 18px;
	font-weight: bold;
}

.hotelPrice {
	font-size: 14px;
}

.hotelStar {
	font-size: 12px;
}

.hotelBox {
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
	   	  largeCategoryontionCode = {largeCategoryontionCode:${HotelVO.largeCategoryontionCode}};
	      $.ajax({ // 리뷰부분 ajax처리         
	             url:"/god/hotelReviewList.go",
	             type:"GET",
	             dataType:"JSON",
	             data:largeCategoryontionCode,
	             success:function(json){
	               if(json.length > 0) { 
	                     reviewDivR = '<div class="tab-pane fade text-left active show" role="tabpanel" aria-labelledby="regDate-tab" id="regDates">'+
									  "<div class='row'><div class='col-md-12'>";
	                     reviewDivS = '<div class="tab-pane fade text-left" id="LSTAR" role="tabpanel" aria-labelledby="STAR-tab">'+
	                               "<div class='row'><div class='col-md-12'>";
	                     reviewDivs = '<div class="tab-pane fade text-left" id="starss" role="tabpanel" aria-labelledby="starS-tab">'+
	                               "<div class='row'><div class='col-md-12'>";

						$.each(json, function(entryIndex, item){
	                        
						  reviewCnt = item.reviewCnt;
		                  if(reviewCnt>0 && reviewCnt!=0){
		                     reviewHeadDiv = "<h2 class='heading text-white'>REVIEW</h2>"
		                                 +"<h3 class='text-white'>"+reviewCnt+"개의 후기</h3>";
		                       $("#reviewHeadDiv").html(reviewHeadDiv);
	                         }

		                  if(reviewCnt==0){
		                     reviewHeadDiv = "<h2 class='heading text-white'>REVIEW</h2>"
		                                 +"<h3 class='text-white'>아직 후기가 없습니다.</h3>";
		                       $("#reviewHeadDiv").html(reviewHeadDiv);
		                  }   
			                  
						  
                          RnickName     =item.RnickName;
                          RproductName  =item.RproductName;
                          Rpicture      =item.Rpicture;
                          Rtitle        =item.Rtitle;
                          Rcontent      =item.Rcontent;
                          Rstar         =item.Rstar;
                          RfileName     =item.RfileName;
                          Rregdate      =item.Rregdate;

                          SnickName     =item.SnickName;
                          SproductName  =item.SproductName;
                          Spicture      =item.Spicture;
                          Stitle        =item.Stitle;
                          Scontent      =item.Scontent;
                          Sstar         =item.Sstar;
                          SfileName     =item.SfileName;
                          Sregdate      =item.Sregdate;
                        
                          snickName     =item.snickName;
                          sproductName  =item.sproductName;
                          spicture      =item.spicture;
                          stitle        =item.stitle;
                          scontent      =item.scontent;
                          sstar         =item.sstar;
                          sfileName     =item.sfileName;
                          sregdate      =item.sregdate;
                          
                          
                          if(RnickName != null && RnickName.length > 0) {
                           reviewDivR += ' <div class="food-menu mb-5 row">';
                           reviewDivR += '   <div class="col-md-2" style="padding-left: 30px;">';
                           reviewDivR += '	   	<img src="/god/resources/images/member/'+Rpicture+'" style="width: 100px; border-radius: 100px; height: 100px; ">';
                           reviewDivR += '	   	<span class="d-block text-primary h4 " style="width: 100px;margin-top: 10px;text-align: center;">'+RnickName+'</span>';
                           reviewDivR += '	   	<span style="text-align: center; width: 100px;" class="d-block ">'+Rregdate+'</span>';
                           reviewDivR += ' 	</div>';
                           reviewDivR += '	<div class="col-md-10">';
                           
                           // 별찍기(보라수정)////////////////////////////////////////////////////////////////////////////
                           reviewDivR += '<p class="mgb0">';
                           reviewDivR += '<span class="starAreaIn">';
                           reviewDivR += '<span class="starAreaOut" style="width: '+(Rstar*14.6)+'px;"><span class="blind">star</span></span>';
                           reviewDivR += '</span>';
                           if(Rstar != null) {
						       reviewDivR += '<span style="font-size: 10pt;">'+Rstar+'점</span>';
                           }
                           else {
                        	   reviewDivR += '<span style="font-size: 10pt;">0점</span>';
                           }
                           reviewDivR += '</p>';
                           
                           reviewDivR += '		<h3 class="text-white"><a href="#" class="text-white">'+Rtitle+'</a></h3>';
                           reviewDivR += '		<p class="text-white text-opacity-7">'+Rcontent+'</p>'; 
                           reviewDivR += '		<div>';
						   //////////////////////////////////////////////////////////////////////////////
                           
                           if(RfileName != null && RfileName.length > 0) {
                            reviewImg = RfileName.split(",");
                            for(i in reviewImg){
                             reviewDivR += '			<img src="/god/resources/images/review/'+reviewImg[i]+'" style="height: 70px; width: 70px; margin: 10px;">';
                            				
                            }
                           }
                           
                           reviewDivR += '		</div>';
                           reviewDivR += '	</div>';
                           reviewDivR += '	</div>';
                          }
                          
                          if(SnickName != null && SnickName.length > 0) {
                           reviewDivS += ' <div class="food-menu mb-5 row">';
                           reviewDivS += '   <div class="col-md-2" style="padding-left: 30px;">';
                           reviewDivS += '	   	<img src="/god/resources/images/member/'+Spicture+'" style="width: 100px; border-radius: 100px; height: 100px; ">';
                           reviewDivS += '	   	<span class="d-block text-primary h4 " style="width: 100px;margin-top: 10px;text-align: center;">'+SnickName+'</span>';
                           reviewDivS += '	   	<span style="text-align: center; width: 100px;" class="d-block ">'+Sregdate+'</span>';
                           reviewDivS += ' 	</div>';
                           reviewDivS += '	<div class="col-md-10">';
                           reviewDivS += '		<h3 class="text-white"><a href="#" class="text-white">'+Stitle+'</a></h3>';
                           reviewDivS += '		<p class="text-white text-opacity-7">'+Scontent+'</p>'; 
                           reviewDivS += '		<div>';
                           
                           if(SfileName != null && SfileName.length > 0) {
                            reviewImg = SfileName.split(",");
                            for(i in reviewImg){
                             reviewDivS += '			<img src="/god/resources/images/review/'+reviewImg[i]+'" style="height: 70px; width: 70px; margin: 10px;">';
                            }
                           }
                           
                           reviewDivS += '		</div>';
                           reviewDivS += '	</div>';
                           reviewDivS += '	</div>';
                          }
                          
                          if(snickName != null && snickName.length > 0) {
                           reviewDivs += ' <div class="food-menu mb-5 row">';
                           reviewDivs += '   <div class="col-md-2" style="padding-left: 30px;">';
                           reviewDivs += '	   	<img src="/god/resources/images/member/'+spicture+'" style="width: 100px; border-radius: 100px; height: 100px; ">';
                           reviewDivs += '	   	<span class="d-block text-primary h4 " style="width: 100px;margin-top: 10px;text-align: center;">'+snickName+'</span>';
                           reviewDivs += '	   	<span style="text-align: center; width: 100px;" class="d-block ">'+sregdate+'</span>';
                           reviewDivs += ' 	</div>';
                           reviewDivs += '	<div class="col-md-10">';
                           reviewDivs += '		<h3 class="text-white"><a href="#" class="text-white">'+stitle+'</a></h3>';
                           reviewDivs += '		<p class="text-white text-opacity-7">'+scontent+'</p>'; 
                           reviewDivs += '		<div>';

                           if(sfileName != null && sfileName.length > 0) {
                            reviewImg = sfileName.split(",");
                            for(i in reviewImg){
                             reviewDivs += '			<img src="/god/resources/images/review/'+reviewImg[i]+'" style="height: 70px; width: 70px; margin: 10px;">';
                            }
                           }

                           reviewDivs += '		</div>';
                           reviewDivs += '	</div>';
                           reviewDivs += '	</div>';
                          }
                         
	                     });
	                  
	                  reviewDivR+="</div></div></div>";
	                  reviewDivS+="</div></div></div>";
	                  reviewDivs+="</div></div></div>";
	                    
	                  reviewDiv=reviewDivR+reviewDivS+reviewDivs;
	                    $("#reviewDiv").html(reviewDiv);
	               }   
	             },
	             error: function(request, status, error){
	                alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
	             }
	          });
	   
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
geocoder.addressSearch('${HotelVO.address}', function(result, status) {
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
    
   
      ///////////////////////////////////////////////////////////////////////////////////
    
<%--    
      
   function goSearch() {
      var frm = document.infoSearchFrm;
      frm.method = "GET";
      frm.action = "<%=request.getContextPath()%>/list.go";
      //   frm.submit();
   } --%>
   
   function goSearchRoom(searchTypeVal) {
   
      
   
      $.ajax({
         url:"<%=request.getContextPath()%>/reviewjson.action",
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
   
   function goSearch() {
      frm =document.returnFrm;
      
      frm.method = "GET";
       frm.action = "/god/product2.go";
        frm.submit();
   }
   
   function goView(productId,productName,roomType2,roomType3,weekPrice) {
      
      var checkin_date = $("#checkin_date").val();
      var checkout_date = $("#checkout_date").val();   

      
      if (checkin_date.trim()=="") {
         $("#checkin_date").val("");1
         alert("시작일을 선택해주세요.");
         $("input#checkin_date").focus();
         return;
      }
      
      else if (checkout_date.trim()=="") {
         $("#checkout_date").val("");
         alert("종료일을 선택해주세요.");
            $("input#checkout_date").focus();
          return;
          

   }
      

       var frm = document.goViewFrm;      
       frm.productId.value = productId;
       frm.productName.value = productName;
       frm.roomType2.value = roomType2;
       frm.roomType3.value = roomType3;
       frm.weekPrice.value = weekPrice;
       frm.method = "POST";
       frm.action = "<%=request.getContextPath()%>/accommodationInfo.go";
       frm.submit();
      
   }
   
   

      
     
   // 이미지 split
   /* 
    var imgString = '${hotelroomvo.picture}';
     var imgSplit = jbString.split(',');
     for ( var i in imgSplit ) {
       document.write( '<a>' + imgSplit[i] + '</a>' );
     }
 */
   
    </script>
<section class="site-hero inner-page overlay" style="background-image: url(<%=ctxPath%>/resources/images/hero_4.jpg)" data-stellar-background-ratio="0.5">
	<div class="container">
		<div
			class="row site-hero-inner justify-content-center align-items-center">
			<div class="col-md-10 text-center" data-aos="fade">
				<h1 class="heading mb-3">Contact</h1>
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

			<c:if test="${HotelVO!=null}">
				<div
					class="col-md-12 col-lg-7 ml-auto order-lg-2 position-relative mb-5  ">
					<img
						src="http://file.mk.co.kr/meet/neds/2016/02/image_readtop_2016_120257_14554975042357349.jpg"
						alt="Image" class="img-fluid rounded">
				</div>
				<div class="col-md-12 col-lg-4 order-lg-1 aos-init aos-animate"
					data-aos="fade-up">
					<h2 class="heading">${HotelVO.name}</h2>
					<p>${HotelVO.address}</p>

					<p class="mb-4">${HotelVO.info}</p>
					<p class="mb-4">${HotelVO.ontionType}</p>
					<p class="mb-4">문의 : ${HotelVO.businessTel}</p>


					<p>
						<a href="#" class="btn btn-primary text-white py-2 mr-3">찜하기</a> <span
							class="mr-3 font-family-serif"> <!-- <em>or</em></span> <a href="https://vimeo.com/channels/staffpicks/93951774" data-fancybox="" class="text-uppercase letter-spacing-1">See video</a></p> -->
				</div>
			</c:if>
		</div>
	</div>
</section>

<section class="section pb-4" style="margin-top: 100px;">
	<div class="container">

		<div class="row check-availabilty" id="next">
			<div class="block-32">
				<form name="returnFrm">
					<input type="hidden" name="largeCategoryontionCode"
						value="${largeCategoryontionCode}">
					<div class="row">
						<div class="col-md-6 mb-3 mb-lg-0 col-lg-3">
							<label for="checkin_date" class="font-weight-bold text-black">Check
								In</label>
							<div class="field-icon-wrap">
								<div class="icon">
									<span class="icon-calendar"></span>
								</div>
								<input value="${checkin_date}" type="text" id="checkin_date"
									name="checkin_date" autocomplete="off" class="form-control">
							</div>
						</div>
						<div class="col-md-6 mb-3 mb-lg-0 col-lg-3">
							<label for="checkout_date" class="font-weight-bold text-black">Check
								Out</label>
							<div class="field-icon-wrap">
								<div class="icon">
									<span class="icon-calendar"></span>
								</div>
								<input value="${checkout_date}" type="text" id="checkout_date"
									name="checkout_date" class="form-control" autocomplete="off">
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
										<select name="adult" id="searchType adults"
											class="form-control">
											<c:if test="${adult!=null and adult!=''}">
												<c:forEach var="i" begin="1" end="4">
													<c:if test="${adult==i}">
														<option value="${i}" selected>${i}</option>
													</c:if>
													<c:if test="${adult!=i}">
														<option value="${i}">${i}</option>
													</c:if>
												</c:forEach>
											</c:if>
											<c:if test="${adult==null or adult==''}">
												<option value="1" selected>1</option>
												<option value="2">2</option>
												<option value="3">3</option>
												<option value="4">4+</option>
											</c:if>

										</select>
									</div>
								</div>
								<div class="col-md-6 mb-3 mb-md-0">
									<label for="searchType children"
										class="font-weight-bold text-black">Children</label>
									<div class="field-icon-wrap">
										<div class="icon">
											<span class="ion-ios-arrow-down"></span>
										</div>
										<select name="children" id="searchType children"
											class="form-control">
											<c:if test="${children!=null and children!=''}">
												<c:forEach var="i" begin="0" end="3">
													<c:if test="${children==i}">
														<option value="${i}" selected>${i}</option>
													</c:if>
													<c:if test="${children!=i}">
														<option value="${i}">${i}</option>
													</c:if>
												</c:forEach>
											</c:if>
											<c:if test="${children==null or children==''}">
												<option value="0" selected>0</option>
												<option value="1">1</option>
												<option value="2">2</option>
												<option value="3">3</option>
											</c:if>



										</select>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-6 col-lg-3 align-self-end">
							<button class="btn btn-primary btn-block text-white"
								onclick="goSearch()">검색</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</section>

<!-- END section -->
<section class="section bg-light">
	<c:if test="${RoomVO!=null}">
		<!-- 객실 뽑을 for문 -->
		<c:forEach var="RoomVO" items="${RoomVO}">
			<div class="site-block-half d-block d-lg-flex bg-white  ">
				<c:if test="${RoomVO.imgList!=null}">
					<c:forEach var="list" items="${RoomVO.imgList}">
						<a href="#" class="image d-block bg-image-2"
							style="background-image: url('/god/resources/images/room/${list}');"></a>
					</c:forEach>
				</c:if>

				<%-- 
            <div class="row">
				<div class="col-md-12">
				
					<div class="home-slider major-caousel owl-carousel mb-5 owl-loaded owl-drag aos-init aos-animate" data-aos="fade-up" data-aos-delay="200">
					
					<div class="owl-stage-outer">
						<div class="owl-stage" style="transform: translate3d(-6720px, 0px, 0px); transition: all 0s ease 0s; width: 16800px;">
							<div class="owl-item cloned" style="width: 1110px; margin-right: 10px;">
								<div class="slider-item">
									<a class="image d-block bg-image-2" href="/god/resources/images/room/${list}" data-fancybox="images" data-caption="Caption for this image" style="background-image: url('/god/resources/images/room/${list}');"></a>
								</div>
							</div>
						</div>
					</div>
					
					<div class="owl-item" style="width: 1110px; margin-right: 10px;">
						<div class="slider-item">
							<a href="images/slider-1.jpg" data-fancybox="images" data-caption="Caption for this image">
							<img src="images/slider-1.jpg" alt="Image placeholder" class="img-fluid">
							</a>
						</div>
					</div>
						
					<div class="owl-item cloned" style="width: 1110px; margin-right: 10px;"><div class="slider-item">
						<a href="images/slider-1.jpg" data-fancybox="images" data-caption="Caption for this image"><img src="images/slider-1.jpg" alt="Image placeholder" class="img-fluid"></a>
						</div>
						</div>
					</div>
					
				</div>
				<div class="owl-nav">
					<button role="presentation" class="owl-prev"><span class="ion-chevron-left"></span></button>
					<button role="presentation" class="owl-next"><span class="ion-chevron-right"></span></button>
				</div>
			</div> --%>
				<!-- END slider -->



				<div class="text">
					<h5 class="mb-4" style="font-size: 25px;">${RoomVO.productName}</h5>
					<span class="d-block mb-4"> <span
						class="text-uppercase letter-spacing-2">주중가 : </span> <span
						class="display-4 text-primary">${RoomVO.weekPrice} ~</span> <span
						class="text-uppercase letter-spacing-2">/ per night</span>
					</span> <span class="d-block mb-4"><span
						class="text-uppercase letter-spacing-2">주말가 : </span> <span
						class="display-4 text-primary">${RoomVO.weekenPrice} ~</span> <span
						class="text-uppercase letter-spacing-2">/ per night</span> </span>
					<h5 class="mb-4">침대갯수 : ${RoomVO.roomType.substring(1,2)}개 /
						수용인원 : ${RoomVO.roomType.substring(2)}명</h5>
					<p class="mb-4">${RoomVO.roomInfo}</p>
					<p>
						<a href="#" class="btn btn-primary text-white" id="btnReserve"
							onclick="goView('${RoomVO.productId}','${RoomVO.productName}','${RoomVO.roomType.substring(1,2)}','${RoomVO.roomType.substring(2)}','${RoomVO.weekPrice}')"
							style="cursor: pointer;">예약하기</a>
					</p>
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
				<div id="map" style="width: 790px; height: 500px; margin: 0 auto;"></div>
			</div>
		</div>

	</div>
</section>

<!-- 탭섹션(보라수정) 시작 -->
<section class="section" style="background-color: #000;">
<!-- 탭섹션(보라수정) 끝 -->
	<div class="container">
		<div class="row justify-content-center text-center mb-5">
			<div class="col-md-7" id="reviewHeadDiv"></div>
		</div>
		<div class="food-menu-tabs aos-init aos-animate" data-aos="fade">
			<!-- Ajax로 최신순 별점순 등등으로 정렬조회 -->
			<ul class="nav nav-tabs mb-5" id="myTab" role="tablist">
				<li class="nav-item"><a
					class="nav-link letter-spacing-2 active show" data-toggle="tab"
					href="#regDates" role="tab" aria-controls="regDate"
					aria-selected="true" id="regDate-tab">regDate</a></li>
				<li class="nav-item"><a class="nav-link letter-spacing-2"
					id="STAR-tab" data-toggle="tab" href="#LSTAR" role="tab"
					aria-controls="STAR" aria-selected="false">STAR</a></li>
				<li class="nav-item"><a class="nav-link letter-spacing-2"
					id="starS-tab" data-toggle="tab" href="#starss" role="tab"
					aria-controls="starS" aria-selected="false">starS</a></li>
			</ul>
			<div class="tab-content py-5" id="reviewDiv">

				<!-- ajax -->

			</div>

		</div>
	</div>

	<!-- 호텔정보 보내기(체크인&체크아웃은 RoomVO임)  -->
	<form name="goViewFrm">
		<input type="hidden" name=""
			value="${HotelVO.largeCategoryontionCode}" /> <input type="hidden"
			name="productId" value="" /> <input type="hidden" name="img"
			value="${HotelVO.img}" /> <input type="hidden" name="name"
			value="${HotelVO.name}" /> <input type="hidden" name="address"
			value="${HotelVO.address}" /> <input type="hidden" name="checkIn"
			value="${checkin_date}" /> <input type="hidden" name="checkOut"
			value="${checkout_date}" /> <input type="hidden" name="productName"
			value="" /> <input type="hidden" name="roomType2" value="" />
		<!-- 침대갯수 -->
		<input type="hidden" name="roomType3" value="" />
		<!-- 수용인원 -->
		<input type="hidden" name="weekPrice" value="" />
	</form>



</section>