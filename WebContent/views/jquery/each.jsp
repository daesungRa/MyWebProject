<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jQuery Core(Each) Test02</title>
<script src='/js/jquery-3.3.1.min.js'></script>
<script>
	$(document).ready(function () {
		$('#cont > div').css({"display":"inline-block", "width":"300px", "height":"100px", "padding-top":"20px", "line-height":"35px", "text-align":"center", "border":"1px solid black"});
		
		var bg = ['#eee', '#f00', '#0f0', '#00f', '#ff0'];
		
		$('#cont > div').each(function (index) {
			$(this).css('background-color', bg[index]);
		});
	});
</script>
</head>
<body>

	<div id='coreEach'>
		<h2>jQuery Core(Each) Test02</h2>
		
		<div id='cont'>
			<div class='d'>1111</div>
			<div class='d'>2222</div>
			<div class='d'>3333</div>
			<div class='d'>4444</div>
			<div class='d'>5555</div>
		</div>
	</div>

</body>
</html>