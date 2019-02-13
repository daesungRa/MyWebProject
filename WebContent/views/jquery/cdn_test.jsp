<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jQuery CDN Test</title>
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script>
	$(document).ready(function(){
		$('#cont').html('하하하');
	});
</script>
</head>
<body>

	<div id='cdnTest'>
		<h3>jQuery CDN Test</h3>
		
		<div id='cont'></div>
	</div>

</body>
</html>