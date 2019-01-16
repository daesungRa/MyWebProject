<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>action tag:Parameter test</title>
</head>
<body>

	<div id='paramTest'>
		<fieldset id='info'>
			<legend>action tag:Parameter test</legend>
			<p>&lt;jsp:param name='name' value='value'&gt; 속성 사용</p>
			
			<h4>이하는 동적 삽입(jsp:include page)을 사용하여 작성된 내용</h4>
			
			<jsp:include page="/test/param_sub.jsp">
				<jsp:param name="irum" value="홍길동" />
				<jsp:param name="irum" value="홍길자" />
				<jsp:param name="irum" value="홍길순" />
				<jsp:param name="address" value="서울" />
			</jsp:include>
			
			<h4>이하는 정적 삽입(jsp:include file)을 사용하여 작성된 내용</h4>
			
		</fieldset>
	</div>

</body>
</html>