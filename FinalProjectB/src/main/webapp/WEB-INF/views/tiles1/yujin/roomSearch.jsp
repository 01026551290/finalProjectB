<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
    /* .info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')} */
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
          /* border: 1px solid red; */
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
	
	.starAreaIn {
		background: url(..<%=request.getContextPath()%>/resources/images/star_bgb.png);
	    background-size: 15px 14px;
	    display: inline-flex;
	    width: 76px;
	    height: 14px;
	}
	.starAreaOut {
		background: url(..<%=request.getContextPath()%>/resources/images/star_bg.png);
	    background-size: 15px 14px;
	    display: inline-block;
	    width: 76px;
	    height: 14px;
	}
</style>

 <script type="text/javascript">
   map = null;
   
   $(document).ready(function(){
      console.log($("#starAmount").val());
      var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
       mapOption = {
           center: new kakao.maps.LatLng(33.510485, 126.491321), // 지도의 중심좌표
           level: 9 // 지도의 확대 레벨
       };  
      
      var map = new kakao.maps.Map(mapContainer, mapOption); 
      var geocoder = new kakao.maps.services.Geocoder();
      
      
     /*  $.ajax({ // 서브서치 부분 ajax처리
          url:"/god/searchHotelList.go",
          type:"GET",
          dataType:"JSON",
          data:$("#subSearchFrm").serialize(),
          success:function(json){
            if(json.length > 0) { 
		   		
            	hoteldiv = "";
		   		
            	$.each(json, function(entryIndex, item){
            		
            		
            		
            	})
           
           		$("#hotelList").html(hoteldiv);
            }	
          },
          error: function(request, status, error){
             alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
          }
       }); // 서브서치 부분 ajax처리  */

      $.ajax({ // 서브서치 부분 ajax처리
          url:"/god/searchRoomOption.go",
          type:"GET",
          dataType:"JSON",
          success:function(json){
            if(json.length > 0) { 
		   		
            	largeCategoryCodeDiv = "";
            	lontionDiv = "";
            	pontionDiv = "";
		   		
            	$.each(json, function(entryIndex, item){
            		minPrice = item.minPrice;
            		maxPrice = item.maxPrice;
            		largeCategoryCode = item.largeCategoryCode;
            		largeCategoryName = item.largeCategoryName;
            		lontion = item.lontion;
            		pontion = item.pontion;
            		
            	
            		if(minPrice != null && maxPrice != null) {
            			$("#minPrice").val(minPrice);
        	 			$("#maxPrice").val(maxPrice);
            			
            			 $("#price-range").slider({
         	                range: true,
          	                min: Number(minPrice),
         	                max: Number(maxPrice),
         	                values: [Number(minPrice), Number(maxPrice)],
         	                slide: function(event, ui) {
         	                    $("#priceAmount").val("￦" + ui.values[0] + " - ￦" + ui.values[1]);
		        	 			$("#minPrice").val(ui.values[0]);
		        	 			$("#maxPrice").val(ui.values[1]);
         	                } 
         	            });
        	 			$("#priceAmount").val("￦" + $("#price-range").slider("values", 0) + " - ￦" + $("#price-range").slider("values", 1));
        	 			
            		}
            		
            		if(largeCategoryCode != null && largeCategoryCode.length > 0) {
            			largeCategoryCodeDiv += '<li class="">'+
							                    '       <input type="checkbox" name="largeCategoryCode" value="'+largeCategoryCode+'" id="'+largeCategoryCode+'">'+
							                    '   <label for="'+largeCategoryCode+'" >'+largeCategoryName+'</label>'+
							                    '</li>';
            		}
            		
            		if(lontion != null && lontion.length > 0) {
            			lontionDiv += '<li class="">'+
				                      '       <input type="checkbox" name="lontion" value="'+lontion+'" id="l'+lontion+'" >'+
				                      '   <label for="l'+lontion+'" >'+lontion+'</label>'+
				                      '</li>';
            		}
            		
            		if(pontion != null && pontion.length > 0) {
            			pontionDiv += '<li class="">'+
							          '       <input type="checkbox" name="pontion" value="'+pontion+'" id="p'+pontion+'" >'+
							          '   <label for="p'+pontion+'" >'+pontion+'</label>'+
							          '</li>';
            		}
            		
            	})
           
           		$("#largeCategoryCodeAjax").html(largeCategoryCodeDiv);
           		$("#lontionAjax").html(lontionDiv);
           		$("#pontionAjax").html(pontionDiv);
            }	
          },
          error: function(request, status, error){
             alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
          }
       }); // 서브서치 부분 ajax처리 
       

      
      $.ajax({ // 지도 ajax 처리
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
                          //'            <div class="close" onclick="closeOverlay()" ></div>' + 
                          '        </div>' + 
                          '        <div class="body">' + 
                          '            <div class="img ">' +
                          '                <img src="/god/resources/images/hotel/'+img+'" width="73" height="70">' +
                          '           </div>' + 
                          '            <div class="desc">' + 
                          '                <div class="ellipsis">'+addr+'</div>' +
                          '                <div class="jibun ellipsis">'+price+'원~</div>' +
                          '                <div><a href="/god/product.go?largeCategoryontionCode='+largeCategoryontionCode+'" target="_blank" class="link">상세조회</a></div>' + 
                          '            </div>' + 
                          '        </div>' + 
                          '    </div>' +    
                           '</div>';//,
                          iwRemoveable = true;
                          
                          var infowindow = new kakao.maps.InfoWindow({
                        	  content : iwContent,
                          	  removable : iwRemoveable
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
               });
            }
         },
         error: function(request, status, error){
            alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
         }
      }); // 지도 ajax 처리

      
      function closeOverlay() { // 마커 인포 내리는 펑션(안됨 수정해야함)
  	    overlay.setMap(null);     
  	}         
      
      // 메인검색 자동완성
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
			
		});
		
		///////////////////////////////////////////////////////////////////////////////////
		
        
		// 서브검색 자동완성(호텔명만)
      $("#displayList2").hide();
	  $("#hotelName").keyup(function(){
			
			var form_data2 = {hotelName:$("#hotelName").val()};
			
			$.ajax({
				url:"<%=request.getContextPath()%>/autosearch/wordSearchViewOnlyName.go",
				type:"GET",
				data:form_data2,
				dataType:"JSON",
				success:function(json) {
					
					// === 검색어 입력시 자동글 완성하기 7 ===
					if(json.length > 0) {
					
						var html = "";
						
						$.each(json, function(entryIndex, item){
							var name = item.name;
							
							var len = $("#hotelName").val().length;
							var result = "";
							
							if(name != null && name.length > 0) {
							var indexN = name.toLowerCase().indexOf( $("#hotelName").val().toLowerCase() );
								result += "<span class='clickWord' style='display: inline-block; width: 100%;'><span class='first'>" +name.substr(0, indexN)+ "</span>" + "<span class='second' style='color:#ffaa34;'>" +name.substr(indexN, len)+ "</span>" + "<span class='third'>" +name.substr(indexN+len)+ "</span></span>";
							}
								html += "<span style='cursor:pointer;'>"+ result +"</span><br/>";
						});
						
						$("#displayList2").html(html);
						$("#displayList2").show();
						
					}
					else {
						// 검색된 데이터가 존재하지 않을 경우
						$("#displayList2").hide();
					}
					
				},
				error: function(request, status, error){
					alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
				}
			});
		});	
		// === 검색어 입력시 자동글 완성하기 8 ===
		$("#displayList2").click(function(event){
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
			$("#hotelName").val(word); // 텍스트박스에 검색된 결과의 문자열을 입력해준다.
			
			$("#displayList2").hide();
			
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
		        }});
		        //checkout_date 설정
		    }
		    //checkin_date 선택되었을 때
		});
		            
		$("#checkout_date").datepicker({ 
		    dateFormat: 'yy-mm-dd',
		    onSelect : function(selectDate){
		        setEdate = selectDate;
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
		});
		//조회 버튼 클릭
		
		
		///////////////////////////////////////////////////////////////////////////////////

		// 별점범위 슬라이더바
		$("#minStar").val(0);
		$("#maxStar").val(5);
		
		$("#star-range").slider({
                range: true,
                min: 0,
                max: 10,
                values: [0, 10],
                slide: function(event, ui) {
                    $("#starAmount").val(ui.values[0]*0.5 + "점 - " + ui.values[1]*0.5+"점");
					$("#minStar").val(ui.values[0]*0.5);
					$("#maxStar").val(ui.values[1]*0.5);
                }
            });
            $("#starAmount").val($("#star-range").slider("values", 0)*0.5 + "점 - " + $("#star-range").slider("values", 1)*0.5+"점");


		
            
            
   });//document.ready
   
   function changeSort(val){ // 정렬
	   document.subSearchFrm.sort.value=val;
	   goSubSearch();
   }

	function goSearch() { // 메인서치
		var frm = document.infoSearchFrm;
		frm.method = "GET";
		
		frm.action = "<%=request.getContextPath()%>/search.go";
		frm.submit();
	}
   
   function goProduct(largeCategoryontionCode){ // 객실 상세로 이동
	   frm = document.subSearchFrm;
	   frm.largeCategoryontionCode.value=largeCategoryontionCode;
	   
	   frm.method = "GET";
	   frm.action = "<%=request.getContextPath()%>/product.go";
	   frm.submit();
   }
   
	
   function goSubSearch(){
   		
   	   // 서브서치 
	   var frm = document.subSearchFrm;
	   frm.method = "GET";
	   frm.action = "<%=request.getContextPath()%>/search.go";
	   frm.submit(); 

	   $("input[name=lontion]:checked").each(function() {
		   test.push($(this).val());
		    console.log(test.push($(this).val()));
	       });

	   $("input[name=pontion]:checked").each(function() {
		   test.push($(this).val());
		   console.log(test.push($(this).val()));
	       });
	   
	   $("input[name=largeCategoryCode]:checked").each(function(){
		   test.push($(this).val());
		   console.log(test.push($(this).val()));
   		});
   }
       
</script> 

<%-- <form name="aa">
<input type="hidden" name="searchWord" value="${searchvo.searchWord}" >
<input type="hidden" name="hotelName" value="${searchvo.hotelName}" >
<input type="hidden" name="sort" value="${searchvo.sort}" >
<input type="hidden" name="checkout_date" value="${searchvo.checkout_date}" >
<input type="hidden" name="checkin_date" value="${searchvo.checkin_date}" >
<input type="hidden" name="children" value="${searchvo.children}" >
<input type="hidden" name="adult" value="${searchvo.adult}" >
<input type="hidden" name="largeCategoryontionCode" value="${searchvo.largeCategoryontionCode}" >
<input type="hidden" name="minPrice" value="${searchvo.minPrice}" >
<input type="hidden" name="maxPrice" value="${searchvo.maxPrice}" >
<input type="hidden" name="lontion" value="${searchvo.lontion}" >
<input type="hidden" name="pontion" value="${searchvo.pontion}" >
</form> --%>


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
								<input type="text" id="searchWord" class="form-control" name="searchWord" value="${searchvo.searchWord}"
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
										<select name="adult" id="adults" class="form-control" >
											<c:if test="${searchvo.adult!=null and searchvo.adult!=''}">
												<c:forEach var="i" begin="1" end="4">
													<c:if test="${searchvo.adult==i}">
														<option value="${i}" selected>${i}</option>
													</c:if>
													<c:if test="${searchvo.adult!=i}">
														<option value="${i}" >${i}</option>
													</c:if>
												</c:forEach>
											</c:if>
											<c:if test="${searchvo.adult==null or searchvo.adult==''}">
												<option value="1" selected>1</option>
												<option value="2">2</option>
												<option value="3">3</option>
												<option value="4">4+</option>
											</c:if>
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
										<c:if test="${searchvo.children!=null and searchvo.children!=''}">
												<c:forEach var="i" begin="0" end="3">
													<c:if test="${searchvo.children==i}">
														<option value="${i}" selected>${i}</option>
													</c:if>
													<c:if test="${searchvo.children!=i}">
														<option value="${i}" >${i}</option>
													</c:if>
												</c:forEach>
											</c:if>
											<c:if test="${searchvo.children==null or searchvo.children==''}">
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
						<div class="col-md-6 mb-3 mb-lg-0 col-lg-2">
							<label for="checkin_date" class="font-weight-bold text-black">체크인</label>
							<div class="field-icon-wrap">
								<div class="icon">
									<span class="icon-calendar"></span>
								</div>
								<input value="${searchvo.checkin_date}" type="text" id="checkin_date" name="checkin_date" type="date" class="form-control" style="padding-right:0;" autocomplete="off">
							</div>
						</div>
						<div class="col-md-6 mb-3 mb-lg-0 col-lg-2">
							<label for="checkout_date" class="font-weight-bold text-black">체크아웃</label>
							<div class="field-icon-wrap">
								<div class="icon">
									<span class="icon-calendar"></span>
								</div>
								<input value="${searchvo.checkout_date}" type="text" id="checkout_date" type="date" name="checkout_date" class="form-control" style="padding-right:0;" autocomplete="off">
							</div>
						</div>
						<div class="col-md-6 col-lg-2 align-self-end">
							<button id="btnSubSearch" class="btn btn-primary btn-block text-white">검색</button>
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
      <div class="container" >
         <div class="row" id="sortDiv">
	    	<select name="sort" id="sort" class="form-control col-md-3 col-sm-3" style="margin-left: 68.3%;" onchange="changeSort(this.value)">
		    	<c:if test="${searchvo.sort!=null}">
			    	<c:if test="${searchvo.sort=='largecategoryontioncode' or searchvo.sort==''}">
						<option value="largecategoryontioncode" selected>상품목록순</option>
						<option value="weekPrice">가격순정렬</option>
						<option value="star">별점순정렬</option>
			    	</c:if>
			    	<c:if test="${searchvo.sort=='weekPrice'}">
						<option value="largecategoryontioncode" >상품목록순</option>
						<option value="weekPrice" selected>가격순정렬</option>
						<option value="star">별점순정렬</option>
			    	</c:if>
			    	<c:if test="${searchvo.sort=='star'}">
						<option value="largecategoryontioncode" >상품목록순</option>
						<option value="weekPrice" selected>가격순정렬</option>
						<option value="star" selected>별점순정렬</option>
			    	</c:if>
		    	</c:if>
		    	<c:if test="${searchvo.sort==null}">
					<option value="largecategoryontioncode" selected>상품목록순</option>
					<option value="weekPrice">가격순정렬</option>
					<option value="star">별점순정렬</option>
		    	</c:if>
			</select> 
		</div>
	  </div>	

      <div class="container">
         <div class="row">
         <div class="col-md-3 col-sm-5">
               <form name="subSearchFrm">
               <div id="subSearchInfo">
              
                <input type="hidden" name="largeCategoryontionCode" value="" >
                <input type="hidden" name="searchWord" value="${searchvo.searchWord}" >
				<input type="hidden" name="sort" value="${searchvo.sort}" >
				<input type="hidden" name="checkout_date" value="${searchvo.checkout_date}" >
				<input type="hidden" name="checkin_date" value="${searchvo.checkin_date}" >
				<input type="hidden" name="children" value="${searchvo.children}" >
				<input type="hidden" name="adult" value="${searchvo.adult}" >
                
               </div>
              
               <fieldset>
                  <h4 aria-expanded="true" role="button" tabindex="0" style="margin-bottom: 15px;">옵션으로 검색</h4>
                  <div>
                   	<input type="text" id="hotelName" class="form-control" name="hotelName" value="${searchvo.hotelName}"
					placeholder="숙박명 " autocomplete="off">
					<div id="displayList2"></div>
                    <button id="optionSearch" class="btn btn-primary btn-block text-white" style="margin-top: 8px; margin-bottom: 16px;">숙박명으로 검색하기</button>
                  </div>
               </fieldset>
               <div data-field-collection="non-name">
                  <fieldset>
                     <h4 aria-expanded="true" role="button" tabindex="0">1박 요금</h4>
                     <div id="filter-price-contents" class="filter-contents">
					    <div id="price-range"></div>
					    <input type="hidden" id="minPrice" value="" name="minPrice">
					    <input type="hidden" id="maxPrice" value="" name="maxPrice">
				        <input type="text" id="priceAmount" readonly style="border:0; color:#f6931f; font-weight:bold; background: transparent;">
				     </div>
                  </fieldset>
                  <fieldset>
                     <h4 aria-expanded="true" role="button" tabindex="0" aria-controls="filter-guest-rating-contents">고객 평점</h4>
                     <div id="filter-guest-rating-contents" class="filter-contents">
					    <div id="star-range"></div>
					    <input type="hidden" id="minStar" value="" name="minStar">
					    <input type="hidden" id="maxStar" value="" name="maxStar">
				        <input type="text" id="starAmount" readonly style="border:0; color:#f6931f; font-weight:bold; background: transparent;">
                     </div>
                  </fieldset>
                  <fieldset>
                        <h4 aria-expanded="false" role="button" tabindex="0">숙박 시설 유형</h4>
                     <div><ul class="list-unstyled link" id="largeCategoryCodeAjax"></ul></div>
                  </fieldset>
                  <fieldset>
                     <h4 aria-expanded="false" role="button" tabindex="0">숙박시설</h4>
                     <div ><ul id="lontionAjax" class="list-unstyled link"></ul></div>
                  </fieldset>
                  <fieldset>
                     <h4 aria-expanded="false" role="button" tabindex="0">객실시설</h4>
                     <div><ul id="pontionAjax" class="list-unstyled link"></ul></div>
                  </fieldset>
               </div>
               <button type="button" id="optionSearch" onclick="goSubSearch()" class="btn btn-primary btn-block text-white" style="margin-top: 8px; margin-bottom: 16px;">옵션으로 검색</button>
            </form>
      </div>
       <div class="col-md-9 aos-animate col-sm-7">       
            <div>
             <div class="row" id="hotelList">
               
          <c:if test="${hotelRoomVOList!=null}">
            <c:forEach var="vo" items="${hotelRoomVOList}">
               <div class="col-lg-4 col-md-6 col-sm-12 hotelBox ">
                     <!-- 상단(이미지,찜하트) -->
                     <div style="    position: relative;">
                     <button type="button" style="cursor: pointer;" onclick="location.href='/god/addHeart.go?largeCategoryontionCode=${vo.largeCategoryontionCode}'" class="heart" id="btn_heart${status}" aria-busy="false" style="padding: 8px; margin: -8px; border: none; background-color: transparent;">
                        <span class="heartAreaOut">
	                     <c:if test="${vo.regDay!=null}">
							<span class="heartAreaIn" style="width: 22px;"><span class="blind">heart</span></span>
	                     	</c:if>
 			      		 </span>
                     </button>
                        <img src="/god/resources/images/hotel/${vo.img}" style="width: 270px; height: 180px; cursor: pointer;" onclick="goProduct('${vo.largeCategoryontionCode}')">
                     </div>
                     <!-- 하단(설명,호텔명,가격,평점) -->
                     <div style="padding: 12px 0 0 0;">
                        <div class="hotelAddr meta-post">${vo.address.substring(8)}</div>
                        <div class="hotelName"  style="cursor: pointer;" onclick="goProduct('${vo.largeCategoryontionCode}')">${vo.name}</div>
                        <div class="hotelPrice"><fmt:formatNumber value="${vo.weekPrice}" pattern="###,###" />원 ~</div>
                        
							<c:if test="${vo.starcnt != 0}">
                        <span class="starAreaIn">
								<span class="starAreaOut" style="width: ${vo.star*14.6}px;"><span class="blind">star</span></span>
						</span>
								<span style="font-size: 10pt;">${vo.star}점 &nbsp;${vo.starcnt}개의 후기</span>
							</c:if>
							<c:if test="${vo.starcnt==0}">
                        <span class="starAreaIn">
						</span>
								<span style="font-size: 10pt;">아직 후기가 없습니다.</span>
							</c:if>
                     </div>
                      </div>
            </c:forEach>
         </c:if> 
         <c:if test="${hotelRoomVOList==null}">
         	<h1>~조건에 일치하는 상품이 없습니다~</h1>
         </c:if> 
         
         미친놈들아
         
           </div>
             
            <div class="col-12">
            <div class="custom-pagination">
              <ul class="list-unstyled" id="pagebar">
				<c:if test="${pagebar!=null}">
				${pagebar}
				</c:if> 
              </ul>
            </div>
          </div>
             
             
            </div>
       
      </div>
   </div>         
</div>
</section>


