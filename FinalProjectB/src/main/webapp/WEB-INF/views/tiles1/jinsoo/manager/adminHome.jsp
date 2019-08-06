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
	 
	 
	
				
						

				
		
		
}); // end of $(document).ready(function()
</script>

<div>게시판</div>

<div style="height: 500px; width: 500px; display: inline-block;" >
	 <div id="container" style="min-width: 310px; height: 400px; max-width: 600px; margin-top: 400px;  "><jsp:include page="adminGengerJSON.jsp" /></div>     
	<div id="container" style="min-width: 310px; height: 400px; max-width: 600px; margin-top: 400px; position: absolute; top:-4px; right: 1000px; "><jsp:include page="adminReserve.jsp" /></div>    
	<div id="container" style="min-width: 310px; height: 400px; max-width: 600px; margin-top: 400px; position: absolute; top:-4px; right: 500px; "><jsp:include page="adminProduct.jsp" /></div>    
</div>

