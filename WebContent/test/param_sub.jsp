<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div id='viewResult'>
		<%
			String[] irums = request.getParameterValues("irum");
			String address = request.getParameter("address");
			
			for (int i = 0; i < irums.length; i++) {
				out.println("<li>" + irums[i] + "</li>");
			}
			out.println("<li>" + address + "</li>");
		%>
	</div>

</body>
</html>