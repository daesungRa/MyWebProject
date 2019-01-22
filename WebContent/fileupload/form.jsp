<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>File Upload</title>
</head>
<body>

	<div id='fileUpload'>
		<h2>File Upload</h2>
		<form name='frm' method='post' action='./form_result.jsp' enctype='multipart/form-data'>
			<label>제목</label>
			<input type='text' name='subject' value='첨부 파일입니다' /><br/>
			<input type='file' name='attFile1' /><br/>
			<input type='file' name='attFile2' /><br/>
			<input type='file' name='attFile3' /><br/>
			<p/>
			<input type='submit' />
		</form>
	</div>

</body>
</html>