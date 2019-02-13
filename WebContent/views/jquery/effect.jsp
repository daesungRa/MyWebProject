<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jQuery Event test</title>
<script src='/js/jquery-3.3.1.min.js'></script>
<script>
	$(document).ready(function () {
		var target = $('#effectTest #result');
		target.css({"display":"none", "width":"300px", "height":"100px", "border":"1px solid black"});
		
		$('#btnShow01').click(function () {
			target.show();
		});
		$('#btnShow02').click(function () {
			target.show('fast');
		});
		$('#btnShow03').click(function () {
			target.show(2000);
		});
		
		$('#btnHide01').click(function () {
			target.hide();
		});
		$('#btnHide02').click(function () {
			target.hide('fast');
		});
		$('#btnHide03').click(function () {
			target.hide(2000);
		});
	});
</script>
</head>
<body>

	<div id='effectTest'>
		<h2>jQuery Effect test</h2>
		<h3>Effect (show | hide)</h3>
		
		<div id='cont'>
			<h3>힌트 보기</h3>
			<input type='button' id='btnShow01' value='show(default)' />
			<input type='button' id='btnShow02' value='show(fast)' />
			<input type='button' id='btnShow03' value='show(slow)' /><br/>
			
			<input type='button' id='btnHide01' value='hide(default)' />
			<input type='button' id='btnHide02' value='hide(fast)' />
			<input type='button' id='btnHide03' value='hide(slow)' />
		</div><br/>
		
		<div id='result'>
			<h4>hing</h4>
			문제에 대한 힌트
		</div>
	</div>

</body>
</html>