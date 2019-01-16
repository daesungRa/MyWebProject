<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Confirm Scope Result</title>
<style>
	#scopeResult > #interpreteResult {
		font-size: 8pt;
	}
</style>
</head>
<body>

	<div id='scopeResult'>
		<h1>Confirm Scope Result</h1>
		<p>각 스코프에 따른 name 속성값 확인하기</p>
		
		<div id='result'>
			<label>pageContext: </label>
			<%=pageContext.getAttribute("name") %><br/>
			<label>request: </label>
			<%=request.getAttribute("name") %><br/>
			<label>session: </label>
			<%=session.getAttribute("name") %><br/>
			<label>application: </label>
			<%=application.getAttribute("name") %><br/>
		</div>
		
		<p id='interpreteResult'>
			<ul>
				<li>해석 : <br/>현재 페이지의 이전 페이지인 scope.jsp 에서 세팅된 데이터들을 확인하는 것임<br/>
				페이지와 리퀘스트 값은 scope.jsp 에만 적용될 것이므로 현재 페이지에서는 사라짐<br/>
				그러나 session 은 현재 접속유저, application 은 웹앱 전체에 적용되는 key 와 value 이므로<br/>
				현재 페이지(scope_result.jsp) 에서도 확인 가능하다</li>
				<li>다만, 현재 접속 유저를 session 의 name 속성으로 판별하고 있는 경우,<br/>
				위와 같이 session.setAttribute("name", value) 방식으로 속성값을 변경한다면<br/>
				접속정보 자체가 달라질 수 있다(보통 절대불변인 id 값으로 판별함)</li>
			</ul>
		</p>
	</div>

</body>
</html>