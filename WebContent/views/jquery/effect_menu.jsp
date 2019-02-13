<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jQuery Event test</title>
<script src='/js/jquery-3.3.1.min.js'></script>
<style>
	input[type=button] {
		width: 100px;
	}
	input[type=button]:hover {
		cursor: pointer;
		background-color: black;
		color: white;
	}
	.result {
		/* position: absolute;
		top: 45px;
		left: 0; */
		display: none;
		width: 100px;
		height: 186px;
		background-color: #ddd;
		vertical-align: top;
	}
	.menuList {
		width: 95px;;
		height: 20px;
		padding: 3px 0 3px 5px;
		border-bottom: 1px solid black;
	}
	.menuList:hover {
		cursor: pointer;
		background-color: black;
		color: white;
	}
</style>
<script>
	$(document).ready(function () {
		$('#btnTg01').click(function () {
			$('#result01').slideToggle(400);
		});
		$('#btnTg02').click(function () {
			$('#result02').animate({width:'toggle'}, 350);
		});
		$('#btnTg03').click(function () {
			$('#result03').slideToggle(2000);
		});
	});
</script>
</head>
<body>

	<div id='effectTest02'>
		<h2>jQuery Effect test</h2>
		<h3>Effect (toggle)</h3>
		
		<div id='cont' style='position: relative;'>
			<br/>
			<input type='button' id='btnTg01' value='show(default)' />
			<input type='button' id='btnTg02' value='show(fast)' />
			<input type='button' id='btnTg03' value='show(slow)' /><br/>
			
			<div class='result' id='result01'>
				<div class='menuList'>222</div>
				<div class='menuList'>222</div>
				<div class='menuList'>333</div>
				<div class='menuList'>444</div>
				<div class='menuList'>222</div>
				<div class='menuList'>333</div>
				<div class='menuList'>444</div>
			</div>
			<div class='result' id='result02' style='position: absolute; top: 45px; left: 101px;'>토글 2</div>
			<div class='result' id='result03' style='position: absolute; top: 45px; left: 202px;'>토글 3</div>
		</div>
	</div>

</body>
</html>