<%@page import="com.myweb.guestbookBean.GuestBookVo"%>
<%@page import="java.util.List"%>
<%@page import="com.myweb.guestbookDao.GuestBookDaoImpl"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GuestBook View Page</title>
</head>
<body>

	<%
		// 페이지 최초 로드 시 기본 전체검색 및 페이징 처리를 위한 변수들 세팅
		// data, nowBlock, startPage, endPage, nowPage, totBlock, totPage
		// 최초 로드 이후에는 ajax 를 활용해 부분적으로 갱신됨
		GuestBookDaoImpl dao = new GuestBookDaoImpl();
		List<GuestBookVo> data = dao.list("", 1);
		int nowBlock = dao.nowBlock;
		int startPage = dao.startPage;
		int endPage = dao.endPage;
		int nowPage = dao.nowPage;
		int totBlock = dao.totBlock;
		int totPage = dao.totPage;
		
		pageContext.setAttribute("data", data);
		pageContext.setAttribute("nowBlock", dao.nowBlock);
		pageContext.setAttribute("startPage", dao.startPage);
		pageContext.setAttribute("endPage", dao.endPage);
		pageContext.setAttribute("nowPage", dao.nowPage);
		pageContext.setAttribute("totBlock", dao.totBlock);
		pageContext.setAttribute("totPage", dao.totPage);
		
		if (data.size() == 0) {
			out.print("<script>alert(\"검색 결과가 없습니다\");</script>");
		}
	%>

	<div id='guestbookViewPage'>
		<h1>GuestBook List Page</h1>
		<input type='button' id='btnWrite' value='방명록 쓰기' />
		<div id='writePlace'></div>
		
		<br/><br/>
		<form name='member' method='post' action='list.gb'>
			<input type='search' name='search' value='${requestScope.search }' />
			<input type='hidden' name='searchHidden' value='' />
			<input type='hidden' name='id' value='' />
			<input type='button' name='btnSearch' value='검색' onclick='funcSearch(this.form)' />
			<input type='button' name='btnSearchAll' value='전체검색' onclick='funcSearch(this.form)' />
			<input type='hidden' name='nowPage' value='${(requestScope.nowPage == null)? 1 : requestScope.nowPage}' />
		</form>

		<fieldset id='guestbookList' style='background: #cccccc;'>
			<legend>Guest Book List</legend>
			<c:if test="${fn:length(pageScope.data) > 0 }">
				<c:forEach var='i' begin="0" end="${pageScope.data.size() - 1 }" step="1" >
					<c:set var="vo" value="${pageScope.data[i]}" scope="page"></c:set>
					<form name='guestbook${i}' method='post' action='modify.gb'>
						<input type='hidden' name='serial' value='${vo.serial }' />
						<label>작성자 / </label>
						<output class='output' name='id'>${vo.id }</output>
						<label>작성일 : </label>
						<input type='hidden' name='pwd' value='-1'/><br/>
						<%-- <output class='output'>${vo.mdate }</output><br/> --%>
					
						<textarea rows="5" cols="60" name='content' style='resize: none;' readonly>${vo.content }</textarea><br/>
						<c:if test='${vo.id eq sessionScope.id}'>
							<input type='button' value='수정' name='btnModify' onclick='modifyOn(this.form)' />
							<input type='button' value='삭제' name='btnDelete' onclick='funcDelete(this.form)' />
						</c:if>
					</form>
				</c:forEach>
			</c:if>
			
			<div id='btnZone'>
			<c:if test="${pageScope.nowBlock > 1 }">
				<input type='button' value='HEAD' onclick='movePage(1)' />
				<input type='button' value='PRE' onclick='movePage(${pageScope.startPage - 1})' />
			</c:if>
			
			<c:forEach var="j" begin="${pageScope.startPage}" end="${pageScope.endPage}" step="1">
				<input class='btnCircle' type='button' value='${j }' onclick='movePage(${j })' ${(pageScope.nowPage == j)? "disabled" : "" } />
			</c:forEach>
			<c:if test="${pageScope.nowBlock < pageScope.totBlock }">
				<input type='button' value='NEXT' onclick='movePage(${pageScope.endPage + 1})' />
				<input type='button' value='TAIL' onclick='movePage(${pageScope.totPage})' />
			</c:if>
		</div>
		</fieldset>
	</div>

</body>
</html>