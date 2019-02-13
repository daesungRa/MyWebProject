<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>jQuery Ajax test</title>
<link rel='stylesheet' href='https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css' />
<script src='/js/jquery-3.3.1.min.js'></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<style>
	#myMenu {
		
	}
</style>
<script>
	$(function () {
		$('#btnSearch').click(function () {
			var search = $('#search').val();
			$.ajax({
				type: 'POST',
				url: '/views/jquery/list.jsp?search=' + search,
				dataType: 'text',
				success: function (data, status) {
					$('#result').html(data);
				},
				error: function (xhr, status, err) {
					alert(err);
				}
			});
		});
	});
</script>
</head>
<body>

	<div id='tabWidget'>
		<h2>jQuery Ajax test</h2>
		<h3>read Member list using ajax in jQuery</h3>
		
		<div id='cont'>
			<form name='frm' id='frm' method='post'>
				<input type='text' name='search' id='search' />
				<input type='button' value='검색' id='btnSearch'>
			</form>
			
			<div id='title'>
				<span class='no'>NO</span>
				<span class='mid'>아이디</span>
				<span class='irum'>이름</span>
				<span class='phone'>연락처</span>
				<span class='email'>이메일</span>
			</div><br/>
			<div id='result'></div>
		</div>
	</div>

</body>
</html>