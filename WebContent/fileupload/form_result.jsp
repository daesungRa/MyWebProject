<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.multipart.FileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
		int size = 1024 * 1024 * 10; // 10mb
		String encode = "utf-8";
		String saveDir = "D:/1806_Ra/git/MyWebProject/WebContent/images/upLoad/";
		// form 태그의 enctype 속성 때문에 직접 request 객체 사용 불가
		MultipartRequest multi = new MultipartRequest(request, saveDir, size, encode, new DefaultFileRenamePolicy());
		
		out.print(multi.getParameter("subject"));
		
		// 업로드된 파일명의 오리지날, 변경된 파일명 표현
		Enumeration e = multi.getFileNames();
		while (e.hasMoreElements()) {
			String tagName = (String) e.nextElement();
			String oriFileName = multi.getOriginalFileName(tagName);
			String sysFileName = multi.getFilesystemName(tagName);
			
			out.print("<ul><li>tag name: " + tagName + "</li>");
			out.print("<li>ori file name: " + oriFileName + "</li>");
			out.print("<li>system file name: " + sysFileName + "</li></ul>");
		}
		
	%>
	
</body>
</html>