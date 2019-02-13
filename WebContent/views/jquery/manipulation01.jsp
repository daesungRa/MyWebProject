<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jQuery Manipulation Test01</title>
<script src='/js/jquery-3.3.1.min.js'></script>
<script>
	$(document).ready(function () {
		var cnt = 0;
		$('#cnt').html(cnt);
		$('#cnt').css({"float":"right", "width":"30px"});
		$('#btnAppend').click(function () {
			$('#result').append('<h3>APPEND ' + cnt + ' </h3>');
			
			cnt++;
			$('#cnt').html(cnt);
		});
		$('#btnRemove').click(function () {
			// filter and remove
			// $('#result h3:last-child').remove();
			$('#result h3').last().remove();

			if (cnt > 0) {
				cnt--;
			}
			$('#cnt').html(cnt);
		});
	})
</script>
</head>
<body>

	<div id='manipulation01'>
		<h3>jQuery Manipulation Test01</h3>
		<span id='cnt'></span>
		
		<div id='cont'>
			<input type='button' value='APPEND' id='btnAppend' />
			<input type='button' value='REMOVE' id='btnRemove' />
		</div><br/>
		<div id='result'></div>
	</div>

</body>
</html>