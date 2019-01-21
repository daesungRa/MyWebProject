<%@page import="com.myweb.memberDao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="vo" class="com.myweb.memberBean.MemberVo" scope="page"/>
<jsp:setProperty name="vo" property="*" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 완료</title>
</head>
<body>

	<%
		response.setCharacterEncoding("utf-8");
		String message = "멤버 등록에 실패하였습니다.";
		
		MemberDao dao = new MemberDao();
		boolean result = dao.insert(vo); // jsp:useBean 태그로 vo 자동생성됨
		
		if (result) {
			message = "멤버 등록에 성공하였습니다.";
		}
	%>
	
	<div id='memInsert'>
		<h1>Member Insert Page</h1>
		<p><label>결과 : </label><%=message %></p>
		<a href='index.jsp?aside=./control.jsp&content=./views/member/list.jsp'>돌아가기</a>
	</div>

</body>
</html>