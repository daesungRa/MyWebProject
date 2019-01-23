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
		location.href = 'index.jsp?aside=./index_jstl.jsp&content=' + page;
	}
</script>
</head>
<body>

	<div id='list'>
		<h1>This is JSTL Page</h1>
		<ol>
			<!-- <li><input type='button' value='clock' onclick='movePage("dateObj.jsp")'></li>
			<li><input type='button' value='one to ten' onclick='movePage("oneToTen.jsp")'></li> -->
			<li onclick='movePage("./views/jstl/jstl_set_test.jsp")'>JSTL SET TEST</li>
		</ol>
	</div>

</body>
</html>