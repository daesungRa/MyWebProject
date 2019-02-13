<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jQuery Page</title>
<script>
	function goPage (page) {
		var url = 'index.jsp?aside=/index_jquery.jsp&content=/views/jquery/' + page;
		location.href = url;
	}
</script>
</head>
<body>

	<div id='ajax'>
		<h1>jQuery Page</h1>
		
		<ul>
			<li><a href='#' onclick='goPage("lib_test.jsp");'>jquery lib test</a></li>
			<li><a href='#' onclick='goPage("cdn_test.jsp");'>jquery cdn test</a></li>
			<li><a href='#' onclick='goPage("selector01.jsp");'>jquery selector test01</a></li>
			<li><a href='#' onclick='goPage("selector02.jsp");'>jquery selector test02</a></li>
			<li><a href='#' onclick='goPage("filter01.jsp");'>jquery filter test01</a></li>
			<li><a href='#' onclick='goPage("traverse01.jsp");'>jquery traverse test01</a></li>
			<li><a href='#' onclick='goPage("manipulation01.jsp");'>jquery manipulation test01</a></li>
			<li><a href='#' onclick='goPage("get.jsp");'>jquery get test</a></li>
			<li><a href='#' onclick='goPage("each.jsp");'>jquery each test</a></li>
			<li><a href='#' onclick='goPage("attribute.jsp");'>jquery attribute test</a></li>
			<li><a href='#' onclick='goPage("event.jsp");'>jquery event test</a></li>
			<li><a href='#' onclick='goPage("effect.jsp");'>jquery effect test</a></li>
			<li><a href='#' onclick='goPage("effect_menu.jsp");'>jquery effect test02</a></li>
			<li><a href='#' onclick='goPage("tab_widget.jsp");'>jquery tab widget test</a></li>
			<li><a href='#' onclick='goPage("menu_widget.jsp");'>jquery menu widget test</a></li>
			<li><a href='#' onclick='goPage("ajax_member.jsp");'>jquery ajax member test</a></li>
			<li><a href='#' onclick='goPage("ajax_load.jsp");'>jquery ajax load test</a></li>
			<li><a href='#' onclick='goPage("ajax_json.jsp");'>jquery ajax json test</a></li>
		</ul>
	</div>

</body>
</html>