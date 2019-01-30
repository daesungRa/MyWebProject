<%@page import="com.myweb.guestbookBean.GuestBookVo"%>
<%@page import="java.util.List"%>
<%@page import="com.myweb.guestbookDao.GuestBookDaoImpl"%>
<%@page import="com.myweb.guestbookDao.GuestBookDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c' %>

<%
	GuestBookDao dao = new GuestBookDaoImpl();
	List<GuestBookVo> list = dao.list("", 1);
	request.setAttribute("list", list);
%>
[
		{
			"serial"	:"${list[0].serial }",
			"id"		:"${list[0].id }",
			"content"	:"${list[0].content }",
			"mDate"		:"${list[0].mDate }"
		}
		
	<c:forEach var='d' begin='1' items='${list }'>
		, {
			"serial"	:"${d.serial }",
			"id"		:"${d.id }",
			"content"	:"${d.content }",
			"mDate"		:"${d.mDate }"
		}
	</c:forEach>
]
