<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>check id</title>
<script>
	function checkId (id) {
		var result = 'Checked';
		var container = document.getElementById('idCheck');
		container.id.value = id;
		
		return result;
	}
</script>
</head>
<body>

	<div id='idCheck'>
		<h1>아이디 중복확인</h1>
		<input type='text' name='id' disabled/>
		<input type='button' name='btnIdCheck' value='중복확인'/>
	</div>

</body>
</html>