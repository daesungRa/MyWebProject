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
<meta http-equiv='Cache-Control' content='no-cache' />
<meta http-equiv='Pragma' content='no-cache' />
<meta http-equiv='Expires' content='1' />
<title>Modify Member Info</title>
<link rel='stylesheet' href='./css/member.css' />
<script src='./js/member.js'></script>
</head>
<body>

	<%
		// 추후 vo 로 전환
		String id = null;
		String name = null;
		String pwd = null;
		String email = null;
		String phone = null;
		String rdate = null;
		String postal = null;
		String address = null;
		String photo = null;
		if (request.getMethod().equals("POST")) {
			id = request.getParameter("id");
			out.print("<script>alert(" + id + ")</script>");
			
			int grade = 0;
			String sql = " select * from member where id = ? ";
			
			Connection conn = new DBConn().getConn();
			PreparedStatement ps = null;
			ResultSet rs = null;
			
			try {
				ps = conn.prepareStatement(sql);
				ps.setString(1, id);
				rs = ps.executeQuery();
				
				if (rs.next()) {
					name = rs.getString("name");
					pwd = rs.getString("pwd");
					email = rs.getString("email");
					phone = rs.getString("phone");
					rdate = rs.getString("rdate");
					postal = rs.getString("postal");
					address = rs.getString("address");
					photo = rs.getString("photo");
					grade = rs.getInt("grade");
				} else {
					out.print("<script>alert('해당 유저가 존재하지 않습니다')</script>");
				}
			} catch (Exception ex) {
				out.print(ex.toString());
			} finally {
				try {
					if (rs != null) rs.close();
					if (ps != null) ps.close();
					if (conn != null) conn.close();
				} catch (Exception ex) { }
			}
		}
	%>

	<div id='modifyPage'>
		<h1 id='title'>Modify Member Info</h1>
		<p>멤버정보 수정 페이지입니다</p>
		<form name='member' method='post' action='modify_result.jsp'>
			<label>아이디</label>
			<input type='text' name='id' value='<%=id %>' /><br/>
			<label>이 름</label>
			<input type='text' name='irum' value=<%=name %> /><br/>
			<label>비밀번호</label>
			<input type="password" name='pwd' value=<%=pwd %> /><br/>
			<label>이메일</label>
			<input type='email' name='email' value=<%=email %> /><br/>
			<label>연락처</label>
			<input type='text' name='phone' value=<%=phone %> /><br/>
			<label>등록일</label>
			<input type="date" name='rdate' value=<%=rdate %>/><br/>
			<label>우편번호</label>
			<input type='text' name='postal' value=<%=postal %> /><br/>
			<label>주 소</label>
			<input type='text' name='address' value=<%=address %> size='50' /><br/>
			<label>증명사진</label>
			<input type='file' name='photo' value=''/><br/>
			<label>학 년</label>
			<select size='4' name='grade'>
				<option value='1' selected>1 학년</option>
				<option value='2'>2 학년</option>
				<option value='3'>3 학년</option>
				<option value='4'>4 학년</option>
			</select>
			
			<br/>
			
			<input type='submit' value='수 정' />
			<input type='button' value='취 소' />
		<img id='image' name='image' src='https://via.placeholder.com/150x200' width='150px' height='200px' />
		</form>
	</div>
	
	<script>mainModify();</script>
	
</body>
</html>