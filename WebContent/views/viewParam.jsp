<%@page import="java.util.Iterator"%>
<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Enumeration" %>
<%@ page import="java.util.Map" %>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전송된 파라미터 보기</title>
</head>
<body>

	<div id='viewParam'>
		<h1>전송된 파라미터 보기</h1>
		<div id='useGetParam'>
			<h3>request.getParameter() 메서드 사용</h3>
			name : <%=request.getParameter("name") %><br/>
			address : <%=request.getParameter("address") %>
			
			<h3>request.getParameterValues() 메서드 사용</h3>
			<%
				String[] pets = request.getParameterValues("pet");
				if (pets != null) {
					for (int i = 0; i < pets.length; i++) {
			%>
			
						pet - <%=i + 1 %> : <%=pets[i] %><br/>
			
			<%
					}
			%>
			
					한 번에 출력: <%=Arrays.toString(pets) %>
				
			<%
				} else {
			%>
					pets : 값이 없습니다
			<%
				}
			%>
			
			<h3>request.getParameterNames() 메서드 사용</h3>
			<%
				Enumeration paramEnum = request.getParameterNames();
				while (paramEnum.hasMoreElements()) {
			%>
			
					name : <%=(String)paramEnum.nextElement() %><br/>
			
			<%	
				}
			%>
			
			<h3>request.getParameterMap() 메서드 사용</h3>
			<%
				Map paramMap = request.getParameterMap();
				Iterator ite = paramMap.keySet().iterator();
				String[] nameParam = (String[])paramMap.get("name");
				if (nameParam != null) {
					while (ite.hasNext()) {
						String key = (String)ite.next();
						String[] values = (String[])paramMap.get(key);
			%>
			
						<%=key %> : <%=Arrays.toString(values) %><br/>
			
			<%
					}
				}
			%>
		</div>
	</div>

</body>
</html>