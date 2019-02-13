<%@page import="java.util.Iterator"%>
<%@page import="com.myweb.memberBean.MemberVo"%>
<%@page import="java.util.Map"%>
<%@page import="com.myweb.memberDao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	{hihi}
	
	<%-- <%
		String search = request.getParameter("search");
		MemberDao dao = new MemberDao();
		Map<String, MemberVo> map = dao.listAll(search, 1);
		Iterator<String> ite = map.keySet().iterator();
		int cnt = 1;
		while (ite.hasNext()) {
			
		}
		
		StringBuilder sb = new StringBuilder();
		sb.append("[");
		sb.append(map.get("").toJson());
		for (int i = 1; i < map.size(); i++) {
			sb.append(", ");
			sb.append(map.get("").toJson());
		}
		sb.append("]");
	%> --%>