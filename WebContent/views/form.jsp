<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Form Test Page</title>
</head>
<body>

	<div id='formTest'>
		<h1>This is Form test page</h1>
		
		<form action='index.jsp' method='post'>
			<input type='hidden' name='aside' value='./views/index_jsp.jsp' />
			<input type='hidden' name='content' value='./views/viewParam.jsp' />
			이름: <input type='text' name='name' size='10' /><br/>
			주소: <input type='text' name='address' size='50' /><br/>
			좋아하는 동물: 
				<label>
					<input type='checkbox' name='pet' value='dog' />강아지
				</label>
				<label>
					<input type='checkbox' name='pet' value='cat' />고양이
				</label>
				<label>
					<input type='checkbox' name='pet' value='pig' />돼지<br/>
				</label>
			<input type='submit' value='전송' /><br/>
		</form>
	</div>

</body>
</html>