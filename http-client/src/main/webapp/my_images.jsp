<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<style>
.hidden {
	display : none
}
</style>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Image Loading</title>

<script>
         function getPerfStats() {
	         var timing = window.performance.timing;
	         return {
		         dns: timing.domainLookupEnd - timing.domainLookupStart,
		         connect: timing.connectEnd - timing.connectStart,
		         ttfb: timing.responseStart - timing.connectEnd,
		         basePage: timing.responseEnd - timing.responseStart,
		         frontEnd: timing.loadEventStart - timing.responseEnd
	         };
         }
         window.onload = function() {
	         if (window.performance && window.performance.timing) {
	         	var ntStats = getPerfStats();
	         	console.log(ntStats);
         }
         };
         function imageLoadTime(i) {
	         var lapsed = navSupport ? window.performance.now() : Date.now() - pageStart;
	         document.getElementById("imgTiming").innerHTML = ((lapsed) / 1000).toFixed(2);
	         /*var timing = window.performance.timing;
	         var imageDivName  = "imgTiming" + i;
	         console.log(imageDivName);
	         document.getElementById(imageDivName).innerHTML = timing.responseStart - timing.requestStart;*/
         }
         var pageStart = Date.now();
         var navSupport = !(!('performance' in window) || !('timing' in window.performance) || !('navigation' in window.performance));
</script>

</head>
<%
int count = Integer.parseInt(request.getParameter("count"));
String imageName = "icon99.png";
%>
<body>

<div id="IMGLoad">
            <div>Load time: <strong class="highlight"><span id="imgTiming">0</span>s</strong></div>
         </div>
				<%for(int i = 0; i < count; i++) { %>
	                        <img width="20px" height="20px" onload='imageLoadTime(<%=i%>)' src="https://192.168.111.223:8443/rest-service-0.0.1/service/images/<%=imageName%>?q=<%=i %>" alt="">	                           
				<%} %>

 <span id=nt-unsupported class="hidden">API not supported</span>
      <h2>Timing info</h2>
      <ul id=timing-list> </ul>
      <h2>Navigation info</h2>
      <ul id=navigation-list> </ul>
      <script>
      			if ( !('performance' in window) ||  !('timing' in window.performance) ||  !('navigation' in window.performance) ) {
         				document.getElementById('nt-unsupported').className = '';
         		} else {
         			window.addEventListener('load', function() {
			          var list = '';
			          var timings = window.performance.timing;
			          for(var timing in timings) {
			             list += '<li>' + timing + ': <span class="value">' + timings[timing] + '</span></li>';
			          }
			          document.getElementById('timing-list').innerHTML = list;
			         
			          list = '';
			          list += '<li>redirectCount: <span class="value">' + window.performance.navigation['redirectCount'] + '</span></li>';
			          list += '<li>type: <span class="value">' + window.performance.navigation['type'] + '</span></li>';
			          document.getElementById('navigation-list').innerHTML = list;
         			});
         		}
      </script> 

</body>
</html>