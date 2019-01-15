<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>request 객체 학습</title>
</head>
<body>

	<div id='requestEx'>
		<h1>request 객체 학습</h1>
		<div>
			<h2>클라이언트 및 서버정보</h2>
			
			클라이언트 IP(getRemoteAddr) = <%=request.getRemoteAddr() %><br/>
			요청정보길이(getContentLength) = <%=request.getContentLength() %><br/>
			요청정보 인코딩(getCharacterEncoding) = <%=request.getCharacterEncoding() %><br/>
			요청정보 컨텐트 타입(getContentType) = <%=request.getContentType() %><br/>
			요청정보 프로토콜(getProtocol) = <%=request.getProtocol() %><br/>
			요청정보 전송방식(getMethod) = <%=request.getMethod() %><br/>
			요청 URI(getRequestURI) = <%=request.getRequestURI() %><br/>
			컨텍스트 경로(getContextPath) = <%=request.getContextPath() %><br/>
			서버이름(getServerName) = <%=request.getServerName() %><br/>
			서버포트(getServerPort) = <%=request.getServerPort() %><br/>
		</div>
	</div>

</body>
</html>