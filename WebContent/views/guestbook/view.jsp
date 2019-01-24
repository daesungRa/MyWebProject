<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GuestBook View Page</title>
</head>
<body>

	<div id='guestbookViewPage'>
		<h1>GuestBook View Page</h1>
		
		<c:set var="vo" value='<%=request.getAttribute(\"vo\") %>' scope="page"></c:set>
		
		<input type='text' name='id' value='${pageScope.vo.id }' placeholder='작성자' readonly />
		<%-- <input type='text' name='mdate' value='${pageScope.vo.mdate }' placeholder='작성일자' readonly /><br/>
		<textarea rows="15" cols="80" value='${pageScope.vo.content }' placeholder='내용' style='resize: none;' readonly></textarea><br/>
		 --%>
		<c:set var="id" value="<%=(String)session.getAttribute(\"id\") %>" scope="page"></c:set>
		<c:set var="name" value="<%=(String)session.getAttribute(\"name\") %>" scope="page"></c:set>
		
		<c:choose>
			<c:when test="${pageScope.id == null}">
				<input type='button' value='로그인' />
			</c:when>
			<c:when test="${id != null}">
				<input type='button' value='수정' />
				<input type='button' value='삭제' />
				<input type='button' value='취소' />
			</c:when>
		</c:choose>
	</div>

</body>
</html>