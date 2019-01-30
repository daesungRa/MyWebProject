<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Interface Node Page</title>
<!-- <link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css' />
<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js'></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script> -->
</head>
<body>

	<div id='domNodeTest'>
		<h2>Interface Node Page</h2>
		
		<div id='main' style='border: 1px solid black; margin: 0 18px 9px 0; padding-left: 9px;'>
			<section>
				<h2>Title111</h2>
				<p>Content111</p>
			</section>
			<section>
				<h2>Title222</h2>
				<p>Content222</p>
			</section>
		</div>
		
		<input type='button' id='btn' value='그대로 확 인' />
		<input type='button' id='btnEle' value='실제 요소만 확 인' />
		<h3>Result Area</h3>
		<div id='result'></div>
	</div>
	
	<script>
		var btn = document.getElementById('btn');
		var result = document.getElementById('result');
		btn.onclick = function () {
			var main = document.getElementById('main');
			var childs = main.childNodes;
			
			var str = '<li> [그대로 확인]  number of nodes in main div : ' + childs.length + '</li>';
			str += '<ul>';
			for (var i = 0; i < childs.length; i++) {
				var node = childs.item(i);
				str += '<li> ' + (i + 1) + 'st node : ' + node.nodeName + '</li>'
			}
			str += '</ul>';
			
			result.innerHTML = str;
		}
		
		btnEle.onclick = function () {
			var main = document.getElementById('main');
			var childs = main.childNodes;
			
			var cnt = 0;
			for (var i = 0; i < childs.length; i++) {
				var node = childs.item(i);
				if (node.nodeType == 1) cnt++;
			}
			var str = '<li> [실제 요소만 확인]  number of element nodes in main div : ' + cnt + '</li>';
			str += '<div>';
			for (var i = 0; i < childs.length; i++) {
				var node = childs.item(i);
				if (node.nodeType != 1) continue;
				str += '<p> ' + node.nodeName + (i + 1) + '</p>';
				var sectionChilds = node.childNodes;
				
				for (var j = 0; j < sectionChilds.length; j++) {
					var childNode = sectionChilds.item(j);
					if (childNode.nodeType != 1) continue;
					str += '<ul><li> ' + (j + 1) + 'st node : ' + childNode.nodeName + '</li>'
					str += '<li> ' + (j + 1) + "st node's first value : " + childNode.firstChild.nodeValue + '</li></ul>';
				}
			}
			str += '</div>';
			
			result.innerHTML = str;
		}
	</script>

</body>
</html>