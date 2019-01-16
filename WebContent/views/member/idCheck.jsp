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
<title>check id</title>
<script>
	window.onload = function () {
		var btn = document.getElementById('btnIdCheck');
		btn.onclick = function () {
			var opener = window.opener.document.getElementById('content');
			// opener 의 체크확인여부 박스에 isChecked 의 value 를 삽입한다
			// 기본 unChecked 이며, 사용 가능한 아이디일 시에만 checked 로 세팅됨
			self.close();
		}
	}
</script>
</head>
<body>

	<%
		String id = request.getParameter("id");
		String result = "unChecked";
		String isChecked = "unChecked";
		
		Connection conn = new DBConn().getConn();
		String sql = " select * from member where id = ? ";
	
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setString(1, id);
		ResultSet rs = ps.executeQuery();
		
		if (rs.next()) {
			result = "이미 사용중인 아이디입니다.";
		} else {
			result = "사용 가능한 아이디입니다.";
			isChecked = "checked";
		}
	%>

	<div id='idCheck'>
		<h1>아이디 중복확인</h1>
		<label>아이디 : </label>
		<input type='text' name='id' value=<%=id %> disabled/><br/>
		<label>확인 여부 : </label>
		<input type='text' name='result' value='<%=result %>' disabled /><br/>
		<input type='hidden' name='isChecked' value=<%=isChecked %> disabled/><br/>
		<input type='button' id='btnIdCheck' value='확인'/>
	</div>

</body>
</html>