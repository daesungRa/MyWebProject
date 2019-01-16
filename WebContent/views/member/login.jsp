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
<title>Login Page</title>
<link rel='stylesheet' href='../../css/index_large.css' media='screen and (min-width: 800px)' />
<link rel='stylesheet' href='../../css/index_mini.css' media='screen and (max-width: 799px)' />
<style>

</style>
<script>
	function funcLogin () {
		var frm = document.frm;
		var id = document.frm.id.value;
		var pwd = document.frm.pwd.value;
		
		if (id == '') frm.id.focus();
		else if (pwd == '') frm.pwd.focus();
		else frm.submit();
	}
</script>
</head>
<body>

	<%@ include file="../main/header.jsp" %>

	<div id='login'>
		<h1>gooogle</h1>
		
		<!-- 별도의 action 속성이 없으면, 데이터가 자기 자신 페이지로 전송됨 -->
		<form name='frm' method='POST'>
			<label>아이디 : </label>
			<input type='text' name='id' /><br/>
			<label>비밀번호 : </label>
			<input type='text' name='pwd' /><br/>
			<input type='button' value='로 그 인' id='btnLogin' onclick='funcLogin()'/>
			<p/>
			
			<a href='#' >아이디 찾기</a>
			<a href='#' >비밀번호 찾기</a>
			<a href='insert.jsp' >회원가입</a>
		</form>
		
		<%
			if (request.getMethod().equals("POST")) {
				// 순수 JSP 를 사용한 DB 연결
				String id = request.getParameter("id");
				String pwd = request.getParameter("pwd");
				
				Connection conn = new DBConn().getConn();
				PreparedStatement ps = null;
				ResultSet rs = null;
				
				String sql = " select * from member where id = ? and pwd = ? ";
				
				try {
					ps = conn.prepareStatement(sql);
					ps.setString(1, id);
					ps.setString(2, pwd);
					rs = ps.executeQuery();
					if (rs.next()) {
						out.println("방가방가!");
						String name = rs.getString("name");
						session.setAttribute("name", name);
						response.sendRedirect("/index.jsp");
					} else {
						out.println("안 방가..");
					}
				} catch (Exception ex) {
					out.println(ex.toString());
				}
			}
			
		%>
	</div>
	
	<%@ include file="../main/footer.jsp" %>

</body>
</html>