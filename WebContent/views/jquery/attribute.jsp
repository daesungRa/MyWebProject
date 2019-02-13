<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jQuery Attribute Test</title>
<script src='/js/jquery-3.3.1.min.js'></script>
<style>
	.bg {
		background-color: #7b9dfa;
	}
	#result {
		width: 560px;
		height: 200px;
		margin: 10px auto;
		border-radius: 5px;
	}
</style>
<script>
	$(document).ready(function () {
		$('#btnAddAttr').click(function () {
			$('#result').attr('class', 'bg');
		});
		$('#btnRemoveAttr').click(function () {
			$('#result').removeAttr('class');
		});
		$('#btnChangeAttr').click(function () {
			if ($(this).val() == 'Change Attr') {
				$(this).attr('value', '속성값 변경');				
			} else if ($(this).val() == '속성값 변경') {
				$(this).attr('value', 'Change Attr');
			}
		});
		$('#btnGetHtml').click(function () {
			$('#result').html($('#attribute > h2').html());
		});
		$('#btnGetText').click(function () {
			$('#result').text($('#attribute > h2').html());
		});
		$('#btnGetBg').click(function () {
			var v = $('#result').css('background-color');
			alert(v);
		});
	});
</script>
</head>
<body>

	<div id='attribute'>
		<h2>jQuery Attribute Test</h2>
		
		<div id='cont'>
			<input type='button' value='Add Attr' id='btnAddAttr' />
			<input type='button' value='Remove Attr' id='btnRemoveAttr' />
			<input type='button' value='Change Attr' id='btnChangeAttr' />
			<input type='button' value='getHTML' id='btnGetHtml' />
			<input type='button' value='getText' id='btnGetText' />
		</div>
		<div id='result'>이곳의 속성이 바뀜!!<br/></div>
		<input type='button' value='getBg' id='btnGetBg'?>
	</div>

</body>
</html>