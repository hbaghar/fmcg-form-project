<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>    
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
</head>
<body>
<%
	String establishment_name=request.getParameter("establishment_name");
	
%>
	<h1>Name of establsihment: <%=establishment_name%>!</h1>
</body>
</html>
