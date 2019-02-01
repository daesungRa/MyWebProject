<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GuestBook List Page</title>
</head>
<body>

	<div id='guestbookListPage'>
		<div id='title'>
			<img src='./images/damuni.jpg' id='damuni'/>
			<h1>GuestBook List Page</h1>
		</div>
		
		<form name='frm' action='list.do' method='post'>
			<input type='search' name='search' placeholder='검색어 입력' />
			<input type='hidden' name='searchHidden' />
			<input type='button' name='btnSearch' value='방명록 검색' />
			<input type='button' name='btnSearchAll' value='전체 검색' />
			<input type='hidden' name='id' />
			<input type='hidden' name='nowPage' value='${(param.nowPage == null)? 1 : param.nowPage}' />
		</form>
		
		<div id='subject'>
			<span class='serial'>No</span>
			<span class='id'>ID</span>
			<span class='mdate'>Date</span>
		</div>
		
		<div id='guestbookList'>
			
		</div>
		
		<%-- <div id='btnZone'>
			<c:if test="">
				<input type='button' value='HEAD' />
				<input type='button' value='PRE' />
			</c:if>
			<c:forEach var="" begin="" end="" step="">
				<input type='button' class='btnCircle' value='' />
			</c:forEach>
			<c:if test="">
				<input type='button' value='NEXT' />
				<input type='button' value='TAIL' />
			</c:if>
		</div> --%>
	</div>
	
	<script>listMain();</script>

</body>
</html>