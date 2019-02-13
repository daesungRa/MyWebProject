<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jQuery Select Test01</title>
<script src='/js/jquery-3.3.1.min.js'></script>
<script>
	$(document).ready(function () {
		/* $('#cont').css('height', '400px');
		$('#cont').css('border', '1px solid black'); */
		
		$('#cont').css({"width":"615px", "height":"400px", "border":"1px solid black"});
		
		$('.p1').css('color', '#0000ff');
		
		/* $('#cont div').css('width', '300px');
		$('#cont div').css('height', '60px');
		$('#cont div').css('margin-bottom', '10px');
		$('#cont div').css('background-color', '#3b8cdd'); */
		
		$('#cont div').css({"width":"300px", "height":"60px", "margin-bottom":"10px", "background-color":"#3b8cdd"});
	});
</script>
</head>
<body>

	<div id='selector01'>
		<h3>jQuery Select Test01</h3>
		
		<div id='cont'>
			<p class='p1'>class p1</p>
			<p class='p1'>class p1</p>
			
			<div>Inner DIV</div>
			<div>Inner DIV</div>
		</div>
	</div>

</body>
</html>