<%@page import="com.myweb.memberDao.MemberDao"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.myweb.memberBean.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="vo" class="com.myweb.memberBean.MemberVo" scope="page"/>
<jsp:setProperty name="vo" property="*" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Member Delete Page</title>
</head>
<body>
	<%
		response.setCharacterEncoding("utf-8");
		String message = "멤버 정보 삭제에 실패하였습니다.";
		
		if (request.getMethod().equals("POST")) {
			MemberDao dao = new MemberDao();
			out.print(vo.getId());
			
			// 삭제에 성공했다면 
			if (dao.delete(vo)) {
				message = "멤버 정보 삭제에 성공하였습니다";
			}
			
		}
	%>

	<div id='memDelete'>
		<h1>Member Delete Page</h1>
		<p><label>결과 : </label><%=message %></p>
		<a href='index.jsp?aside=./control.jsp&content=./views/member/list.jsp'>돌아가기</a>
	</div>

</body>
</html>