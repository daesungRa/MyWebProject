<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Date OBJ Test</title>
<style>
	#dateObj > * {
		font-size: 12pt;
	}
	#dateObj > #dateField01 {
		font-size: 14pt;
	}
</style>
<script>
	// var btnDate;
	var dateField;
	var week = ['SUN', 'MON', 'TUE', 'WED', 'THUR', 'FRI', 'SAT'];
	window.onload = function () {
		createDate();
		// btnDate = document.getElementById('btnDate');
		dateField = document.getElementById('dateField');
		// btnDate.onclick = createDate;
		setInterval(createDate, 1000);
	}
	
	function createDate () {
		var now = new Date();
		var str01 = '';
		var str02 = '';
		str01 += now.getFullYear() + '.';
		str01 += now.getMonth() + 1 + '.';
		str01 += now.getDate() + '&nbsp;&nbsp;&nbsp;&nbsp;';
		str01 += week[now.getDay()] + ''; // now.getDay() 의 반환값은 정수임(일요일==0)
		str02 += now.getHours() + '시 ';
		str02 += now.getMinutes() + '분 ';
		str02 += now.getSeconds() + '초 ';
		
		dateField01.innerHTML = str01;
		dateField02.innerHTML = str02;
	}
</script>
</head>
<body>

	<div id='dateObj'>
		<!-- <input type='button' id='btnDate' value='날 짜'/> -->
		<div id='dateField01'></div>
		<div id='dateField02'></div>
	</div>

</body>
</html>