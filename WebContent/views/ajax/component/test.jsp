<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ajax Test Page (JSP)</title>
</head>
<body>

	<div id='ajaxTest'>
		<h2>Ajax Test Page (JSP)</h2>
		
		<%
			int r = 0;
			int dan = Integer.parseInt(request.getParameter("dan"));
			out.print("<h3>구구단</h3>입력받은 단수: " + dan + "<br/><br/>");
			for (int i = 1; i < 10; i++) {
				String str = String.format("%4d * %4d = %4d<br/>", dan, i, (dan * i));
				out.print(str);
			}
		%>
	</div>

</body>
</html>