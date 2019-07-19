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
<script type="text/javascript">
 
 $(document).ready(function(){
	 
	 
	 $.ajax({
		 
		 url:"genderJSON.go",
		 dataType: "JSON",
		 success: function(json){
			 
			 $("#container").empty();
			
			
			
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
				Highcharts.chart('container', {
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
				
						
	$.ajax({
		
		url: "memberCntJSON.go"
		
	});// end of $.ajax({  		 
	
				
		
		
}); // end of $(document).ready(function()
</script>

<div style="height: 500px; width: 500px; display: inline-block;" >
	<div id="container" style="min-width: 310px; height: 400px; max-width: 600px; margin-top: 400px;  "></div>    
</div>

<div style="height: 500px; width: 500px; ">
	    <table>	    
	    	<thead>
	    		<tr>    <th>총인원수 : 100명</th> </tr>
	    		<tr>	<th>신입회원 : 10명</th> </tr>
	    		<tr>	<th>탈퇴한회원 : 20명</th> </tr>
	    	</thead>
	    </table>
</div>        