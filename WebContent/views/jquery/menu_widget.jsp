<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>jQuery Menu Widget test</title>
<link rel='stylesheet' href='https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css' />
<script src='/js/jquery-3.3.1.min.js'></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<style>
	#myMenu {
		width: 120px;
	}
</style>
<script>
	$(function() {
		$('#myMenu').menu();
	});
</script>
</head>
<body>

	<div id='tabWidget'>
		<h2>jQuery Menu Widget test</h2>
		<h3>Menu Widget</h3>
		
		<div id='cont'>
			<div id='container'>
				<ul id='myMenu'>
					<li>
						<a href='#tab1'>WEB</a>
						<ul>
							<li>HTML</li>
							<li>Javascript</li>
							<li>CSS</li>
							<li>JSP</li>
							<li><a href='http://www.naver.com' target='_blank'>네이버</a></li>
						</ul>
					</li>
					<li>
						<a href='#tab2'>Application</a>
						<ul>
							<li>HTML</li>
							<li>Javascript</li>
							<li>CSS</li>
							<li>JSP</li>
						</ul>
					</li>
					<li>
						<a href='#tab3'>Session</a>
						<ul>
							<li>HTML</li>
							<li>Javascript</li>
							<li>CSS</li>
							<li>JSP</li>
						</ul>
					</li>
					<li>
						<a href='#tab4'>FrameWork</a>
						<ul>
							<li>HTML</li>
							<li>Javascript</li>
							<li>CSS</li>
							<li>JSP</li>
						</ul>
					</li>
				</ul>
			</div>
		</div>
	</div>

</body>
</html>