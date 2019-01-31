<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Element Add or Remove Page</title>
<style>
	#main {
	
	}
	#main #item1 {
		width: 200px;
		height: 300px;
		border: 1px solid black;
		margin: 10px 0 5px 30px;
	}
	#main #item2 {
		width: 200px;
		height: 300px;
		border: 1px solid black;
		margin: 5px 0 0 30px;
	}
</style>
</head>
<body>

	<div id='domElementAddTest'>
		<h2>Element Add or Remove Page</h2>
		<div id='info'>항목을 선택하면 동적으로 select 태그와 option 태그를 생성</div>
		
		<div id='main'>
			<div id='item1'>
				<select size='5' id='item1_sel'>
					<option>산이름</option>
					<option>강이름</option>
					<option>과일이름</option>
					<option>0~9</option>
					<option>10~19</option>
				</select>
			</div>
			<div id='item2'>
				<select size='10' id='item2_sel'></select>
			</div>
		</div>
	</div>
	
	<script>
		var sel1 = document.getElementById('item1_sel');
		var sel2 = document.getElementById('item2_sel');
		
		sel1.onchange = function () {
			/* console.log('changed!');
			console.log(sel[sel.selectedIndex].text); */
			switch (sel1.selectedIndex) {
			case 0:
				mnts();
				break;
			case 1:
				rivers();
				break;
			case 2:
				fruits();
				break;
			case 3:
				num(0);
				break;
			case 4:
				num(1);
				break;
			}
		}
		sel2.onchange = function () {
			
		}
		
		function mnts () {
			var m = ['백두산', '한라산', '치악산', '설악산', '속리산', '금강산', '내장산', '북한산'];
			sel2.length = 0; // select 박스 내용을 초기화
			for (var i = 0; i < m.length; i++) {
				var op = new Option(m[i], m[i]);
				sel2.options[i] = op;
			}
		}
		function rivers () {
			var r = ['한강', '두만강', '낙동강', '금강', '소금강', '압록강', '요단강', '섬진강'];
			sel2.length = 0;
			for (var i = 0; i < r.length; i++) {
				var op = new Option(r[i], r[i]);
				sel2.options[i] = op;
			}
		}
		function fruits () {
			var r = ['딸기', '사과', '오렌지', '배', '귤', '메론', '참외', '바나나', '수박', '두리안', '복숭아', '석류', '망고'];
			sel2.length = 0;
			for (var i = 0; i < r.length; i++) {
				var op = new Option(r[i], r[i]);
				sel2.options[i] = op;
			}
		}
		function num (num) {
			var arr = [
						[0, 1, 2, 3, 4, 5, 6, 7, 8, 9],
						[10, 11, 12, 13, 14, 15, 16, 17, 18, 19]
					];
			sel2.length = 0;
			for (var i = 0; i < arr[num].length; i++) {
				var op = new Option(arr[num][i], arr[num][i]);
				sel2.options[i] = op;
			}
		}
	</script>

</body>
</html>