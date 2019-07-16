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
	 
		Highcharts.chart('container', {
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
		                format: '<b>{point.name}</b>: {point.percentage:.1f} %'
		            }
		        }
		    },
		    series: [{
		        name: 'Brands',
		        colorByPoint: true,
		        data: [{
		            name: 'Chrome',
		            y: 61.41,
		            sliced: true,
		            selected: true
		        }, {
		            name: 'Internet Explorer',
		            y: 11.84
		        }, {
		            name: 'Firefox',
		            y: 10.85
		        }, {
		            name: 'Edge',
		            y: 4.67
		        }, {
		            name: 'Safari',
		            y: 4.18
		        }, {
		            name: 'Sogou Explorer',
		            y: 1.64
		        }, {
		            name: 'Opera',
		            y: 1.6
		        }, {
		            name: 'QQ',
		            y: 1.2
		        }, {
		            name: 'Other',
		            y: 2.61
		        }]
		    }]
		});
});
</script>


<div id="container" style="min-width: 310px; height: 400px; max-width: 600px; margin-top: 200px;  "></div>    
    