<%@page import="com.myweb.memberBean.MemberVo"%>
<%@page import="java.util.List"%>
<%@page import="myBatis.MybatisMemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c' %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#mybatis_memberList {
		width: 70%;
		margin: 50px auto;
	}
	#mybatis_memberList > #title {
		margin: 10px 0 10px 0;
		background-color: #9fe8cb;
	}
	.item {
		border-bottom: 1px dotted #aaa;
		padding: 5px 0 5px 0;
	}
	.item:last-child {
		border-bottom: none;
	}
	.item:hover {
		background-color: #efefef;
	}
	span {
		display: inline-block;
		text-align: center;
		/* border: 1px solid black; */
	}
	.id {
		width: 14%;
	}
	.irum {
		width: 14%;
	}
	.phone {
		width: 29%;
	}
	.email {
		width: 29%;
	}
	.grade {
		width: 9%;
	}
</style>
</head>
<body>

	<%
		MybatisMemberDao dao = new MybatisMemberDao(request);
		dao.getMemberList();
		List<MemberVo> memberList = (List<MemberVo>) request.getAttribute("memberList");
		System.out.println("memberList size : " + memberList.size());
	%>

	<div id='mybatis_memberList'>
		<h3>회원조회</h3>
		
		<form name='memberListForm' method='post'>
			<input type='text' name='search' />
			<input type='submit' value='검색' />
		</form>
		<br/><hr/>		
		<div id='title'>
			<span class='id'>아이디</span>
			<span class='irum'>성명</span>
			<span class='phone'>연락처</span>
			<span class='email'>이메일</span>
			<span class='grade'>학년</span>
		</div>
		<hr/>
		<div id='items'>
			<c:forEach var="vo" items="${memberList }">
				<div class='item'>
					<span class='id'>${vo.id }</span>
					<span class='irum'>${vo.irum }</span>
					<span class='phone'>${vo.phone }</span>
					<span class='email'>${vo.email }</span>
					<span class='grade'>${vo.grade }</span>
				</div>
			</c:forEach>
		</div>
		<hr/>
	</div>

</body>
</html>