<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>jQuery Ajax Load test</title>
<link rel='stylesheet' href='https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css' />
<script src='/js/jquery-3.3.1.min.js'></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<style>
	.area {
		width: 250px;
		height: 100px;
		border: 1px solid black;
	}
</style>
<script>
	$(function () {
		$('#btn1').click(function () {
			$('#result1').load('/views/jquery/load.jsp #part1');
		})
		$('#btn1').click(function () {
			$('#result2').load('/views/jquery/load.jsp #part2');
		})
		$('#btn1').click(function () {
			$('#result3').load('/views/jquery/load.jsp #part3');
		})
	});
</script>
</head>
<body>

	<div id='tabWidget'>
		<h2>jQuery Ajax Load test</h2>
		<h3>Load Member info using ajax in jQuery</h3>
		
		<div id='cont'>
			<input type='button' value='첫번째 영역' id='btn1' />
			<div class='area' id='result1'></div>
			<input type='button' value='두번째 영역' id='btn2' />
			<div class='area' id='result2'></div>
			<input type='button' value='세번째 영역' id='btn3' />
			<div class='area' id='result3'></div>
		</div>
	</div>

</body>
</html>