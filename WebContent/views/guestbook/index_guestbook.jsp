<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function movePage (page) {
		location.href = page;
	}
</script>
</head>
<body>

	<div id='index_gb'>
		<h1>방명록</h1>
		<ul>
			<li><a href='#' onclick='movePage("insert.do")'>방명록 작성</a></li>
			<li><a href='#' onclick='movePage("list.do")'>방명록 조회</a></li>
		</ul>
	</div>

</body>
</html>