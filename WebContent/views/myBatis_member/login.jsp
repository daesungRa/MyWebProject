<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div id='mybatis_member'>
		<h3>LOGIN</h3>
		<form name='loginForm' method='post' action='login_result.jsp'>
			<label for='id'>아이디</label>
			<input type='text' name='id' value='hong' /><br/>
			<label for='pwd'>암호</label>
			<input type='password' name='pwd' value='1111' /><br/>
			<input type='submit' value='로그인' />
		</form>
	</div>

</body>
</html>