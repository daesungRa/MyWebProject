<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="vo" class="com.myweb.memberBean.MemberVo" scope="page"/>
<jsp:setProperty name="vo" property="*" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 완료</title>
</head>
<body>

	<%
		response.setCharacterEncoding("utf-8");
	%>
	<div>
		<!-- 정보 찍어주고 -->
		<ul>
			<li>아이디: <%=vo.getId() %></li>
			<li>성 명: <%=vo.getIrum() %></li>
			<li>암 호: <%=vo.getPwd() %></li>
			<li>이메일: <%=vo.getEmail() %></li>
			<li>연락처: <%=vo.getPhone() %></li>
			<li>가입일: <%=vo.getRdate() %></li>
			<li>우편번호: <%=vo.getPostal() %></li>
			<li>주 소: <%=vo.getAddress() %></li>
			<li>증명사진: <%=vo.getPhoto() %></li>
			<li>학 년: <%=vo.getGrade() %></li>
		</ul>
		
		<!-- 여기다 DB 저장 로직 추가 -->
		
		<p>회원가입에 성공!</p>
	</div>

</body>
</html>