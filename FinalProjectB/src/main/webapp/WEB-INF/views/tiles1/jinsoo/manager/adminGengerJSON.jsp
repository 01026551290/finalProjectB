<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	String ctxPath = request.getContextPath();
%>
<script type="text/javascript" src="<%= ctxPath%>/resources/js/jquery-3.3.1.min.js"></script>
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>
<script src="https://code.highcharts.com/modules/data.js"></script>
<script src="https://code.highcharts.com/modules/drilldown.js"></script>
<script type="text/javascript">
 
 $(document).ready(function(){
	 
	 $("#searchType").bind("change",function(){
			
			func_Ajax($(this).val());
			
	 });// end of $("#searchType").bind("change",function()

 }); // end of $(document).ready(function()			 
	
	 function func_Ajax(searchTypeVal) {	 
			
		 switch (searchTypeVal) {
	 		
		 	case "todaymember" :
		 		
		 			$.ajax({
		 				
		 				url: "todaymemberJSON.go",
		 				dataType: "JSON" ,
		 				success: function(json){
		 					
		 					$("#chart_container").empty();
		 					
		 					html = "";
		 					
		 					html += "<div style='height: 500px; width: 500px; '>";
		 					html += "<table>";	    
		 					html +=	"<thead>";
		 					html +=	"<tr><th>총인원수 : "+json.todayList+"명 </th> </tr>";
		 					html +=	"<tr><th>신입회원 : "+json.todayStartList+"명 </th> </tr>";
		 					html +=	"<tr><th>탈퇴한회원 : "+json.todayEndList+"명</th> </tr>";
		 					html +=	"	</thead>";
		 					html +=	"</table>";
		 					html +=	"</div> ";
		 					
		 					 $("#chart_container").html(html);
		 					
		 				},error: function(request, status, error){
							alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
						}
		 				
		 			});// end of $.ajax({
		 			
		 		
		 		break;
 		 
			 case "gender" :
				 $.ajax({
					 
					 url:"genderJSON.go",
					 dataType: "JSON",
					 success: function(json){
						 
						 $("#chart_container").empty();
						
						 
						
						 var resultArr = [];
							for(var i=0; i<json.length; i++){
									if(json[i].GENDER == 1){
										var obj = {name:"남자" , y:Number(json[i].PERCNT)};
									}
									else{
										var obj = {name:"여자" , y:Number(json[i].PERCNT)};
									}
			 //					var obj = {name:json[i].GENDER , y:Number(json[i].PERCNT)};		
								
								
								resultArr.push(obj); 
									
							}
							Highcharts.chart('chart_container', {
							    chart: {
							        plotBackgroundColor: null,
							        plotBorderWidth: null,
							        plotShadow: false,
							        type: 'pie'
							    },
							    title: {
							        text: '성별통계'
							    },
							    tooltip: {
							        pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
							    },
							    plotOptions: {
							        pie: {
							            allowPointSelect: true,
							            cursor: 'pointer',
							            dataLabels: {
							                enabled: true,
							                format: '<b>{point.name}</b>: {point.percentage:.1f} %'
							            }
							        }
							    },
							    series: [{
							        name: '인원비율',
							        colorByPoint: true,
							        data: resultArr
							    }]
							});
						 
					 },error: function(request, status, error){
							alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
						}
					 
				 });// end of $.ajax({
				 break;		
			case "age" :
				
				$.getJSON("ageJSON.go",function(json){
					
					$("#chart_container").empty();
					
					var ageArr = [];
					
					$.each(json,function(index,item){
						ageArr.push({
							"name":item.age + "대" , 
							"y":Number(item.percnt) , 
							"drilldown": item.age
						});
					}); // end of $.each(json,function(index,item)
				
					
				
					
					var ageGenderCntArr = [];		
				
				$.each(json, function(index,item){
					$.getJSON("ageGenderJSON.go?age="+item.age , function(json2){
						var subArr = [];

						$.each(json2,function(index,item){							
						
							subArr.push([								
								item.gender +" " + item.cnt + " 명" ,
								Number(item.percnt)
							]);
						});// $.each(json2,function(index,item)
						ageGenderCntArr.push({
							"name":item.age ,
							"id":item.age ,
							"data": subArr
						});
					});
				});	
					Highcharts.chart('chart_container', {
					    chart: {
					        type: 'column'
					    },
					    title: {
					        text: '연령별 회원통계'
					    },
					    subtitle: {
					        text: '연령을 클릭하세요'
					    },
					    xAxis: {
					        type: 'category'
					    },
					    yAxis: {
					        title: {
					            text: '인원 비율(%)'
					        }

					    },
					    legend: {
					        enabled: false
					    },
					    plotOptions: {
					        series: {
					            borderWidth: 0,
					            dataLabels: {
					                enabled: true,
					                format: '{point.y:.1f}%'
					            }
					        }
					    },

					    tooltip: {
					        headerFormat: '<span style="font-size:11px">{series.name}</span><br>',
					        pointFormat: '<span style="color:{point.color}">{point.name}</span>: <b>{point.y:.2f}%</b> of total<br/>'
					    },

					    series: [
					        {
					            name: "연령별",
					            colorByPoint: true,
					            data: ageArr 
					        }
					    ],
					    drilldown: {
					        series: ageGenderCntArr
					    }
					});	
						
						
			
				
				}); // end of $.getJSON("ageJSON.go",function(json)
		 
		 				
	 	break;  
				
				 }
				
		 			}
		

</script>

    


<div align="center">
		
		<h2>회원</h2>
		
		<form name="searchFrm" style="margin-bottom: 80px;">
			<select name="searchType" id="searchType" style="height: 25px;">
				<option value="">통계선택</option>
				<option value="todaymember">오늘의 현황</option>
				<option value="gender">성별 인원통계</option>
				<option value="age">연령별 인원 통계</option>
			</select>
		</form>
		
		<div id="chart_container" style="min-width: 310px; height: 400px; max-width: 600px; margin: 0 auto"></div>
		
		<div><span style="cursor: pointer;" onclick="javascript:location.href='<%= request.getContextPath() %>/jinsoo/memberManage.go'">회원관리</span></div>
	</div>
	


