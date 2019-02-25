<%@page import="com.myweb.memberBean.MemberVo"%>
<%@page import="myBatis.MybatisMemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyBatis 를 활용하여 Member 테이블의 데이터 핸들링하기</title>
</head>
<body>

	<div id='myBatis_member'>
		<h2>MyBatis 를 활용하여 Member 테이블의 데이터 핸들링하기</h2>
		
		<%
			String id = "hong";
			MybatisMemberDao dao = new MybatisMemberDao(request);
			dao.select(id); // mybatis 로 select 후 request 객체에 vo 세팅
		%>
		
		<ul>
			<li>아이디: ${requestScope.vo.id }</li>
			<li>이름: ${requestScope.vo.irum }</li>
			<li>암호: ${requestScope.vo.pwd }</li>
			<li>이메일: ${requestScope.vo.email }</li>
			<li>연락처: ${requestScope.vo.phone }</li>
			<li>등록일: ${requestScope.vo.rdate }</li>
			<li>우편번호: ${requestScope.vo.postal }</li>
			<li>주소: ${requestScope.vo.address }</li>
			<li>학년: ${requestScope.vo.grade }</li>
		</ul>
		<img src='/images/${requestScope.vo.photo }' alt="profile image" />
	</div>

</body>
</html>