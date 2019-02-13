<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jQuery Core(Get) Test01</title>
<script src='/js/jquery-3.3.1.min.js'></script>
<script>
	$(document).ready(function () {
		var li = $('#cont ul > li').get();
		var r = [];
		
		for (var k of li) { // li 자체가 아닌 li 내의 내용만 가져오는 반복문
			r.push(k.innerHTML);
		}
		$('#result').html(r.join(', '));
	});
</script>
</head>
<body>

	<div id='coreGet'>
		<h2>jQuery Core(Get) Test01</h2>
		
		<div id='cont'>
			<h3>명산을 찾아서</h3>
			<ul>
				<li>백두</li>
				<li>한라</li>
				<li>금강</li>
				<li>설악</li>
				<li>지리</li>
				<li>속리</li>
				<li>남산</li>
				<li>태백</li>
				<li>내장</li>
				<li>원미</li>
				<li>북한</li>
				<li>마니</li>
				<li>월악</li>
				<li>백운</li>
			</ul>
			<h3>Result</h3>
			<div id='result'></div>
		</div>
	</div>

</body>
</html>