
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Scope Test</title>
<script>
	function mainScope () {
		var btn = document.getElementById('btn');
		
		btn.onclick = function () {
			location.href='index.jsp?aside=./views/index_jsp.jsp&content=./test/scope_result.jsp';
		}
	}
</script>
</head>
<body>

	<div id='scope'>
		<h1>Scope Test</h1>
		<p>데이터를 저장할 수 있는 4 가지 영역 테스트</p>
		
		<ul>
			<li>pageContext(page)</li>
			<li>request</li>
			<li>session</li>
			<li>application</li>
		</ul>
		
		<p>setAttribute(key, value) 사용<br/>key: name<br/>value: girigiri</p>
		
		<div id='content'>
			<%
				/*
				* 4 대 영역에 값을 대입하여 scope_result 에서 확인
				*/
				String key = "name";
				String value = "girigiri";
				
				pageContext.setAttribute(key, value);
				request.setAttribute(key, value);
				session.setAttribute(key, value);
				application.setAttribute(key, value);
			%>
			<input type='button' value='저장 결과 확인' id='btn' /><br/><br/>
		</div>
	</div>
	
	<script>mainScope()</script>

</body>
</html>