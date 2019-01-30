<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Interface Document Page</title>
</head>
<body>

	<div id='domDocumentTest'>
		<h2>Interface Document Page</h2>
		<form name='frm'>
			<input type='text' name='irum' value='hong' id='id_irum' class='class_irum' /><br/>
			<input type='search' name='address' value='종로3가' id='id_address' class='class_address' /><br/>
			<input type='color' name='hair' value='#ff0000' id='id_hair' class='class_hair' /><br/>
			<p/>
			<input type='button' id='btn' value='확 인' name='btn' class='class_btn' />
		</form>
		
		<h3>Result Area</h3>
		<div id='result'></div>
	</div>
	<script>
		var btn = document.getElementById('btn');
		btn.onclick = function () {
			var doc = document.getElementById('domDocumentTest');
			var result = document.getElementById('result');
			var str = '';
			
			// 모든 input 태그
			var input = doc.getElementsByTagName('input');
			str = '<li> number of input tag : ' + input.length + '</li>';
			
			for (var i = 0; i < input.length; i++) {
				str += '<ul>';
				str += '<li> type : ' + input[i].type + '</li>';
				str += '<li> name : ' + input[i].name + '</li>';
				str += '<li> value : ' + input[i].value + '</li>';
				str += '<li> id : ' + input[i].id + '</li>';
				str += '<li> class : ' + input[i].className + '</li>';
				str += '</ul>';
			}
			
			result.innerHTML = str;
		}
	</script>

</body>
</html>