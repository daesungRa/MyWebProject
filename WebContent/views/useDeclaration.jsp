<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>This is Declaration Page</title>
</head>
<body>

	<h1>This is Declaration Page</h1>
	
	<%!
		public int multiply (int a, int b) {
			int mul = a * b;
			return mul;
		}
	%>
	
	<div>
		<p>두 정수의 곱</p>
		<p> >> 10 * 20 = <%=multiply(10, 20) %></p>
	</div>
</body>
</html>