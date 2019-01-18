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
			Connection conn = new DBConn().getConn();
			PreparedStatement ps = null;
			
			// 아이디, 최초등록일은 수정 불가
			// 비번은 확인용이고, 비번변경은 추가 페이지에서 처리
			String sql = " update member set name = ?, email = ?, phone = ?, postal = ?, address = ?, photo = ?, grade = ? "
							+ "	where id = ? ";
			
			try {
				ps = conn.prepareStatement(sql);
				ps.setString(1, request.getParameter("irum"));
				ps.setString(2, request.getParameter("email"));
				ps.setString(3, request.getParameter("phone"));
				ps.setString(4, request.getParameter("postal"));
				ps.setString(5, request.getParameter("address"));
				ps.setString(6, request.getParameter("photoName"));
				ps.setInt(7, Integer.parseInt(request.getParameter("grade")));
				ps.setString(8, request.getParameter("id"));
				int result = ps.executeUpdate();
				
				if (result > 0 ) {
					message = "멤버 정보 수정에 성공하였습니다";
				}
			} catch (Exception ex) {
				ex.printStackTrace();
			} finally {
				try {
					if (ps != null) ps.close();
					if (conn!= null) conn.close();
				} catch (Exception ex) { }
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