<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%	String ctxPath = request.getContextPath();%>
<script type="text/javascript">
   map = null;
   
   $(document).ready(function(){
      
      var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
       mapOption = {
           center: new kakao.maps.LatLng(33.381788, 126.544377), // 지도의 중심좌표
           level: 10 // 지도의 확대 레벨
       };  
      
      var map = new kakao.maps.Map(mapContainer, mapOption); 
      var geocoder = new kakao.maps.services.Geocoder();

      
      $.ajax({
         url:"<%= ctxPath%>/searchRoomMap.go",
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
                          '                <img src="<%= ctxPath%>/resources/images/hotel/'+img+'" width="73" height="70">' +
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

<style>


.starAreaIn {
	background: url(. . <%=request.getContextPath()%>/resources/images/star_bgb.png);
	background-size: 15px 14px;
	display: inline-flex;
	width: 76px;
	height: 14px;
}

.starAreaOut {
	background: url(. . <%=request.getContextPath()%>/resources/images/star_bg.png);
	background-size: 15px 14px;
	display: inline-block;
	width: 76px;
	height: 14px;
}

</style>

<section class="site-hero inner-page overlay" style="background-image: url(<%= ctxPath%>/resources/images/hero_4.jpg;); background-position: 0% 0px;" data-stellar-background-ratio="0.5">
	<div class="container">
		<div
			class="row site-hero-inner justify-content-center align-items-center">
			<div class="col-md-10 text-center aos-init aos-animate" data-aos="fade">
				<h1 class="heading mb-3">History</h1>
			</div>
		</div>
	</div>

	<a class="mouse smoothscroll" href="#next">
		<div class="mouse-icon">
			<span class="mouse-wheel"></span>
		</div>
	</a>
</section>

<section class="section bg-light">


	<div class="container">
		<div class="row">
			<div class="col-md-6 mb-5" id="floatMenu">
				<div class="map_wrap">
					<div id="map" style="height: 540px; margin: 0 auto;" class="block-32"></div>
				</div>
			</div>
			<div class="col-md-6 col-sm-12 aos-animate">
				<div class="row justify-content-center text-center">
					<div class="col-md-7 mb-5">
						<h2 class="heading aos-init aos-animate" data-aos="fade">History</h2>
					</div>
				</div>

				<div class="row justify-content-center">
					<div class="col-md-12">
					<c:if test="${hvo!=null }">
						<c:forEach var="vo" items="${hvo}">
							<div class="timeline-item aos-init" date-is="${vo.checkIn}-${vo.checkOut} / ${vo.noNight}일" data-aos="fade">
								<h3>${vo.name}&nbsp;/&nbsp;${vo.productName}</h3>
								<p>${vo.address}</p>
								<p>${vo.info}</p>
								<c:if test="${vo.title!=null}">
									<div class="from-me">
										<p>
										<span class="starAreaIn"> 
											<span class="starAreaOut"style="width: ${vo.star*14.6}px;">
												<span class="blind">star</span>
											</span>
										</span>
										<span style="font-size: 10pt;">${vo.star}점</span>
										</p>
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
