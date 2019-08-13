<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     
<%
	String ctxPath = request.getContextPath();
%>
<script type="text/javascript" src="<%= ctxPath%>/resources/js/jquery-3.3.1.min.js"></script>

<script type="text/javascript">
 
 $(document).ready(function(){
	 
	 $("#productType").bind("change",function(){
			
			func_productAjax($(this).val());
			
	 });// end of $("#searchType").bind("change",function()

 }); // end of $(document).ready(function()			 
	
	 function func_productAjax(productTypeVal) {	 
			
		 switch (productTypeVal) {
	 		
		 	case "productStatus" :
		 		
		 			$.ajax({
		 				
		 				url: "admin_productStatusJSON.go",
		 				dataType: "JSON" ,
		 				success: function(json){
		 					
		 					$("#chart_product").empty();
		 					
		 					html = "";
		 					
		 					html += "<div style='height: 500px; width: 500px; '>";
		 					html += "<table>";	    
		 					html +=	"<thead>";
		 					html +=	"<tr><th>총 상품수 : "+json.todayPList+"개 </th> </tr>";
		 			//		html +=	"<tr><th>당일 예약 : "+json.todayRstartList+"명 </th> </tr>";
		 			//		html +=	"<tr><th>당일 예약 취소(수정) : "+json.todayRstartList+"명</th> </tr>";
		 					html +=	"	</thead>";
		 					html +=	"</table>";
		 					html +=	"</div> ";
		 					
		 					 $("#chart_product").html(html);
		 					
		 				},error: function(request, status, error){
							alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
						}
		 				
		 			});// end of $.ajax({
		 			
		 		
		 		break;
	
		case "categoryProduct" :
				
				
					
			$.ajax({
				 
				 url:"admin_categoryProductJSON.go",
				 dataType: "JSON",
				 success: function(json){
					 
					 $("#chart_product").empty();
						
						 var resultArr = [];
							for(var i=0; i<json.length; i++){
																		
										var obj = {name:json[i].largecategoryname , y:Number(json[i].cnt)};
									
									resultArr.push(obj); 
									
							}
				 
							Highcharts.chart('chart_product', {
							    chart: {
							        type: 'column'
							    },
							    title: {
							        text: '종류별'
							    },
							    subtitle: {
							        text: '현재'
							    },
							    xAxis: {
							        type: 'category',
							        labels: {
							            rotation: -45,
							            style: {
							                fontSize: '13px',
							                fontFamily: 'Verdana, sans-serif'
							            }
							        }
							    },
							    yAxis: {
							        min: 0,
							        title: {
							            text: 'Population '
							        }
							    },
							    legend: {
							        enabled: false
							    },
							    tooltip: {
							        pointFormat: '{point.y:.1f} '
							    },
							    series: [{
							        name: 'Population',
							        data: resultArr	    ,
							        dataLabels: {
							            enabled: true,
							            rotation: -90,
							            color: '#FFFFFF',
							            align: 'right',
							            format: '{point.y:.1f}', // one decimal
							            y: 10, // 10 pixels down from the top
							            style: {
							                fontSize: '13px',
							                fontFamily: 'Verdana, sans-serif'
							            }
							        }
							    }]
							});
							
						 
					 },error: function(request, status, error){
							alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
						}
					 
						
			
				
				}); // end of $.getJSON("ageJSON.go",function(json)
		 
		 				
	 	break;  
	 	/* 										 
			 case "category" :
				 $.ajax({
					 
					 url:"categoryReserveJSON.go",
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
				 break;			 */
				
	 }// end of switch (reserveTypeVal) 
				
}// end of function func_reserveAjax(reserveTypeVal)
		

</script>

    


<div align="center">
		
		<h2>상품</h2>
		
		<form name="reserveFrm" style="margin-bottom: 80px;">
			<select name="productType" id="productType" style="height: 25px;">
				<option value="">통계선택</option>
				<option value="productStatus">상품현황</option>
				<option value="categoryProduct">종류별 상품통계</option>
				
			</select>
		</form>
		
		<div id="chart_product" style="min-width: 310px; height: 400px; max-width: 600px; margin: 0 auto"></div>
		
		<div><span style="cursor: pointer;" onclick="javascript:location.href='<%= request.getContextPath() %>/admin_productManage.go'">상품관리</span></div>
	</div>
	


