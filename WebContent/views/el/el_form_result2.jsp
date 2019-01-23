<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="test.ElDao"%>
<%@page import="test.ElVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL Form Result</title>
</head>
<body>

	<%
		MultipartRequest multi = new MultipartRequest(request, ".", "utf-8");
		request.setAttribute("intro", multi.getParameter("intro"));
		request.setAttribute("sports", multi.getParameter("sports"));
		request.setAttribute("rivers", multi.getParameterValues("rivers"));
		request.setAttribute("hobbies", multi.getParameterValues("hobbies"));
	%>

	<div id='elFormResult'>
		<h1>EL Form Result</h1>
		
		<div id='text'>
			<ul>
				<li>${requestScope.intro}</li>
			</ul>
		</div>
		<div id='sports'>
			<ul>
				<li>${requestScope.sports}</li>
			</ul>
		</div>
		<div id='river'>
			<ul>
				<li>${requestScope.rivers[0]}</li>
				<li>${requestScope.rivers[1]}</li>
				<li>${requestScope.rivers[2]}</li>
				<li>${requestScope.rivers[3]}</li>
			</ul>
		</div>
		<div id='hobby'>
			<ul>
				<li>${requestScope.hobbies[0]}</li>
				<li>${requestScope.hobbies[1]}</li>
				<li>${requestScope.hobbies[2]}</li>
				<li>${requestScope.hobbies[3]}</li>
			</ul>
		</div>
	</div>

</body>
</html>