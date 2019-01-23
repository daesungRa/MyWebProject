<%@page import="test.ElDao"%>
<%@page import="test.ElVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL Method Call</title>
</head>
<body>

	<%
		ElDao dao = new ElDao(request);
		ElVo vo = dao.getVo();
		
		pageContext.setAttribute("vo", vo);
	%>
	
	<div id='elMethodCall'>
		<h1>EL Method Call</h1>
		
		<ul>
			<li>Intro message : ${pageScope.vo.getIntro()}</li>
			<li>Intro message_re : ${pageScope.vo.intro}</li>
			<p/>
			<li>Sports: ${pageScope.vo.sports}</li>
			<p/>
			<li>Rivers0 : ${pageScope.vo.rivers[0]}</li>
			<li>Rivers1 : ${pageScope.vo.rivers[1]}</li>
			<li>Rivers2 : ${pageScope.vo.rivers[2]}</li>
			<li>Rivers3 : ${pageScope.vo.rivers[3]}</li>
			<p/>
			<li>hobbies0 : ${pageScope.vo.hobbies[0]}</li>
			<li>hobbies1 : ${pageScope.vo.hobbies[1]}</li>
			<li>hobbies2 : ${pageScope.vo.hobbies[2]}</li>
			<li>hobbies3 : ${pageScope.vo.hobbies[3]}</li>
		</ul>
	</div>

</body>
</html>