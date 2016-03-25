<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Image Loading</title>


</head>
<%
int count = Integer.parseInt(request.getParameter("count"));
String imageName = "icon99.png";
%>
<body>

				<%for(int i = 0; i < count; i++) { %>
	                        <img width="20px" height="20px" src="https://localhost:8443/rest-service-0.0.1/service/images/<%=imageName%>?q=<%=i %>" alt="">        
				<%} %>

</body>
</html>