<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL Form Result</title>
</head>
<body>

	<div id='elFormResult'>
		<h1>EL Form Result</h1>
		
		<div id='text'>
			<ul>
				<li><%=request.getParameter("intro") %></li>
				<li>${param.intro}</li>
			</ul>
		</div>
		<div id='sports'>
			<ul>
				<li>${param.sports}</li>
			</ul>
		</div>
		<div id='river'>
			<ul>
				<li>${paramValues.rivers[0]}</li>
				<li>${paramValues.rivers[1]}</li>
				<li>${paramValues.rivers[2]}</li>
				<li>${paramValues.rivers[3]}</li>
			</ul>
		</div>
		<div id='hobby'>
			<ul>
				<li>${paramValues.hobbies[0]}</li>
				<li>${paramValues.hobbies[1]}</li>
				<li>${paramValues.hobbies[2]}</li>
				<li>${paramValues.hobbies[3]}</li>
			</ul>
		</div>
	</div>

</body>
</html>