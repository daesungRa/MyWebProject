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
<title>회원가입</title>
<link rel='stylesheet' href='./css/member.css' />
<script src='./js/member.js'></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
</head>
<body>

	<div id='insert'>
		<h1 id='title'>회원가입</h1>
		<form name='member' method='post' action='index.jsp?aside=./control.jsp&content=./views/member/insert_result.jsp' enctype="multipart/form-data">
			<label class='cont'>아이디</label>
			<input type='text' name='id' class='item' value='hong' />
			<input type='button' name='btnIdCheck' value='중복체크' />
			<input type='text' name='isChecked' value='unChecked' readonly/><br/>
			<label class='cont'>이 름</label>
			<input type='text' name='irum' class='item' value='gildong' /><br/>
			<label class='cont'>비밀번호</label>
			<input type="password" name='pwd' class='item' value='1111' /><br/>
			<label class='cont'>이메일</label>
			<input type='email' name='email' class='item' value='hong@gmail.com' /><br/>
			<label class='cont'>연락처</label>
			<input type='text' name='phone' class='item' value='010-1111-2222' /><br/>
			<label class='cont'>등록일</label>
			<input type="date" name='rdate' /><br/>
			<label class='cont'>우편번호</label>
			<input type='text' name='postal' value='12-123'  readonly/>
			<input type='button' name='btnPostal' value='우편번호 검색' /><br/>
			<label class='cont'>주 소</label>
			<input type='text' name='address' placeholder='주소를 입력하세요' size='50' readonly/><br/>
			<label class='cont'>추가주소</label>
			<input type='text' name='addressAdd' placeholder='추가 주소를 입력하세요' size='50' /><br/>
			<label class='cont'>증명사진</label>
			<input type='file' name='photo' /><br/>
			<label class='cont'>학 년</label>
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
		// 여기에 아이디 중복 확인 및 우편번호 로직 추가
		mainInsert();
	</script>

</body>
</html>