<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ID 찾기 페이지</title>
</head>
<body>

	<c:if test="${not empty requestScope.findResultId }">
		<script>alert("찾는 아이디는 ${requestScope.findResultId} 입니다.")</script>
	</c:if>

	<div id="findId">
		<h1>ID 찾기 페이지</h1>
		
		<form name='frm' action='findId.mb' method='post'>
			<output class='output'>가입 시 입력한 이메일을 입력하세요</output><br/>
			<input type='text' name='email' placeholder='이메일 입력' />
			<input type='submit' value='제 출' />
		</form>
	</div>

</body>
</html>