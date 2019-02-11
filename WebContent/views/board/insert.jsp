<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c' %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board Insert Page</title>
<link rel='stylesheet' href='/css/board.css' />
</head>
<body>

	<c:if test="${not empty requestScope.msg }">
		<script>alert(${requestScope.msg});</script>
	</c:if>

	<div id='boardInsertPage'>
		<h2>게시하기</h2>
		<form name='boardFrm' method='post' enctype='multipart/form-data'>
			<input type='text' name='userId' value='${sessionScope.id }' readonly /><br/>
			<input type='text' name='boardTitle' placeholder='제목을 입력하세요' /><br/>
			<textarea name='boardContent' placeholder='내용을 입력하세요' style='resize: none;' rows="10" cols="30"></textarea><br/>
			<input type='password' name='userPwd' placeholder='비밀번호를 입력하세요' /><br/><br/>
			
			<div id='attFile_zone'></div><br/>
			
			<input type='button' name='btnSubmit' value='제 출' onclick='funcBoardInsertAction(this.form);'/>
			<input type='button' name='btnCancel' value='취 소' onclick="location.href = 'list.brd';"/>
		</form>
	</div>

</body>
</html>