<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv='Cache-Control' content='no-cache' />
<meta http-equiv='Pragma' content='no-cache' />
<meta http-equiv='Expires' content='1' />
<title>회원가입</title>
<link rel='stylesheet' href='../styleTest/member.css' />
<script src='../js/member.js'></script>
</head>
<body>

	<div id='insert'>
		<h1 id='title'>회원가입</h1>
		<form name='member' method='post' action='insert_result.jsp'>
			<label>아이디</label>
			<input type='text' name='id' class='item' value='hong' /><br/>
			<label>이 름</label>
			<input type='text' name='irum' class='item' value='gildong' /><br/>
			<label>비밀번호</label>
			<input type="password" name='pwd' class='item' value='1111' /><br/>
			<label>이메일</label>
			<input type='email' name='email' class='item' value='hong@gmail.com' /><br/>
			<label>연락처</label>
			<input type='text' name='phone' class='item' value='010-1111-2222' /><br/>
			<label>등록일</label>
			<input type="date" name='rdate' /><br/>
			<label>우편번호</label>
			<input type='text' name='postal' value='12-123' /><br/>
			<label>주 소</label>
			<input type='text' name='address' value='서울' size='50' /><br/>
			<label>증명사진</label>
			<input type='file' name='photo' /><br/>
			<label>학 년</label>
			<select size='4' name='grade'>
				<option value='1' selected>1 학년</option>
				<option value='2'>2 학년</option>
				<option value='3'>3 학년</option>
				<option value='4'>4 학년</option>
			</select>
			
			<br/>
			
			<input type='button' name='btnSubmit' value='등 록' />
			<img id='image' name='image' src='https://via.placeholder.com/150x200' width='150px' height='200px' />
		</form>
	</div>
	
	<script>
		mainInsert();
	</script>

</body>
</html>