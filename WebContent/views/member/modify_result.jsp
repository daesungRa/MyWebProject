<%@page import="com.myweb.memberBean.MemberVo"%>
<%@page import="com.myweb.fileuploadBean.FileUpload"%>
<%@page import="com.myweb.memberDao.MemberDao"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.myweb.memberBean.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <jsp:useBean id="vo" class="com.myweb.memberBean.MemberVo" scope="page"/>
<jsp:setProperty name="vo" property="*" /> --%>
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
		MemberDao dao = null;
		MemberVo vo = null;
	
		// 대상 멤버의 정보 수정
		if (request.getMethod().equals("POST")) {
			dao = new MemberDao();
			vo = new FileUpload(request).getVo();
			out.print(vo.getPhoto());			
			
			// 수정에 성공했다면 
			if (dao.modify(vo)) {
				message = "멤버 정보 수정에 성공하였습니다";
			}
		}
	%>
	<div id='memUpdate'>
		<h1>Member Update Page</h1>
		<p><label>결과 : </label><%=message %></p>
		<form name='frm' method='post' action='index.jsp?aside=./control.jsp&content=./views/member/list.jsp'>
			<input type='submit' value='목록으로' name='btnSubmit'/>
			<input type='hidden' name='search' value='<%=vo.getSearch() %>' />
			<input type='hidden' name='nowPage' value='<%=vo.getNowPage() %>' />
		</form>
	</div>

</body>
</html>