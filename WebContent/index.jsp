<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 페이지</title>
<link rel='stylesheet' href='./css/index_large.css' media='screen and (min-width: 800px)' />
<link rel='stylesheet' href='./css/index_mini.css' media='screen and (max-width: 799px)' />
<link rel='stylesheet' href='/css/custom.css' />

<script src='/js/custom.js'></script>
</head>
<body>
	
	<%
		/*
		* 페이지 로드 시 aside 의 값이 무엇인지 검증하는 스크립트릿
		*/
		request.setCharacterEncoding("utf-8"); // 인코딩
		String aside = request.getParameter("aside");
		String content = request.getParameter("content");
		String component = "./views/dateObj.jsp";
		if (aside == null) {
			aside = "./views/intro.jsp";
		}
		if (content == null) {
			content = "./views/intro.jsp";
		}
	%>
	
	<div id='log'>
		<c:if test="${sessionScope.id != null}">
			<b><%=session.getAttribute("name") %></b> 님 환영합니다&nbsp;
			<input type='button' id='btnLogout' value='logout' />
		</c:if>
		<c:if test="${sessionScope.id == null }">
			<input type='button' id='btnLogin' value='login' />
		</c:if>
		<input type='hidden' id='sessionId' value='${sessionScope.id }' />
	</div>
	
	<%@ include file="./views/main/header.jsp" %>

	<nav>
		<div id='component'>
			<jsp:include page="<%=component %>" />
		</div><br/>
		<ul id='menu'>
			<li><a href='#' id='guestbook'>방명록</a></li>
			<li><a href='list.brd'>게시판</a></li>
			<li>HTML</li>
			<li>CSS3</li>
			<li>JS</li>
			<li><a href='index.jsp?aside=./index_ajax.jsp'>Ajax</a></li>
			<li>MyBatis</li>
			<li>jQuery</li>
			<li><a href='index.jsp?aside=./index_el.jsp'>EL</a></li>
			<li><a href='index.jsp?aside=./index_jstl.jsp'>JSTL</a></li>
			<li><a href="index.jsp?aside=./index_jsp.jsp">JSP</a></li>
			<li><a href="index.jsp?aside=./index_servlet.jsp">Servlet</a></li>
			<li>Spring</li>
			<li><a href="index.jsp?aside=./control.jsp">Control</a></li>
		</ul>
	</nav>
	<section id='wrap'>
		<aside id='aside'>
				<jsp:include page="<%=aside %>" />
		</aside>
		<article id='content'>
				<jsp:include page="<%=content %>" />
		</article>
	</section>
	
	<%@ include file="./views/main/footer.jsp" %>

	<script>indexMain();</script>

</body>
</html>