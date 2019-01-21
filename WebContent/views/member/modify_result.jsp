<%@page import="com.myweb.memberDao.MemberDao"%>
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
<title>회원정보 수정</title>
</head>
<body>

	<%
		response.setCharacterEncoding("utf-8");
		String message = "멤버 정보 수정에 실패하였습니다.";
	
		// 대상 멤버의 정보 수정
		if (request.getMethod().equals("POST")) {
			MemberDao dao = new MemberDao();
			
			// 비번이 틀렸다면
			if (dao.login(vo) == null) {
				message = "아이디가 존재하지 않거나 비밀번호가 일치하지 않습니다";
			// 비번이 일치하고 수정에 성공했다면
			} else if (dao.modify(vo)) {
				message = "멤버 정보 수정에 성공하였습니다";
			}
		}
	%>
	<div id='memUpdate'>
		<h1>Member Update Page</h1>
		<p><label>결과 : </label><%=message %></p>
		<a href='index.jsp?aside=./control.jsp&content=./views/member/list.jsp'>돌아가기</a>
	</div>

</body>
</html>