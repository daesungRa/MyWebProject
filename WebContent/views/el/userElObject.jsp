<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>El Object Test</title>
<style type="text/css">
	#elObject #info legend {
		border: 1px solid black;
	}
	#elObject #info ul {
		border: 1px solid black;
		padding: 10px 20px 10px 20px;
		list-style: none;
	}
</style>
</head>
<body>

	<%
		pageContext.setAttribute("name", "kimkim");
		request.setAttribute("name", "hong ssi");
		session.setAttribute("name", "daesung");
		application.setAttribute("name", "wangsu");
	%>

	<div id='elObject'>
		<fieldset id='info'>
			<legend>scope</legend>
			<div>
				<p>-- el 의 scope --</p>
				<ul>
					<li>-- pageScope --</li>
					<li>pageScope.name : ${pageScope.name}</li>
				</ul>
				<ul>
					<li>-- requestScope --</li>
					<li>요청 URI : ${pageContext.request.requestURI}</li>
					<li>요청 URL : ${pageContext.request.requestURL}</li>
					<li>requestScope.name : ${requestScope.name}</li>
				</ul>
				<ul>
					<li>-- sessionScope --</li>
					<li>sessionScope.name : ${sessionScope.name}</li>
				</ul>
				<ul>
					<li>-- applicationScope --</li>
					<li>applicationScope.name : ${applicationScope.name}</li>
				</ul>
				<ul>
					<li>-- param --</li>
					<li>code 파라미터 : ${param.code}</li>
				</ul>
				<p/>
			</div>
		</fieldset>
	</div>

</body>
</html>