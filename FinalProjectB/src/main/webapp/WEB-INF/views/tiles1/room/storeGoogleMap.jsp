<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String ctxPath = request.getContextPath(); %>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script type="text/javascript" src="<%=ctxPath%>/resources/js/jquery-1.12.4.min.js"></script> 
<%-- jquery 1.x 또는 jquery 2.x 를 사용해야만 한다. 구글맵은 jquery 3.x 을 사용할 수 없다.   --%>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<%-- 구글맵 api 사용하기  --%>
<script src="http://maps.googleapis.com/maps/api/js?key=AIzaSyDDQx9Q_JsWUjWyssoeEaeBGSbhvGcTyrA"></script>

<style>
	#div_name {
		width: 70%;
		height: 15%;
		margin-bottom: 5%;
		margin-left: 10%;
		position: relative;
	}
	
	#div_mobile {
		width: 70%;
		height: 15%;
		margin-bottom: 5%;
		margin-left: 10%;
		position: relative;
	}
	
	#div_findResult {
		width: 70%;
		height: 15%;
		margin-bottom: 5%;
		margin-left: 10%;		
		position: relative;
	}
	
	#div_btnFind {
		width: 70%;
		height: 15%;
		margin-bottom: 5%;
		margin-left: 10%;
		position: relative;
	}
	
</style>
<script type="text/javascript">
	$(document).ready(function(){
		google.maps.event.addDomListener(window,'load',initialize);
		
	});
	
	function googleSearch(){
		<%-- $.ajax({
			url: "<%= request.getContextPath() %>/googleSearch.action",
			type: "GET",
			dataType: "XML",
			success: function(xml){
					var rootElement = $(xml).find(":root");
				    console.log($(rootElement).prop("tagName"));   
				    /* // ==> current
									   
				    var weather = $(rootElement).find("weather");
				    console.log( $(weather).attr("year") +"년 " + $(weather).attr("month") + "월 " + $(weather).attr("day") + "일 " + $(weather).attr("hour") + "시" );        
					// 2019년 01월 20일 22시
					
					var updateTime = $(weather).attr("year") +"년 " + $(weather).attr("month") + "월 " + $(weather).attr("day") + "일 " + $(weather).attr("hour") + "시";
					
				    var localArr = $(rootElement).find("local");
					console.log(localArr.length); 
					// 95
				
					var html = "업데이트 : <span style='font-weight:bold;'>"+updateTime+"</span>&nbsp;";
					    html += "<span style='color:blue; cursor:pointer;' onClick='javascript:showWeather();'>업데이트</span><br/>";
					    html += "<table class='table table-hover' align='center'>";
						html += "<tr>";
						html += "<th>지역</th>";
						html += "<th>날씨</th>";
						html += "<th>기온</th>";
						html += "<th>귀엽</th>";
						html += "</tr>";
					
				    for(var i=0; i<localArr.length; i++) {
				    	var local = $(localArr).eq(i);  
				    	if($(local).attr("stn_id")=='184'||$(local).attr("stn_id")=='189'){
				    		
						   /* .eq(index) 는 선택된 요소들을 인덱스 번호로 찾을 수 있는 선택자이다. 
						            마치 배열의 인덱스(index)로 값(value)를 찾는 것과 같은 효과를 낸다.
						   */
						   console.log($(local).text() + " stn_id:" + $(local).attr("stn_id") + " icon:" + $(local).attr("icon") + " desc:" + $(local).attr("desc") + " ta:" + $(local).attr("ta") );
				           // 속초 stn_id:90 icon:01 desc:맑음 ta:-0.7
				           // 북춘천 stn_id:93 icon:01 desc:맑음 ta:-5.7
				           // .......
						   
				           html += "<tr>";
				           html += "<td>"+$(local).text()+"</td><td>"+$(local).attr("desc")+"</td><td>"+$(local).attr("ta")+"</td>";
				           html += '<td><img src="http://www.kma.go.kr/images/icon/NW/NB'+$(local).attr("icon")+'.png"></td>'
				           html += "</tr>";
				    	}
				    }
					
				    html += "</table>";
				    
				    $("#displayWeather").html(html); */
				    
				}, // end of success: function(xml)-----------------------------

				error: function(request, status, error){
					alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
				}	
			}); --%>
	}

	function initialize() {
		
		// 웹페이지에 접속한 사용자의 현재 위치를 확인하여 그 위치(위도,경도)를 지도의 중앙에 오도록 한다.
		navigator.geolocation.getCurrentPosition(function(position) {
			var latitude = position.coords.latitude;   //위도
			var longitude = position.coords.longitude; //경도
	
			//////////////////////////////////////////////////////////////////////////
			var mapOptions = { 
		        zoom : 14, // 기본 확대율
		    //  center : new google.maps.LatLng(48.860545, 2.337890),   // 지도 중앙 위치
		        center : new google.maps.LatLng(latitude, longitude),   // 지도 중앙 위치
		        disableDefaultUI : false,  // 기본 UI 비활성화 여부
		        scrollwheel : true,        // 마우스 휠로 확대, 축소 사용 여부
		        zoomControl : true,        // 지도의 확대/축소 수준을 변경하는 데 사용되는 "+"와 "-" 버튼을 표시
		        mapTypeControl : true,     // 지도 유형 컨트롤은 드롭다운이나 가로 버튼 막대 스타일로 제공되며, 사용자가 지도 유형(ROADMAP, SATELLITE, HYBRID 또는 TERRAIN)을 선택할 수 있다. 이 컨트롤은 기본적으로 지도의 왼쪽 위 모서리에 나타난다.
		        streetViewControl : true,  // 스트리트 뷰 컨트롤에는 지도로 드래그해서 스트리트 뷰를 활성화할 수 있는 펙맨 아이콘이 있다. 기본적으로 이 컨트롤은 지도의 오른쪽 아래 근처에 나타난다.
		        scaleControl: true,        // 배율 컨트롤은 지도 배율 요소를 표시한다. 이 컨트롤은 기본적으로 비활성화되어 있다.
		    };
			
		    // 구글맵 옵션내역 사이트 아래 참조 
		    // https://developers.google.com/maps/documentation/javascript/reference#MapOptions
		 
		    var targetmap = new google.maps.Map(document.getElementById('googleMap'), mapOptions);  
			// 구글 맵을 사용할 타겟
			// !!! 주의 !!!  document.getElementById('googleMap') 라고 해야지
			//              $("#googleMap") 이라고 하면 지도가 나타나지 않는다.
		    
		    google.maps.event.addDomListener(window, "resize", function() {
		        var center = targetmap.getCenter();
		        google.maps.event.trigger(targetmap, "resize");
		        targetmap.setCenter(center); 
		    });

<%--		    
          	생성되어질 마커들은 아래처럼 배열형태로 만들어 주어야 한다.	
	
		    var storeArr = [
				[storeNameArr[0], latitudeArr[0], longitudeArr[0], zindexArr[0]],   //  첫번째마커에 마우스가 오버되면 보여줄 타이틀, 첫번째마커 위도값, 첫번째마커 경도값, 우선순위(z-index)
				[storeNameArr[1], latitudeArr[1], longitudeArr[1], zindexArr[1]],   //  두번째마커에 마우스가 오버되면 보여줄 타이틀, 두번째마커 위도값, 두번째마커 경도값, 우선순위(z-index)
				[storeNameArr[2], latitudeArr[2], longitudeArr[2], zindexArr[2]]    //  세번째마커에 마우스가 오버되면 보여줄 타이틀, 세번째마커 위도값, 세번째마커 경도값, 우선순위(z-index)
			];
	
			// z-index 속성으로 요소 표시 순서 변경하기 참조사이트
			// http://html5dev.tistory.com/626
		    
			// z-index 속성은 position 속성과 관계가 있는 것으로서 요소가 겹쳐져 있을 때 우선순위를 지정하는 속성이다. 
			// position 속성(static; absolute; relative; fixed;)으로 요소 배치를 변경할 경우,  
			// 여러개의 요소가 겹쳐져 있다라면 일반적으로 나중에 추가한 요소가 앞에 보여지지만
			// z-index 를 사용하면 우선순위를 지정하여 뒤에 있는 요소를 앞으로 재배치할 수 있다.
			// 이때 z-index 번호의 값이 클수록 앞에 보여지게 된다.

--%>			
			var storeArr = [
					     	<c:set var="cnt" value="1" />
					     	<c:forEach var="storemapvo" items="${storemapList}" varStatus="status">					
					     	   ["${storemapvo.storeName}","${storemapvo.latitude}","${storemapvo.longitude}","${storemapvo.zindex}"]      
					           <c:if test="${cnt < storemapList.size()}">
					           ,
					           </c:if>
					           <c:set var="cnt" value="${cnt + 1}" />   // 변수 cnt 를 1씩 증가
					        </c:forEach>
				           ];
				
			setMarkers(targetmap, storeArr);
	
		}); // end of navigator.geolocation.getCurrentPosition(function(position){ })---------------
	
	} // end of function initialize()--------------------------------
	
	
	var markerArr;  // 전역변수로 사용됨.
		
	function setMarkers(targetmap, storeArr){
		    
		markerArr = new Array(storeArr.length);
			
		for(var i=0; i < storeArr.length; i++) {
			var store = storeArr[i];
			//  console.log(store[0]);  // 점포명  ${storevo.storeName} 출력하기
				
			var myLatLng = new google.maps.LatLng(Number(store[1]), Number(store[2]));  
			                                   // Number() 함수를 꼭 사용해야 함을 잊지 말자. 위도,경도 
				
			if(i == 0) {
			    var image = "<%= request.getContextPath() %>/images/pointerBlue.png";  // 1번 마커 이미지 	
		//		var image = "http://hso.newsk.com/Library/icon/17.gif";  // 1번 마커 이미지	
			} 
			else if(i == 1) {
 				var image = "<%= request.getContextPath() %>/images/pointerPink.png"; // 2번 마커 이미지
		//		var image = "https://cdn.pixabay.com/photo/2016/03/23/04/57/cat-1274094_960_720.png"; // 2번 마커 이미지
			}
			else {
				var image = "<%= request.getContextPath() %>/images/pointerGreen.png"; // 3번 마커 이미지
			}
		    
				
		    // *** 마커 설정하기 *** //
			markerArr[i] = new google.maps.Marker({  
				position: myLatLng,        // 마커 위치
				map: targetmap,
				icon : image,              // 마커 이미지
				title : store[0],          // 위에서 정의한 "${store.storeName}" 임
				zIndex : Number(store[3])  // 위에서 정의한 "${storevo.zindex}" 임.  Number() 함수를 꼭 사용해야 함을 잊지 말자.
			});
			
			// **** 마커를 클릭했을때 어떤 동작이 발생하도록 하는 함수 호출하기 ****//   
			markerListener(targetmap, markerArr[i]);
				
		} // end of for------------------------------	
			
	}// end of setMarkers(map, locations)--------------------------
	 
		
///////////////////////////////////////////////////////////////////////////////////////

    var infowindowArr = new Array();  // 풍선창(풍선윈도우) 여러개를 배열로 저장하기 위한 용도 
        
 // **** 마커를 클릭했을때 어떤 동작이 발생하도록 하는 함수 생성하기 ****// 
	function markerListener(targetmap, marker){      
	
		// 확인용
		// console.log(marker.zIndex);	//  1  2  3 
	
		// === 풍선창(풍선윈도우)만들기 ===
		var infowindow = new google.maps.InfoWindow(  
				{// content: '안녕하세요~', 
				 // content: marker.title,	
				    content: viewContent('<div><div><div class="_8vx112f"><div class="_y89bwt"><div class="_1dp4576"><div aria-hidden="false" class="_e296pg"><div class="_e296pg"><div class="_13ky0r6y" style="padding-top: 66.6667%; background: rgb(216, 216, 216);"><div class="_1szwzht"><a href="/rooms/9689874?location=Paris&amp;previous_page_section_name=1001" target="listing_9689874" aria-hidden="true" tabindex="-1"><span class="_krjbj">Nice private room</span><div class="_qptau"><div class="_yydl86"><div class="_1na7kj9b"><div class="_e296pg" style="width: 100%; height: 100%;"><div class="_1df8dftk" role="img" aria-label="Nice private room" style="width: 100%; height: 100%; background-image: url(data:image/jpeg;base64,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);"></div></div></div></div></div></a><div class="_17bbo57"><div class="_189umuy"><div class="_14hndxaq" style="transform: scale(1); width: 18px; opacity: 1;"></div><div class="_1qellvc4" style="transform: scale(1); width: 16px; opacity: 1;"></div><div class="_1qellvc4" style="transform: scale(1); width: 16px; opacity: 1;"></div></div></div></div></div><div class="_1r8d33l9" aria-hidden="false"><div class="_tk908t"><button type="button" aria-label="Nice private room, 이전 이미지" class="_4fditnk"><div class="_n0qiwy"></div></button><button type="button" aria-label="Nice private room, 다음 이미지" class="_1imd680n"><div class="_grtzc2"></div></button></div></div></div><div class="_1j1huff"><div class="_zjunba"><div></div><div><div class="_k1g2qh"><button type="button" class="_1rp5252" id="9689874" aria-busy="false" style="padding: 8px; margin: -8px;"><svg viewBox="0 0 24 24" fill="#484848" fill-opacity="0.5" stroke="#ffffff" stroke-width="2" focusable="false" aria-label="목록에 숙소 추가하기" role="img" stroke-linecap="round" stroke-linejoin="round" style="height: 28px; width: 28px; display: block; overflow: visible;"><path d="m17.5 2.9c-2.1 0-4.1 1.3-5.4 2.8-1.6-1.6-3.8-3.2-6.2-2.7-1.5.2-2.9 1.2-3.6 2.6-2.3 4.1 1 8.3 3.9 11.1 1.4 1.3 2.8 2.5 4.3 3.6.4.3 1.1.9 1.6.9s1.2-.6 1.6-.9c3.2-2.3 6.6-5.1 8.2-8.8 1.5-3.4 0-8.6-4.4-8.6" stroke-linejoin="round"></path></svg></button></div></div></div><div></div></div></div></div><div class="_gxc04lv"><a href="/rooms/9689874?location=Paris&amp;previous_page_section_name=1001" target="listing_9689874" rel="noopener" data-check-info-section="true" class="_1ol0z3h"><div role="text"><div class="_5ioaf7q" style="color: rgb(118, 118, 118);"><div class="_1etkxf1" style="color: rgb(118, 118, 118);"><span class="_1xxanas2"><span style="color: rgb(118, 118, 118);">개인실<span aria-hidden="true"> · </span>침대 1개</span></span></div></div><div style="margin-top: 6px;"><div class="_88rsw9a"><div class="_b9qfkc2"><div class="_1dss1omb">Nice private room</div></div></div></div><div style="margin-top: 2px;"><div class="_aq2oyh"><div class="_36rlri"><span class="_q27mtmr"><span role="img" aria-label="평점 4.5/5" class="_rs3rozr" style="width: 50px;"><span class="_83zdpk" style="width: 45px;"><span class="_ogu8zgi" style="width: 50px;"></span></span></span></span><span class="_krjbj">후기 256개</span><span class="_1gvnvab" aria-hidden="true"><span class="_j2qalb2">256</span></span></div></div></div></div></a></div></div></div></div></div>')
				 // content: viewContent(marker.title, marker.zIndex), 
				 //   size: new google.maps.Size(280,280) 
				});
		
		infowindowArr.push(infowindow); 
		// 생성한 풍선창(풍선윈도우) infowindow를 배열 infowindowArr 속에 집어넣기		
		
		// **** === marker에 click 이벤트 처리하기 === ***// 
		/*  마커를 클릭했을때 어떤 동작이 발생하게 하려면  
            addListener() 이벤트 핸들러를 사용하여 이벤트 알림을 등록하면 된다. 
                       이 함수는 소스객체, 수신할 이벤트, 지정된 이벤트가 발생할 때 호출할 함수를 인자로 받는다. */
		google.maps.event.addListener(marker, 'click', 
		    function(){ 
			      // marker에(i번째 마커) click(클릭)했을 때 실행할 내용들...
            
	              // 확인용
	              // console.log(marker.zIndex);  // 1  2  3
		     			
				  for(var i=0; i<markerArr.length; i++) { // 생성된 마커의 갯수만큼 반복하여
					  if(i != (marker.zIndex - 1) ) {     // 마커에 클릭하여 발생된 풍선창(풍선윈도우) infowindow 를 제외한 나머지 다른 마커에 달린 풍선창(풍선윈도우) infowindow 는
						 infowindowArr[i].close();	      // 닫는다.
					  }
					  else if(i == (marker.zIndex - 1)) {           // 마커에 클릭하여 발생된 풍선창(풍선윈도우) infowindow 는
						 infowindowArr[i].open(targetmap, marker);  // targetmap 상에 표시되어 있는 marker 위에 띄운다.
					  }
				  }// end of for-----------------------	 		
			 	
		  });  // end of google.maps.event.addListener()-------------------
		
	}// end of function markerListener(map, marker)-----------
	
	function viewContent(title, zIndex) {
		var html =  "<span style='color:red; font-weight:bold;'>"+title+"</span><br/>"
			     +  "<a href='javascript:goDetail("+zIndex+");'>상세보기</a>"; 
			         // 매장번호(marker.zIndex)를 넘겨받아 매장지점 상세정보 보여주기와 같은 팝업창 띄우기
		return html;	
	}
	
	function goDetail(storeno) {
		var url = "storedetailView.kh?storeno="+storeno;
		window.open(url, "storedetailViewInfo",
				    "width=1000px, height=900px, top=50px, left=800px");
	}

</script>
<div id="googleMap"	style="width: 100%; height: 660px; margin: auto;"></div>
<form name="searchWord"><input type="hidden" name="searchWord" value="${searchWord}" ></form>

