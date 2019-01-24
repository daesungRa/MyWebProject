<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL Index Page</title>
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
		location.href = 'index.jsp?aside=./index_servlet.jsp&content=' + page;
	}
</script>
</head>
<body>

	<div id='list'>
		<h1>This is JSTL Page</h1>
		<ol>
			<li onclick='movePage("/now")'>web.xml Test (/now)</li>
			<li onclick='movePage("/hello")'>annotation Test (/hello)</li>
		</ol>
	</div>

</body>
</html>