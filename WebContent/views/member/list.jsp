<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="com.myweb.memberBean.MemberVo"%>
<%@page import="com.myweb.memberDao.MemberDao"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.myweb.memberBean.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 목록 조회</title>
<link rel='stylesheet' href='./css/member.css' />
<script src='./js/member.js'></script>
</head>
<body>

	<!-- 상단에 검색 바 -->
	<!-- 본문에 No, 아이디, 성명, 연락처, 이메일 찍어주기 -->
	<!-- 하단에 페이징 처리 (맨처음, 이전, ..., 다음, 맨끝 -->
	<div id='list'>
		<div id='title'>
			<img src='./images/damuni.jpg' id='damuni'/>
			<h1>회원 목록 조회</h1>
		</div>
		<form name='member' method='post'> <!-- action 속성을 생략하면 자기 자신을 호출한다 -->
			<input type='search' name='search' value="${param.search}"/>
			<input type='button' name='btnSearch' value='검색' />
			<input type='button' name='btnSearchAll' value='전체검색' />
			<input type='hidden' name='searchHidden' value='' />
			<input type='hidden' name='id' value='' />
			<input type='hidden' name='nowPage' value='${(param.nowPage == null)? 1 : param.nowPage}' />
			<input type='hidden' name='email' />
		</form>
		
		<div id='subject'>
			<span class='no'>No</span>
			<span class='id' style='cursor: default;'>ID</span>
			<span class='name'>NAME</span>
			<span class='phone'>PHONE</span>
			<span class='email'>EMAIL</span>
		</div>
		<div id='memberList'>
			<%
				String search = "";
				int nowPage = 1;
				MemberDao dao = new MemberDao();
				
				if (request.getParameter("nowPage") != null) {
					nowPage = Integer.parseInt(request.getParameter("nowPage"));
				}
				
				if (request.getParameter("search") != null && !request.getParameter("search").equals("")) {
					search = request.getParameter("search");
					Map<String, MemberVo> map = null;
					MemberVo vo = null;
					
					// 전체검색 클릭시 자동으로 "SelectAll" 이 입력됨
					if (search.equals("SelectAll")) {
						map = dao.listAll(search, nowPage);
					} else {
						// map = dao.list(search, 1, 3);
					}
					
					if (map.size() == 0) {
						out.print("<script>alert('검색된 데이터가 없습니다')</script>");
					}
					
					int no = dao.startNo;
					for (int i = 0; i < map.size(); i++) {
						vo = map.get(Integer.toString(no));
			%>
						<div class='row'>
							<span class='no'><%=no %></span>
							<span class='id'><a href='#' onclick='modify(this.innerHTML)'><%=vo.getId() %></a></span>
							<span class='name'><%=vo.getIrum() %></span>
							<span class='phone'><%=vo.getPhone() %></span>
							<span class='email'><a href='#' onclick='sendEmail(this.innerHTML)'><%=vo.getEmail() %></a></span>
						</div>
			<%
						no++;
					}
				} else {
			%>
					<div class='row'>
						<span class='no'></span>
						<span class='id'></span>
						<span class='name'></span>
						<span class='phone'>검색어를 입력해 주세요!</span>
						<span class='email'></span>
					</div>
			<%
				}
			%>
		</div>
		
		<div id='btnZone'>
			<%if (dao.nowBlock > 1) { %>
				<input type='button' value='HEAD' onclick='movePage(1)' />
				<input type='button' value='PRE' onclick='movePage(<%=dao.startPage - 1%>)' />
			<%} %>
			
			<%for (int j = dao.startPage; j <= dao.endPage; j++) { %>
				<input class='btnCircle' type='button' value=<%=j %> onclick='movePage(<%=j %>)' <%=(dao.nowPage == j)? "disabled" : "" %> />
			<%} %>
			<%if (dao.nowBlock < dao.totBlock) { %>
				<input type='button' value='NEXT' onclick='movePage(<%=dao.endPage + 1 %>)' />
				<input type='button' value='TAIL' onclick='movePage(<%=dao.totPage %>)' />
			<%} %>
		</div>
	</div>
	
	<script>mainList()</script>
	<script>
		
	</script>

</body>
</html>