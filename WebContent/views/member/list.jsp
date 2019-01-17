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
			<input type='hidden' name='searchHidden' value='' />
			<input type='hidden' name='id' value='' />
			<input type='button' name='btnSearch' value='검색' />
			<input type='button' name='btnSearchAll' value='전체검색' />
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
				if (request.getParameter("search") != null && !request.getParameter("search").equals("")) {
					search = request.getParameter("search");
				
					Connection conn = new DBConn().getConn();
					PreparedStatement ps = null;
					ResultSet rs = null;
					String sql = "";
					
					// 전체검색 클릭시 자동으로 "SelectAll" 이 입력됨
					if (search.equals("SelectAll")) {
						sql = " select * from member ";
						
						try {
							ps = conn.prepareStatement(sql);
							rs = ps.executeQuery();
						} catch (Exception ex) { out.print(ex.toString()); }
					} else {
						sql = " select * from member where id like ? or name like ? or phone like ? ";
						
						try {
							ps = conn.prepareStatement(sql);
							ps.setString(1, "%" + search + "%");
							ps.setString(2, "%" + search + "%");
							ps.setString(3, "%" + search + "%");
							rs = ps.executeQuery();
						} catch (Exception ex) { out.print(ex.toString()); }
					}
					
			%>
		
			<%
					if (!rs.isBeforeFirst()) {
						out.print("<script>alert('검색된 데이터가 없습니다')</script>");
					}
					int i = 1;
					while (rs.next()) {
			%>
						<div class='row'>
							<span class='no'><%=i %></span>
							<span class='id'><a href='#' onclick='modify(this.innerHTML)'><%=rs.getString("id") %></a></span>
							<span class='name'><%=rs.getString("name") %></span>
							<span class='phone'><%=rs.getString("phone") %></span>
							<span class='email'><%=rs.getString("email") %></span>
						</div>
			<%
						i++;
					}
				} else {
			%>
					<div class='row'>
						<span class='no'></span>
						<span class='id'></span>
						<span class='name'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;검</span>
						<span class='phone'>색어를 입력해 주세요!</span>
						<span class='email'></span>
					</div>
			<%
				}
			%>
		</div>
		
		<div id='btnZone'>
			<input type='button' value='HEAD' />
			<input type='button' value='PRE' />
			<input class='btnCircle' type='button' value='1' />
			<input class='btnCircle' type='button' value='2' />
			<input class='btnCircle' type='button' value='3' />
			<input class='btnCircle' type='button' value='4' />
			<input class='btnCircle' type='button' value='5' />
			<input type='button' value='NEXT' />
			<input type='button' value='TAIL' />
		</div>
	</div>
	
	<script>mainList()</script>

</body>
</html>