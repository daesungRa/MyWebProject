<%@page import="com.myweb.memberBean.MemberVo"%>
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

	<div id='login'>
		<h1>gooogle</h1>
		
		<!-- 별도의 action 속성이 없으면, 데이터가 자기 자신 페이지로 전송됨 -->
		<form name='frm' method='POST' action="login.mb">
			<label>아이디 : </label>
			<input type='text' name='id' /><br/>
			<label>비밀번호 : </label>
			<input type='text' name='pwd' /><br/>
			<input type='button' value='로 그 인' id='btnLogin' onclick='funcLogin()'/>
			<p/>
			
			<a href='/index.jsp?aside=/control.jsp&content=/views/member/findId.jsp' >아이디 찾기</a>
			<a href='/index.jsp?aside=/control.jsp&content=/views/member/findPwd.jsp' >비밀번호 찾기</a>
			<a href='/index.jsp?aside=/control.jsp&content=/views/member/insert.jsp' >회원가입</a>
		</form>
	</div>

</body>
</html>