<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GuestBook List Page</title>
</head>
<body>

	<div id='guestbookListPage'>
		<h1>GuestBook List Page</h1>
		
		<form name='frm' action='view.do' method='post'>
			<input type='text' name='serial' placeholder='serial 입력' />
			<input type='submit' value='방명록 검색' />
		</form>
	</div>

</body>
</html>