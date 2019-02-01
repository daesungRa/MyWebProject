<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Guestbook Write Page</title>
</head>
<body>

	<fieldset id='writeGuestbook' style='background: #cccccc;'>
		<legend>Write Guest Book</legend>
		<form name='guestbookNew' method='post' action='insert.gb'>
			<input type='text' name='id' value='${sessionScope.id }' readonly /><br/>				
			<textarea rows="6" cols="70" name='content' placeholder='내용을 입력하세요' style='resize: none;'></textarea><br/>
			<input type='hidden' name='pwd' value='-1' />
			<input type='submit' value='제출' name='btnInsertNew' onclick='funcInsert(this.form)' />
		</form>
	</fieldset>

</body>
</html>