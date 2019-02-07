<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board Insert Page</title>
</head>
<body>

	<div id='boardInsertPage'>
		<h2>게시하기</h2>
		<form name='boardFrm' method='post' enctype='multipart/form-data'>
			<input type='text' name='userId' value='${sessionScope.id }' readonly /><br/>
			<input type='text' name='title' placeholder='제목을 입력하세요' /><br/>
			<textarea name='content' placeholder='내용을 입력하세요' style='resize: none;' rows="10" cols="30"></textarea><br/>
			<input type='password' name='userPwd' placeholder='비밀번호를 입력하세요' /><br/>
			<input type='button' name='btnSubmit' value='제 출' />
			<input type='button' name='btnCancel' value='취 소' />
		</form>
	</div>

</body>
</html>