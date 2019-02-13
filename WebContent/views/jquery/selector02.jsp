<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jQuery Select Test02</title>
<script src='/js/jquery-3.3.1.min.js'></script>
<script>
	/*
	 * 1. 모든 span 의 넓이와 높이 외곽선 지정
	 * 2. id 가 ab 로 시작하는 요소의 배경색은 파랑
	 * 3. id 가 d 로 끝나는 요소의 문자색은 빨강
	 * 4. id 에 e 가 포함된 요소의 외곽선 색 지정
	 */
	$(document).ready(function () {
		$('#cont > span').css({"display":"inline-block", "width":"350px", "height":"100px", "margin-bottom":"10px", "border":"1px solid black"});
		$('#cont span[id^=ab]').css("background-color", "#0000ff");
		$('#cont span[id$=d]').css("color", "#ff0000");
		$('#cont span[id*=e]').css('border', '2px solid #00ff00');
	});
</script>
</head>
<body>

	<div id='selector02'>
		<h3>jQuery Select Test02</h3>
		<h4>&nbsp;&nbsp;ID, CLASS, Tag name 으로 선택</h4>
		
		<div id='cont'>
			<span id='abc'>SPAN</span><br/>
			<span id='abd'>SPAN</span><br/>
			<span id='abe'>SPAN</span><br/>
			<span id='ddd'>SPAN</span><br/>
		</div>
	</div>

</body>
</html>