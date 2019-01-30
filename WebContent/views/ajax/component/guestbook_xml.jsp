<?xml version='1.0' encoding='utf-8'?>
<%@page import="java.util.List"%>
<%@page import="com.myweb.guestbookDao.GuestBookDaoImpl"%>
<%@page import="com.myweb.guestbookDao.GuestBookDao"%>
<%@page import="com.myweb.guestbookBean.GuestBookVo"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c' %>

<guestbook>
	<%
		GuestBookDao dao = new GuestBookDaoImpl();
		List<GuestBookVo> list = dao.list("", 1);
		request.setAttribute("list", list);
		response.setContentType("text/xml");
		response.setCharacterEncoding("utf-8");
	%>
	
	<c:forEach var='d' items='${list}'>
		<book>
			<serial>${d.serial }</serial>
			<id>${d.id }</id>
			<content>${d.content }</content>
			<mDate>${d.mDate }</mDate>
		</book>
	</c:forEach>
</guestbook>