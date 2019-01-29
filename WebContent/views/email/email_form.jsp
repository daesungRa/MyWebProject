<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Email Form</title>
<link rel='stylesheet' href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
<script>
	window.onload = function () {
		var frm = document.frm_email;
		frm.emailSend.onclick = function () {
			frm.submit();
		}
	}
</script>
</head>
<body>

	<%
		if (request.getParameter("email") != null) {
			out.print("<script>alert('" + request.getParameter("email") + "');</script>");
		}
	%>

	<c:if test="${not empty requestScope.email }">
		<c:set var="email" value="${requestScope.email }" />
		<c:out value="gkgk">"${requestScope.email } 세팅!"</c:out>
	</c:if>
	
	<div class='navbar navbar-expand-lg bg-light navbar-light'>
		<a class='navbar-brand' href='#'>Email Form</a>
	</div>
	
	<div class='container' id='emailForm'>		
		<form name='frm_email' method='post' action='email.email' enctype="multipart/form-data">
			<label>작성자 이메일</label>
			<input class='form-control' type='email' name='sender' value='ra5124@naver.com' /><br/>
			<label>수신자 이메일</label>
			<input class='form-control' type='email' name='receiver' value=${email } /><br/>
			<input class='form-control' type='text' name='subject' placeholder='제목 입력' /><br/>
			
			<textarea class='form-control' name='doc' cols='60' rows='10' style='resize: none;'>안녕하세요 ㅎㅎㅎ</textarea><p/>
			<input type='file' name='attFile' /><br/>
			<button class='btn btn-primary' name='emailSend' type='button'>전 송</button>
		</form>
	</div>

</body>
</html>