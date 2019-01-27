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

	<c:if test="${not empty requestScope.data }">
		<c:set var="data" value="${requestScope.data}" scope="page"></c:set>
	</c:if>

	<div id='guestbookViewPage'>
		<h1>GuestBook List Page</h1>
		
		<c:if test="${requestScope.write == true }">
			<input type='button' name='btnCloseWrite' value='방명록 닫기' onclick='location.href="view.gb"' />
			<fieldset id='writeGuestbook' style='background: #cccccc;'>
				<legend>Write Guest Book</legend>
				<form name='guestbookNew' method='post' action='insert.gb'>
					<input type='text' name='id' value='${sessionScope.id }' readonly /><br/>				
					<textarea rows="6" cols="70" name='content' placeholder='내용을 입력하세요' style='resize: none;'></textarea><br/>
					<input type='hidden' name='pwd' value='-1' />
					<input type='submit' value='제출' name='btnInsertNew' onclick='funcInsert(this.form)' />
				</form>
			</fieldset>
		</c:if>
		<c:if test="${requestScope.write != true }">
			<input type='button' name='btnWrite' value='방명록 쓰기' onclick='location.href="viewGuestbook.gb"' />
		</c:if>

		<fieldset id='guestbookList' style='background: #cccccc;'>
			<legend>Guest Book List</legend>
			<c:forEach var='i' begin="0" end="${data.size() - 1 }" step="1" >
				<c:set var="vo" value="${data[i]}" scope="page"></c:set>
				<form name='guestbook${i}' method='post' action='modify.gb'>
					<input type='hidden' name='serial' value='${vo.serial }' />
					<label>작성자 / </label>
					<output class='output' name='id'>${vo.id }</output>
					<label>작성일 : </label>
					<input type='hidden' name='pwd' value='-1'/>
					<%-- <output class='output'>${vo.mdate }</output><br/> --%>
				
					<textarea rows="5" cols="60" name='content' style='resize: none;' readonly>${vo.content }</textarea><br/>
					<c:if test='${vo.id eq sessionScope.id}'>
						<input type='button' value='수정' name='btnModify' onclick='modifyOn(this.form)' />
						<input type='button' value='삭제' name='btnDelete' onclick='funcDelete(this.form)' />
					</c:if>
				</form>
			</c:forEach>
		</fieldset>
	</div>
	
	<script>
		function modifyOn (ff) {
			if (ff.btnModify.value == '저장') {
				var p = prompt("저장하려면 암호를 입력하세요", "");
				ff.pwd.value = p;
				ff.content.readOnly = true;
				ff.btnModify.value = '수정';
				ff.submit();
			} else {
				ff.content.readOnly = false;
				ff.btnModify.value = '저장';
			}
		}
		function funcInsert (ff) {
			var p = prompt("방명록을 등록하려면 암호를 입력하세요", "");
			ff.pwd.value = p;
			ff.submit();
		}		
		function funcDelete (ff) {
			var p = prompt("삭제하려면 암호를 입력하세요", "");
			ff.action = "delete.gb";
			ff.pwd.value = p;
			ff.submit();
		}
		function createWritePage () {
			location.href = "viewGuestbook.gb";
		}
	</script>

</body>
</html>