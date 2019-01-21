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
<meta http-equiv='Cache-Control' content='no-cache' />
<meta http-equiv='Pragma' content='no-cache' />
<meta http-equiv='Expires' content='1' />
<title>Modify Member Info</title>
<link rel='stylesheet' href='./css/member.css' />
<script src='./js/member.js'></script>
</head>
<body>

	<%
		// 요청받은 id 에 해당하는 멤버 정보 검색 후 화면에 표시
		// 추후 vo 로 전환
		String id = null;
		String name = null;
		String email = null;
		String phone = null;
		String rdate = null;
		String postal = null;
		String address = null;
		String photo = "https://via.placeholder.com/150x200";
		String photoOri = null;
		int g = 0;
		if (request.getMethod().equals("POST")) {
			id = request.getParameter("id");
			// out.print("<script>alert(" + id + ")</script>");
			
			MemberDao dao = new MemberDao();
			MemberVo vo = dao.view(id);
			
			// 반환된 vo 가 null 인가로 판별
			if (vo != null) {
				name = vo.getIrum();
				email = vo.getEmail();
				phone = vo.getPhone();
				rdate = vo.getRdate();
				postal = vo.getPostal();
				address = vo.getAddress();
				photoOri = vo.getPhoto();
				if (photoOri != null) {
					photo = "./images/" + photoOri;
				}
				g = vo.getGrade();
			} else {
				out.print("<script>alert('해당 유저가 존재하지 않습니다')</script>");
			}
		}
	%>

	<div id='modifyPage'>
		<h1 id='title'>Modify Member Info</h1>
		<p>멤버정보 수정 페이지입니다</p>
		<form name='member' method='post' action='index.jsp?aside=./control.jsp&content=./views/member/modify_result.jsp'>
			<label>아이디</label>
			<input type='text' name='id' value='<%=id %>' readonly/><br/>
			<input type='hidden' name='isChecked' value='checked' /><br/>
			<label>이 름</label>
			<input type='text' name='irum' class='item' value=<%=name %> /><br/>
			<label>이메일</label>
			<input type='email' name='email' class='item' value=<%=email %> /><br/>
			<label>연락처</label>
			<input type='text' name='phone' class='item' value=<%=phone %> /><br/>
			<label>등록일</label>
			<input type="date" name='rdate' value=<%=rdate %> readonly/><br/>
			<label>우편번호</label>
			<input type='text' name='postal' value=<%=postal %> /><br/>
			<label>주 소</label>
			<input type='text' name='address' value=<%=address %> size='50' /><br/>
			<label>증명사진</label>
			<input type='file' name='photo' /><br/>
			<input type='hidden' name='photoName' value=<%=photoOri %> /><br/>
			<label>학 년</label>
			<select size='4' name='grade'>
				<option value='1' <%=(g==1)? "selected" : "" %>>1 학년</option>
				<option value='2'<%=(g==2)? "selected" : "" %>>2 학년</option>
				<option value='3'<%=(g==3)? "selected" : "" %>>3 학년</option>
				<option value='4'<%=(g==4)? "selected" : "" %>>4 학년</option>
			</select><br/>
			<label>비밀번호</label>
			<input type="password" name='pwd' placeholder='선택된 유저의 암호를 입력하세요' size=40px;/><br/>
			<img id='image' name='image' src=<%=photo %> width='150px' height='200px' />
			<br/><br/>
			
			<input type='button' name='btnSubmit' value='수 정' />
			<input type='button' name='btnDelete' value='삭 제' />
			<input type='button' name='btnCancel' value='취 소' />
		</form>
	</div>
	
	<script>mainModify();</script>
	
</body>
</html>