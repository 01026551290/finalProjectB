<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
<%
	String ctxPath = request.getContextPath();
%>
<script type="text/javascript" src="<%= ctxPath%>/resources/js/jquery-3.3.1.min.js"></script>


<script type="text/javascript">
 
 $(document).ready(function(){
	 
	 $("#revenueType").bind("change",function(){
			
		 func_revenueAjax($(this).val());
			
	 });// end of $("#searchType").bind("change",function()

 }); // end of $(document).ready(function()			 
	
	 function func_revenueAjax(revenueTypeVal) {	 
			
		 switch (revenueTypeVal) {
	 		
		 	case "revenueStatus" :
		 		
		 			$.ajax({
		 				
		 				url: "revenueStatusJSON.go",
		 				dataType: "JSON" ,
		 				success: function(json){
		 					
		 					$("#chart_revenue").empty();
		 					
		 					html = "";
		 					
		 					html += "<div style='height: 500px; width: 500px; '>";
		 					html += "<table>";	    
		 					html +=	"<thead>";
		 					html +=	"<tr><th>연 매출 : "+json.yearRevenue+"원</th> </tr>";
		 					html +=	"<tr><th>월 매출 : "+json.monthRevenue+"원 </th> </tr>";
		 					html +=	"<tr><th>일 매출 : "+json.todayRevenue+ "원</th> </tr>";
		 					html +=	"	</thead>";
		 					html +=	"</table>";
		 					html +=	"</div> ";
		 					
		 					 $("#chart_revenue").html(html);
		 					
		 				},error: function(request, status, error){
							alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
						}
		 				
		 			});// end of $.ajax({
		 			
		 		
		 		break;
	 
		case "categoryRevenue" :
					
			$.ajax({
				 
				 url:"categoryRevenueJSON.go",
				 dataType: "JSON",
				 success: function(json){
					 
					 $("#chart_revenue").empty();
					 html = "";
						 var resultArr = [];
						 	html += "<div style='height: 500px; width: 500px; '>";
		 					html += "<table>";	    
		 					html +=	"<thead>";
							for(var i=0; i<json.length; i++){
																		
									//	var obj = {name:json[i].largecategoryname , y:Number(json[i].allprice)};
										
					 					html +=	"<tr><th> "+json[i].largecategoryname +" : "+json[i].allprice+"원</th> </tr>";
					 		
								//	resultArr.push(obj); 
							}
							html +=	"	</thead>";
		 					html +=	"</table>";
		 					html +=	"</div> ";
									$("#chart_revenue").html(html);
				 },error: function(request, status, error){
						alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
					}			
				 });// end of $.ajax({
		 				
	 	break;   
	 	
	 	case "daycategory" :
	 	
	 		$.ajax({
	 			
	 			url: "admin_dayRevenueJSON.go" ,
	 			dataType: "JSON",
	 			success: function(json){
	 				
	 				$("#chart_revenue").empty();
	 				
	 				 var resultArr = [];
						for(var i=0; i<json.length; i++){
								
							var obj = {name:json[i].day  , y:Number(json[i].percnt)};
							
							resultArr.push(obj); 							
						}
						
						Highcharts.chart('chart_revenue', {
						    chart: {
						        plotBackgroundColor: null,
						        plotBorderWidth: null,
						        plotShadow: false,
						        type: 'pie'
						    },
						    title: {
						        text: 'Browser market shares in January, 2018'
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
						                format: '<b>{point.name}</b>: {point.percentage:.1f} %',
						                connectorColor: 'silver'
						            }
						        }
						    },
						    series: [{
						        name: 'Share',
						        data: resultArr
						    }]
						});
	 				
	 			},error: function(request, status, error){
					alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
				}	
	 			
	 		}); // end of $.ajax({ 
	 		
	 	
	 	break;
	 	
	  	case "MDcategory" :
	 		
	 		$.getJSON("MonthRevenueJSON.go",function(json){
				
				$("#chart_revenue").empty();
				
				var MonthArr = [];
				
				$.each(json,function(index,item){
					MonthArr.push({
						"name":item.month + "월" , 
						"y":Number(item.revenue) , 
						"drilldown": item.month
					});
				}); // end of $.each(json,function(index,item)
			
				
			
				
				var dayArr = [];		
			
			$.each(json, function(index,item){
				$.getJSON("MdayRevenueJSON.go?month="+item.month , function(json2){
					var subArr = [];

					$.each(json2,function(index,item){							
					
						subArr.push([								
							item.day  ,
							item.revenue
						]);
					});// $.each(json2,function(index,item)
					dayArr.push({
						"name":item.day ,
						"id":item.day ,
						"data": subArr
					});
				});
			});	
				Highcharts.chart('chart_revenue', {
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
				                //format: '{point.y:.1f}%'
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
				            data: MonthArr 
				        }
				    ],
				    drilldown: {
				        series: dayArr
				    }
				});	
					
					
		
			
			}); // end of $.getJSON("ageJSON.go",function(json)
	 		
	 	break;	
	  
		 }// end of switch (reserveTypeVal) 
				
}// end of function func_reserveAjax(reserveTypeVal)
		

</script>

    


<div align="center">
		
		<h2>매출현황</h2>
		
		<form name="RevenueFrm" style="margin-bottom: 80px;">
			<select name="revenueType" id="revenueType" style="height: 25px;">
				<option value="">통계선택</option>
				<option value="revenueStatus">매출현황</option>
				<option value="categoryRevenue">종류별 매출통계</option>
				<option value="daycategory">요일별 매출 통계</option>
				<option value="MDcategory">일·월별 매출 통계</option>
			</select>
		</form>
		
		<div id="chart_revenue" style="min-width: 310px; height: 400px; max-width: 600px; margin: 0 auto"></div>
		
		<div><span style="cursor: pointer;" onclick="javascript:location.href='<%= request.getContextPath() %>/jinsoo/productManage.go'">상품관리</span></div>
	</div>
	


