<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jQuery Traverse Test01</title>
<script src='/js/jquery-3.3.1.min.js'></script>
<script>
	$(document).ready(function () {
		// 3 의 배수 위치에 있는 문자색 변경
		$('#cont li').filter(function (index) {
			return index % 3 == 0;
		}).css('color', '#f00');
		
		// 3 ~ 6 까지를 slice 로 배경색 지정
		$('#cont li').slice(3, 7).css('background-color', '#ddf');
	});
</script>
</head>
<body>

	<div id='traverse01'>
		<h3>jQuery Traverse Test01</h3>
		
		<div id='cont'>
			<h4>명산을 찾아서</h4>
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
		</div>
	</div>

</body>
</html>