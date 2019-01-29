<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Load File Page</title>
<script>
	function get (id) {
		return document.getElementById(id);
	}
	function mainLoadFile () {
		var btnText = get('btnText');
		var btnHtml = get('btnHtml');
		var btnJsp = get('btnJsp');
		var btnXml = get('btnXml');
		var btnJson = get('btnJson');
		
		var xhr = new XMLHttpRequest();
		
		btnText.onclick = function () {
			xhr.open('get', '/views/ajax/test.txt');
			xhr.send();
			xhr.onreadystatechange = function () {
				if (xhr.readyState == 4 && xhr.status == 200) {
					var data = xhr.responseText;
					data = data.replace(/\n/g, '<br/>');
					var result = get('result');
					result.innerHTML = data;
				}
			}
		}
		btnHtml.onclick = function () {
			xhr.open('get', '/views/ajax/test.html');
			xhr.send();
			xhr.onreadystatechange = function () {
				if (xhr.readyState == 4 && xhr.status == 200) {
					var data = xhr.responseText;
					var result = get('result');
					result.innerHTML = data;
				}
			}
		}
		btnJsp.onclick = function () {
			var dan = prompt('(구구단)출력할 단수를 입력하세요');
			if (dan == '' || dan == null) return;
			
			xhr.open('get', '/views/ajax/test.jsp?dan=' + dan);
			xhr.send();
			xhr.onreadystatechange = function () {
				if (xhr.readyState == 4 && xhr.status == 200) {
					var data = xhr.responseText;
					var result = get('result');
					result.innerHTML = data;
				}
			}
		}
		btnXml.onclick = function () { }
		btnJson.onclick = function () { }
	}
</script>
</head>
<body>

	<div id='loadFile'>
		<h2>Load File Page</h2>
		<p>XMLHttpRequest 를 통해 text, html, jsp, xml, json 타입의 문서를 읽어 result 영역에 표시해 본다</p>
		
		<div id='btnZone'>
			<input type='button' value='TEXT' id='btnText' />
			<input type='button' value='HTML' id='btnHtml' />
			<input type='button' value='JSP' id='btnJsp' />
			<input type='button' value='XML' id='btnXml' />
			<input type='button' value='JSON' id='btnJson' />
		</div>
		<br/>
		<div id='result'>
			읽어들인 문서가 표시될 곳
		</div>
	</div>
	
	<script>mainLoadFile();</script>

</body>
</html>