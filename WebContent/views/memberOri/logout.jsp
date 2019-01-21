<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Logout Page</title>
</head>
<body>

	<div id='logout'>
		<h1>Logout Page</h1>
		
		<%
			session.setAttribute("name", null);
			response.sendRedirect("/index.jsp");
		%>
	</div>

</body>
</html>