<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP index</title>
<style>
	#list {
		text-align: center;
	}
	#list ol {
		text-align: left;
		list-style-type: upper-roman;
		cursor: pointer;
	}
	#list li:hover {
		text-decoration: underline ;
		color: #545454;
	}
</style>
<script>
	function movePage (page) {
		location.href = 'index.jsp?aside=./views/index_jsp.jsp&content=./views/' + page;
	}
</script>
</head>
<body>

	<div id='list'>
		<h1>This is JSP Page</h1>
		<ol>
			<!-- <li><input type='button' value='clock' onclick='movePage("dateObj.jsp")'></li>
			<li><input type='button' value='one to ten' onclick='movePage("oneToTen.jsp")'></li> -->
			<li onclick='movePage("dateObj.jsp")'>clock</li>
			<li onclick='movePage("oneToTen.jsp")'>one to ten</li>
			<li onclick='movePage("useDeclaration.jsp")'>declaration</li>
			<li onclick='movePage("requestInfo.jsp")'>use request Object</li>
			<li onclick='movePage("form.jsp")'>form test</li>
		</ol>
	</div>

</body>
</html>