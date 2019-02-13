<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jQuery Library Test</title>
<script src='/js/jquery-3.3.1.min.js'></script>
<script>
	// window.onload = function ()
	$(document).ready(function () {
		$('#cont').html('이 메시지가..');
	});
</script>
</head>
<body>

	<div id='jquery'>
		<h3>jQuery Library Test</h3>
		
		<div id='cont'></div>
	</div>
</body>
</html>