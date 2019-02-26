<%@page import="myBatis.MybatisMemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c' %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
		MybatisMemberDao dao = new MybatisMemberDao(request);
		dao.login();
	%>
	
	<div id='mybatis_memberLogin'>
		<h3>LOGIN 처리결과</h3>
		<c:choose>
			<c:when test='${requestScope.login == true }'>
				<p>로그인 성공!</p><br/>
				<p>아이디: ${requestScope.vo.id }<br/>비밀번호: ${requestScope.vo.pwd }</p>
			</c:when>
			<c:otherwise>
				<p>로그인 실패..</p><br/>
				<a href='#' onclick='history.back();'>뒤로가기</a>
			</c:otherwise>
		</c:choose>
	</div>

</body>
</html>