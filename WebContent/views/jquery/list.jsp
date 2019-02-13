<%@page import="java.util.Iterator"%>
<%@page import="com.myweb.memberBean.MemberVo"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="com.myweb.memberDao.MemberDao"%>
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
		String search = request.getParameter("search");
		MemberDao dao = new MemberDao();
		Map<String, MemberVo> map = dao.listAll(search, 1);
		request.setAttribute("map", map);
	%>
	
	<%
		Iterator<String> ite = map.keySet().iterator();
		int i = 1;
		while (ite.hasNext()) {
			String key = ite.next();
			MemberVo mvo = map.get(key);
	%>
			<div class='map'>
				<span class='no'>${i }</span>
				<span class='id'><%=mvo.getId() %></span>
				<span class='irum'>${mvo.irum }</span>
				<span class='phone'>${mvo.phone }</span>
				<span class='email'>${mvo.email }</span>
			</div>		
	<%
			i++;
		}
	%>

</body>
</html>