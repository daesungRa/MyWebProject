<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c' %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board View Page</title>
</head>
<body>

	<c:if test="${not empty requestScope.msg }">
		<script>alert(${requestScope.msg});</script>
	</c:if>
	<c:if test="${not empty requestScope.vo }">
		<c:set var="vo" value="${requestScope.vo }" ></c:set>
	</c:if>

	<div id='boardViewPage'>
		<h2>게시글 보기</h2>
		<label for="author">작성자</label>
		<input type='text' id='author' value='${vo.userId }' readonly /><br/>
		<label for="boardTitle">제목</label>
		<input type='text' id='boardTitle' value='${vo.subject }' readonly /><br/>
		<label for="boardContent">내용</label>
		<textarea id='boardContent' rows="10" cols="30" style='resize: none;' readonly>${vo.content }</textarea><br/>
		
		<c:choose>
			<c:when test="${vo.userId == sessionScope.id }">
				<input type='button' id='btnModify' value='수정' onclick='funcBoardModify' />
				<input type='button' id='btnDelete' value='삭제' onclick='funcDeleteAction();' />
			</c:when>
			<c:otherwise>
				<input type='button' value='목록' onclick='location.href = "list.brd";' />
			</c:otherwise>
		</c:choose>
	</div>

</body>
</html>