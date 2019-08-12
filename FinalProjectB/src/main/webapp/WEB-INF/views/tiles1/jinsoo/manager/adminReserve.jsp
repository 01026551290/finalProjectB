<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<%
	String ctxPath = request.getContextPath();
%>
<script type="text/javascript" src="<%= ctxPath%>/resources/js/jquery-3.3.1.min.js"></script>

<script type="text/javascript">
 
 $(document).ready(function(){
	 
	 $("#reserveType").bind("change",function(){
			
			func_reserveAjax($(this).val());
			
	 });// end of $("#searchType").bind("change",function()

 }); // end of $(document).ready(function()			 
	
	 function func_reserveAjax(reserveTypeVal) {	 
			
		 switch (reserveTypeVal) {
	 		
		 	case "todayReserve" :
		 		
		 			$.ajax({
		 				
		 				url: "admin_todayReserveJSON.go",
		 				dataType: "JSON" ,
		 				success: function(json){
		 					
		 					$("#chart_reserve").empty();
		 					
		 					html = "";
		 					
		 					html += "<div style='height: 500px; width: 500px; '>";
		 					html += "<table>";	    
		 					html +=	"<thead>";
		 					html +=	"<tr><th>총 예약수 : "+json.todayRList+"명 </th> </tr>";
		 					html +=	"<tr><th>당일 예약 : "+json.todayRstartList+"명 </th> </tr>";
		 					html +=	"<tr><th>당일 예약 취소(수정) : "+json.todayRstartList+"명</th> </tr>";
		 					html +=	"	</thead>";
		 					html +=	"</table>";
		 					html +=	"</div> ";
		 					
		 					 $("#chart_reserve").html(html);
		 					
		 				},error: function(request, status, error){
							alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
						}
		 				
		 			});// end of $.ajax({
		 			
		 		
		 		break;
	
			case "ageGender" :
				
				$.getJSON("admin_ageReserveJSON.go",function(json){
					
					$("#chart_reserve").empty();
					
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
					$.getJSON("admin_ageGenderReserveJSON.go?age="+item.age , function(json2){
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
					Highcharts.chart('chart_reserve', {
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
										 
			 case "category" :
				 $.ajax({
					 
					 url:"admin_categoryReserveJSON.go",
					 dataType: "JSON",
					 success: function(json){
						 
						 $("#chart_reserve").empty();
						
						 
						
						 var resultArr = [];
							for(var i=0; i<json.length; i++){
									
									cnt = json[i].cnt+" 개";
										var obj = {name:json[i].largecategoryname , y:Number(json[i].percnt)};
									
									
			 //					var obj = {name:json[i].GENDER , y:Number(json[i].PERCNT)};		
								
								
								resultArr.push(obj); 
									
							}
							Highcharts.chart('chart_reserve', {								
								    chart: {
								        plotBackgroundColor: null,
								        plotBorderWidth: 0,
								        plotShadow: false
								    },
								    title: {
								        text: '숙박시설',
								        align: 'center',
								        verticalAlign: 'middle',
								        y: 40
								    },
								    tooltip: {
								        pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
								    },
								    plotOptions: {
								        pie: {
								            dataLabels: {
								                enabled: true,
								                distance: -50,
								                style: {
								                    fontWeight: 'bold',
								                    color: 'white'
								                }
								            },
								            startAngle: -90,
								            endAngle: 90,
								            center: ['50%', '75%'],
								            size: '110%'
								        }
								    },
								    series: [{
								        type: 'pie',
								        name: cnt,
								        innerSize: '50%',
								        data: resultArr
								    }]
								});
							
						 
					 },error: function(request, status, error){
							alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
						}
					 
				 });// end of $.ajax({
				 break;			
				
	 }// end of switch (reserveTypeVal) 
				
}// end of function func_reserveAjax(reserveTypeVal)
		

</script>

    


<div align="center">
		
		<h2>예약</h2>
		
		<form name="reserveFrm" style="margin-bottom: 80px;">
			<select name="reserveType" id="reserveType" style="height: 25px;">
				<option value="">통계선택</option>
				<option value="todayReserve">오늘의 예약</option>
				<option value="ageGender">연령·성별 인원통계</option>
				<option value="category">숙박별 예약 통계</option>
			</select>
		</form>
		
		<div id="chart_reserve" style="min-width: 310px; height: 400px; max-width: 600px; margin: 0 auto"></div>
		
		<div><span style="cursor: pointer;" onclick="javascript:location.href='<%= request.getContextPath() %>/admin_reserveManage.go'">예약관리</span></div>
	</div>
	


