<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.myweb.memberBean.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			Connection conn = new DBConn().getConn();
			PreparedStatement ps = null;
			ResultSet rs = null;
			
			String sqlSearchPw = " select pwd from member where id = ? ";
			String sqlDelete = " delete from member where id = ? ";
			String pw = null;
			
			// 암호 확인
			try {
				ps = conn.prepareStatement(sqlSearchPw);
				ps.setString(1, request.getParameter("id"));
				rs = ps.executeQuery();
				
				if (rs.next()) {
					pw = rs.getString("pwd");
				}
				
				rs.close();
				ps.close();
				
				// 암호가 일치하면 삭제 작업 수행
				if (pw.equals(request.getParameter("pwd"))){
					ps = conn.prepareStatement(sqlDelete);
					ps.setString(1, request.getParameter("id"));
					int result = ps.executeUpdate();
					
					if (result > 0 ) {
						message = "멤버 정보 삭제에 성공하였습니다";
					}
				} else {
					message += "<br/>&nbsp;&nbsp;입력한 패스워드가 일치하지 않습니다";
				}
			} catch (Exception ex) {
				ex.printStackTrace();
			} finally {
				try {
					if (rs != null) rs.close();
					if (ps != null) ps.close();
					if (conn!= null) conn.close();
				} catch (Exception ex) { }
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