<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GuestBook Insert Page</title>
<script type="text/javascript" src='./js/guestbook.js'></script>
</head>
<body>

	<div id='guestbookInsertPage'>
		<h1>GuestBook Insert Page</h1>
		
		<form name='frm' action='' method='post'>
			<input type='text' name='id' placeholder='작성자'/><br/>
			<textarea cols="80" rows="15" name='content' placeholder='내용을 입력하세요' style='resize: none;'></textarea><br/>
			<label class='frmLabel'>암호&nbsp;&nbsp; : &nbsp;&nbsp;</label>
			<input type='password' name='pwd'  placeholder='암호를 입력하세요' /><br/><br/>
			<input type='button' name='btnSubmit' value='방명록 쓰기' />
		</form>
	</div>
	
	<script>insertMain();</script>

</body>
</html>