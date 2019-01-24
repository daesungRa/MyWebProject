<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL: if, choose, forEach, forTokens</title>
</head>
<body>

	<div id="jstlTest">
		<h2>JSTL: if, choose, forEach, forTokens</h2>

		<h3>1. c:if</h3>
		<ul>
			<c:if test="true">
				<li>무조건 수행</li>
			</c:if>

			<c:if test="${param.name == 'bk'}">
				<li>name 파라미터의 값이 ${param.name} 입니다</li>
			</c:if>

			<c:if test="${param.age >= 18}">
				<li>나이는 18세 이상입니다</li>
			</c:if>
		</ul>
		
		<h3>2. c:choose</h3>
		<ul>
			<c:choose>
				<c:when test="${param.name == 'bk' }">
					<li>당신의 이름은 ${param.name } 입니다</li>
				</c:when>
				<c:when test="${param.age >= 18 }">
					<li>당신은 18세 이상입니다</li>
				</c:when>
				<c:otherwise>
					<li>당신은 'bk' 가 아니고 18세 이상이 아닙니다</li>
				</c:otherwise>
			</c:choose>
		</ul>
		
		<h3>3. c:forEach</h3>
		<ul>
			<c:forEach var="i" begin="1" end="100" step="2">
				<c:set var="sum" value="${sum + i }" />
			</c:forEach>
			<li>1 ~ 100 까지 홀수의 합: ${sum}</li>
		</ul>
		
		<h3>3. c:forTokens</h3>
		<ul>
			<c:out value="빨간색,주황색,노란색,초록색.파란색.남색,보라색"></c:out>
			<p>-- tokenizing! --</p>
			<c:forTokens var="token" items="빨간색,주황색,노란색,초록색.파란색.남색,보라색" delims=",.">
				${token}<br/>
			</c:forTokens>
		</ul>
	</div>

</body>
</html>