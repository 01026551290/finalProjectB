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
      /* 
      #floatMenu {
	position: absolute;
	width: 200px;
	height: 200px;
	left: 250px;
	top: 10px;
 	background-color: #606060; 
	color: #fff;
*/

	
	.clear {
	  clear: both;
	}
	
	.from-me {
	  padding: 10px 20px;
	  color: white;
	  background: #ffaa34;
	  border-radius: 25px;
	  margin-left: 50px;	  
	}

	.from-them {
	  padding: 10px 20px;
	  background: #E5E5EA;
	  border-radius: 25px;
	  color: black;
	  margin-right: 50px;
	  margin-top: 30px;
	}
	
	

} 
</style>
 <script type="text/javascript">
   map = null;
   
   $(document).ready(function(){
      
/* 
		// 기존 css에서 플로팅 배너 위치(top)값을 가져와 저장한다.
		var floatPosition = parseInt($("#floatMenu").css('top'));
		// 250px 이런식으로 가져오므로 여기서 숫자만 가져온다. parseInt( 값 );

		$(window).scroll(function() {
			// 현재 스크롤 위치를 가져온다.
			var scrollTop = $(window).scrollTop();
			var newPosition = scrollTop + floatPosition + "px";

			 애니메이션 없이 바로 따라감
			 $("#floatMenu").css('top', newPosition);

			$("#floatMenu").stop().animate({
				"top" : newPosition
			}, 500);

		}).scroll();
	   */ 
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
        
        
        
   });//document.ready

  
       
</script> 
    
<section class="site-hero inner-page overlay" style="background-image: url(/god/resources/images/hero_4.jpg;); background-position: 0% 0px;" data-stellar-background-ratio="0.5">
  <div class="container">
    <div class="row site-hero-inner justify-content-center align-items-center">
      <div class="col-md-10 text-center aos-init aos-animate" data-aos="fade">
        <h1 class="heading mb-3">History</h1>
        <ul class="custom-breadcrumbs mb-4">
          <li><a href="index.html">Home</a></li>
          <li>•</li>
          <li>History</li>
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

<img src="/god/resources/imgages/romm/">
    <section class="section bg-light">
    
    
      <div class="container">
         <div class="row">
	    <div class="col-md-4 col-sm-5" id="floatMenu">
	           <div class="map_wrap">
	              <div id="map" style="width:480px;height:740px; margin: 0 auto;" class="block-32 aos-init aos-animate"></div>
	           </div>
	    </div>
       <div class="col-md-8 aos-animate col-sm-7">       
            <div class="row justify-content-center text-center mb-5">
          <div class="col-md-7 mb-5">
            <h2 class="heading aos-init aos-animate" data-aos="fade">History</h2>
          </div>
        </div>

        <div class="row justify-content-center">
          <div class="col-md-8">
		<c:if test="${hvo!=null }">
		<c:forEach var="vo" items="${hvo}">
            <div class="timeline-item aos-init" date-is="${vo.checkIn}-${vo.checkOut} / ${vo.noNight}일" data-aos="fade">
              <h3 >${vo.name}&nbsp;/&nbsp;${vo.productName}</h3>
              <p>${vo.address}</p>
              <p>${vo.info}</p>
              <c:if test="${vo.title!=null}">
               <div class="from-me">
	              <p>${vo.star}</p>
	              <p>${vo.title}</p>
	              <p>${vo.content}</p>
			   </div>
			   <div class="clear"></div>
			   <div class="from-them">
				   <p>저희 ${vo.name}을 이용해주셔서 감사합니다.</p>
			   </div>
			   <div class="clear"></div>
              </c:if>
            </div>		
		</c:forEach>
		</c:if>
          </div>
        </div>
      </div>
   </div>         
</div>
</section> 