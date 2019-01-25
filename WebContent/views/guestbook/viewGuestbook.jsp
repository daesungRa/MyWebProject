<%@page import="java.util.Date"%>
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

	<c:set var="data" value="${requestScope.data}" scope="page"></c:set>

	<div id='guestbookViewPage'>
		<h1>GuestBook List Page</h1>
		<input type='button' name='btnWrite' value='방명록 쓰기' onclick='createWritePage()' />
		
		<c:if test="${param.write == true }">
			<fieldset id='writeGuestbook' style='background: #aaaaaa;'>
				<legend>Write Guest Book</legend>
				<form name='guestbookNew' method='post' action='insert.do'>
					<input type='text' name='id' value='${sessionScope.id }' readonly /><br/>				
					<textarea rows="6" cols="70" name='content' placeholder='내용을 입력하세요' style='resize: none;'></textarea><br/>
					<input type='submit' value='제출' name='btnInsertNew' />
				</form>
			</fieldset>
		</c:if>

		<fieldset id='guestbookList' style='background: #aaaaaa;'>
			<legend>Guest Book List</legend>
			<c:forEach var='i' begin="1" end="${requestScope.data.size() }" step="1" >
				<c:set var="vo" value="${pageScope.data.get(i)}" scope="page"></c:set>
				<form name='guestbook${i}' method='post' action='modify.gb'>
					<label>작성자 / </label>
					<output class='output'>${vo.id }</output>
					<label>작성일 : </label>
					<output class='output'>${vo.mdate }</output><br/>
				
					<textarea rows="5" cols="60" name='content' style='resize: none;' readonly>${vo.content }</textarea><br/>
					<input type='button' value='수정' name='btnModify' onclick='modifyOn(this.form)' />
					<input type='button' value='삭제' name='btnDelete' onclick='funcDelete(this.form)' />
				</form>
			</c:forEach>
		</fieldset>
	</div>
	
	<script>
		function modifyOn (ff) {
			if (ff.btnModify.value == '저장') {
				var p = prompt("저장하려면 암호를 입력하세요");
				ff.content.readOnly = true;
				ff.btnModify.value = '수정';
				ff.submit();
			} else {
				ff.content.readOnly = false;
				ff.btnModify.value = '저장';
			}
		}
		
		function funcDelete (ff) {
			var p = prompt("삭제하려면 암호를 입력하세요");
			ff.submit();
		}
		function createWritePage () {
			location.href = "index.jsp?aside=/control.jsp&content=/views/guestbook/viewGuestbook.jsp&write=true";
		}
	</script>

</body>
</html>