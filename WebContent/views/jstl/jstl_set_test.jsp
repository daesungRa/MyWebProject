<%@page import="com.myweb.memberBean.MemberVo"%>
<%@page import="test.ElVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL Set Test</title>
</head>
<body>

	<div id='jstlSet'>
		<h1>JSTL Set Test</h1>
		<p>c:set 을 이용해 변수 및 객체 저장</p>
		
		<h3>변수 저장</h3>
		<c:set var='id' value='hong' />
		<c:set var='irum' >gildong</c:set>
		<ul>
			<li>ID: ${pageScope.id}</li>
			<li>Irum: ${irum}</li>
		</ul>
		
		<h3>객체를 생성하여 pageScope 에 저장하여 출력</h3>
		<%
			ElVo vo = new ElVo();
			vo.setIntro("kim!");
			vo.setSports("bap!!");
			// pageContext.setAttribute("vo", vo); 
		%>
		<c:set var='voVar' value='<%=vo %>' scope="page" />
		<ul>
			<li>Intro: ${voVar.intro}</li>
			<li>Sports: ${voVar.sports}</li>
		</ul>
		
		<h3>객체 타겟을 생성하여 프로퍼티 세팅 후 출력</h3>
		<%
			MemberVo mvo = new MemberVo();
			pageContext.setAttribute("mvo", mvo);
		%>
		<c:set target="${mvo}" property="id" value="riri" />
		<c:set target="${mvo}" property="irum" value="gonggong" />
		<ul>
			<li>ID: ${mvo.id}</li>
			<li>Irum: ${mvo.irum}</li>
		</ul>
		
		<h3>remove 를 활용하여 변수 삭제</h3>
		<c:remove var="voVar"/>
		<c:remove var="id"/>
		<c:remove var="irum"/>
		
		<ul>
			<li>ID: ${id }</li>
			<li>Irum: ${irum }</li>
			<li>voVar.intro: ${voVar.intro }</li>
			<li>voVar.sports: ${voVar.sports }</li>
			<li>mvo.id: ${mvo.id }</li>
			<li>mvo.irum: ${mvo.irum }</li>
		</ul>
		
		<c:remove var="mvo"/>
		<ul>
			<li>mvo.id: ${mvo.id }</li>
			<li>mvo.irum: ${mvo.irum }</li>
		</ul>
	</div>

</body>
</html>
