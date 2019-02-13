<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jQuery Filter Test01</title>
<script src='/js/jquery-3.3.1.min.js'></script>
<script>
	/*
	 * 1. body 안에 있는 모든 span 의 넓이와 높이를 적당히 지정
	 * 2. 첫번재와 마지막번째 span 의 바탕생 지정
	 * 3. 짝수번째와 홀수번째의 글자색을 서로 다르게 지정
	 * 4. 5번째 이후의 span 외곽선을 다른 것보다 더 굵게
	 */
	$(document).ready(function () {
		$('#cont span').css({"display":"inline-block", "width":"200px", "height":"40px", "margin-bottom":"5px", "border":"1px solid black"});
		$('#cont span:first, #cont span:last').css('background-color', '#fcb669');
		$('#cont span:even').css('color', '#ff0000');
		$('#cont span:odd').css('color', '#0000ff');
		$('#cont span:gt(4)').css('border', '5px solid red');
	});
</script>
</head>
<body>

	<div id='filter01'>
		<h3>jQuery Filter Test01</h3>
		
		<div id='cont'>
			<span>111</span><br/>
			<span>222</span><br/>
			<span>333</span><br/>
			<span>444</span><br/>
			<span>555</span><br/>
			<span>666</span><br/>
			<span>777</span><br/>
			<span>888</span><br/>
			<span>999</span><br/>
			<span>101010</span><br/>
		</div>
	</div>

</body>
</html>