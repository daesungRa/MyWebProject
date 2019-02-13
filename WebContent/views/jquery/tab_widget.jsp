<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jQuery Tab Widget test</title>
<link rel='stylesheet' href='https://code.jquery.com/ui/1.12.1/themes/swanky-purse/jquery-ui.css' />
<script src='/js/jquery-3.3.1.min.js'></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<style>
	
</style>
<script>
	$(function() {
		$('#myTabs').tabs();
	});
</script>
</head>
<body>

	<div id='tabWidget'>
		<h2>jQuery Tab Widget test</h2>
		<h3>Tab Widget</h3>
		
		<div id='cont'>
			<div id='myTabs'>
				<ul>
					<li><a href='#tab1'>WEB</a></li>
					<li><a href='#tab2'>Application</a></li>
					<li><a href='#tab3'>Session</a></li>
					<li><a href='#tab4'>FrameWork</a></li>
					<li><a href='#tab5'>Database</a></li>
				</ul>
				
				<div id='tab1'>
					Lorem Ipsum is simply dummy text of the printing and typesetting industry.
					Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,
					when an unknown printer took a galley of type and scrambled it to make a type specimen book.
					It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.
					It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages,
					and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
				</div>
				<div id='tab2'>
					It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages,
					and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
				</div>
				<div id='tab3'>
					
				</div>
				<div id='tab4'>
					
				</div>
				<div id='tab5'>
					
				</div>
			</div>
		</div>
	</div>

</body>
</html>