<%@page import="com.myweb.fileuploadBean.FileUpload"%>
<%@page import="com.myweb.memberBean.MemberVo"%>
<%@page import="com.myweb.memberDao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <jsp:useBean id="vo" class="com.myweb.memberBean.MemberVo" scope="page"/>
<jsp:setProperty name="vo" property="*" /> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 결과 페이지</title>
</head>
<body>

	<%
		response.setCharacterEncoding("utf-8");
		String message = "멤버 등록에 실패하였습니다.";
		
		MemberDao dao = new MemberDao();
		// FileUpload 모듈을 활용해 요청 정보 내의 파일을 업로드하고, 최종적으로 세팅된 vo 객체를 반환함
		MemberVo vo = new FileUpload(request).getVo();
		// 파일 업로드 후 세팅된 vo 객체를 활용해 DB 에 insert 작업 수행
		boolean result = dao.insert(vo);
		
		if (result) {
			message = "멤버 등록에 성공하였습니다.";
		}
	%>
	
	<div id='memInsert'>
		<h1>Member Insert Page</h1>
		<p><label>결과 : </label><%=message %></p>
		<a href='../../index.jsp?aside=./control.jsp&content=./views/member/list.jsp'>돌아가기</a>
	</div>

</body>
</html>