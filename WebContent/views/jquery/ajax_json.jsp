<%@page import="java.util.Iterator"%>
<%@page import="com.myweb.memberBean.MemberVo"%>
<%@page import="java.util.Map"%>
<%@page import="com.myweb.memberDao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>jQuery Ajax Json test</title>
<link rel='stylesheet' href='https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css' />
<script src='/js/jquery-3.3.1.min.js'></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<style>
	
</style>
<script>
	$(function () {
		$('#btnSearch').click(function () {
			var search = $('#search').val();
			$.ajax({
				type: 'get',
				url: '/views/jquery/member_json.jsp?search=' + search,
				dataType: 'json',
				success: function (data, status) {
					var d = 
					$('#result').html(data);
				},
				error: function (xhr, status, error) {
					alert(error);
					console.log(status);
				}
			});
		});
	});
</script>
</head>
<body>

	<div id='tabWidget'>
		<h2>jQuery Ajax Json test</h2>
		<h3>Load Member info using ajax in jQuery (Json)</h3>
		
		<div id='cont'>
			<form name='frm' id='frm' method='post'>
				<input type='text' name='search' id='search' />
				<input type='button' value='검색' id='btnSearch' />
			</form>
			
			<div id='result'>
			
			</div>
		</div>
	</div>

</body>
</html>