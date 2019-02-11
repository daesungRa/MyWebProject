<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c' %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board List page</title>
</head>
<body>

	<c:if test="${not empty requestScope.msg }">
		<script>alert(${requestScope.msg});</script>
	</c:if>

	<c:if test="${not empty requestScope.list }">
		<c:set var="list" value="${requestScope.list }" ></c:set>
		<c:set var="pageDto" value="${requestScope.pageDto }" ></c:set>
	</c:if>

	<div id='boardListPage'>
		<div id='boardTitle'>
			<img src='/images/damuni.jpg' id='damuni' />
			<h2>Board List Page!</h2>
		</div>
		
		<!-- 검색 -->
		<div id='boardSearchForm'>
			<form name='boardFrm' method='post' enctype='multipart/form-data'>
				<input type='search' name='search' value='${(requestScope.search == null)? "" : requestScope.search }' />
				<input type='button' name='btnSearch' onclick='funcBoardSearch(0)' value='검색' />
				<input type='button' name='btnSearchAll' onclick='funcBoardSearch(1)' value='전체검색' />
				<input type='hidden' name='id' value='' />
				<input type='hidden' name='nowPage' value='${(requestScope.nowPage == null)? 1 : param.nowPage }' />
				<input type='hidden' name='serial' value='0' />
				<input type='hidden' name='email' value='' />
			</form>
		</div>
		
		<!-- 제목 -->
		<div id='boardSubjectArea'>
			<span class='boardNo'>NO</span>
			<span class='boardSubject'>제 목</span>
			<span class='boardId'>작성자</span>
			<span class='bDate'>작성일</span>
			<span class='hit'>조회수</span>
		</div>
		
		<!-- 본문 -->
		<c:choose>
			<c:when test="${list.size() == 0 }">
				<script>alert('게시글이 존재하지 않습니다');</script>
				<div class='boardList' style='text-align: center;'>
					<h3>게시글이 존재하지 않습니다</h3>
				</div>		
			</c:when>
			<c:otherwise>
				<c:forEach var="i" begin="0" end="${list.size() - 1 }" step="1">
					<c:set var='vo' value='${list[i] }' scope='page'></c:set>
					<div class='boardList'>
						<span class='boardNo'>${vo.serial }</span>
						<span class='boardSubject' onclick='funcBoardView(${i})'>
							<c:choose>
								<c:when test="${vo.indent == 0 }">
									${vo.subject }
								</c:when>
								<c:otherwise>
									<c:forEach var='j' begin='0' end='${vo.indent }' step='1'>&nbsp;&nbsp;&nbsp;&nbsp;</c:forEach>
									ㄴ ${vo.subject }
								</c:otherwise>
							</c:choose>
						</span>
						<span class='boardId'>${vo.userId }</span>
						<span class='bDate'>${vo.bDate }</span>
						<span class='hit'>${vo.hit }</span>
					</div>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		
		<!-- 페이징 -->
		<div id='boardBtnZone'>
			<c:if test="${pageDto.nowBlock > 1 }">
				<input type='button' value='HEAD' onclick='funcBoardPage(1)' />
				<input type='button' value='PRE' onclick='funcBoardPage(${pageDto.startPage - 1})' />
			</c:if>
			<c:forEach var="k" begin="${pageDto.startPage}" end="${pageDto.endPage}" step="1">
				<input class='btnCircle' type='button' value='${k }' onclick='funcBoardPage(${k })' ${(pageDto.nowPage == k)? "disabled" : "" } />
			</c:forEach>
			<c:if test="${pageDto.nowBlock < pageDto.totBlock }">
				<input type='button' value='NEXT' onclick='funcBoardPage(${pageDto.nowPage + 1})' />
				<input type='button' value='TAIL' onclick='funcBoardPage(${pageDto.totPage})' />
			</c:if>
		</div>
		
	</div><br/>
	
	<div id='moveBoardInsert'>
		<input type='button' id='moveBoardInsert' value='게시글 쓰기' onclick='funcBoardInsert();'/>
	</div>

</body>
</html>