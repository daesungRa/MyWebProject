<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Interface Element Page</title>
<style>
	#domElementTest #result {
		width: 400px;
		height: 40px;
		border: 1px solid #121212;
	}
	.color_m {
		background-color: #7777ff;
	}
	.color_w {
		background-color: #ff7777;
	}
</style>
</head>
<body id='bodyResult'>

	<div id='domElementTest'>
		<h2>Interface Element Page</h2>
		<div id='info'>
			setAttrubyte() | getAttribute() 함수를 활용한 엘리먼트 속성 변경<br/>
			남자 버튼은 파란색, 여자 버튼은 빨간색
		</div><br/>
		<label>
			<input type='radio' name='gender' />남자
		</label>
		<label>
			<input type='radio' name='gender' />여자
		</label>
		
		<h3>Result Area</h3>
		<div id='result'></div>
	</div>
	
	<script>
		var zone = document.getElementById('domElementTest');
		var buttons = zone.getElementsByTagName('input');
		var bodyResult = document.getElementById('bodyResult');
		var result = document.getElementById('result');
		
		buttons[0].onclick = function () {
			var att1 = document.createAttribute('class'); // 속성 생성
			var att2 = document.createAttribute('class'); // 속성 생성
			att1.nodeValue = 'color_m'; // 속성값 지정
			att2.nodeValue = 'color_w'; // 속성값 지정
			bodyResult.setAttributeNode(att1); // 원하는 위치에 속성 세팅
			result.setAttributeNode(att2); // 원하는 위치에 속성 세팅
		}
		buttons[1].onclick = function () {
			var att1 = document.createAttribute('class'); // 속성 생성
			var att2 = document.createAttribute('class'); // 속성 생성
			att1.nodeValue = 'color_w'; // 속성값 지정
			att2.nodeValue = 'color_m'; // 속성값 지정
			bodyResult.setAttributeNode(att1); // 원하는 위치에 속성 세팅
			result.setAttributeNode(att2); // 원하는 위치에 속성 세팅
		}
	</script>

</body>
</html>