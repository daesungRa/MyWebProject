<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Information of Emp</title>
<style>
	#infoEmp li {
		list-style: none;
	}
	#infoEmp .item {
		overflow: scroll;
		display: inline-block;
		width: 200px;
		height: 150px;
		margin-right: 10px;
		border: 1px solid black;
		float: left;
	}
	#infoEmp #emp_info {
		overflow: scroll;
		display: inline-block;
		font-size: 9pt;
		background-color: #fff;
		width: 200px;
		height: 300px;
		margin-right: 10px;
		border: 1px solid black;
		float: left;
	}
</style>
</head>
<body>

	<div id='infoEmp'>
		<h2>Information of Emp</h2>
		<p>Ajax 를 활용한 employee 정보 조회</p>
		
		<div id='main'>
			<select id='dept' class='item' size='10'>
			</select>
			<select id='emp' class='item' size='10'>
			</select>
			<div id='emp_info'>
				- 결과
			</div>
		</div>
	</div>
	
	<script>
		function get (id) {
			return document.getElementById(id);
		}
		var dept = get('dept');
		var emp = get('emp');
		var result = get('emp_info');
		var xhr = new XMLHttpRequest();
		
		// 페이지 로드 시 모든 부서번호와 부서명을 가져옴
		funcDept ();
		function funcDept () {
			xhr.open('post', 'getDept.emp');
			xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
			xhr.send();
			xhr.onreadystatechange = function () {
				if (xhr.readyState == 4 && xhr.status == 200) {
					var data = xhr.responseText;
					var list = JSON.parse(data);
					
					for (var i = 0; i < list.length; i++) {
						var op = new Option(list[i].deptName, list[i].deptId);
						dept.options[i] = op;
					}
				}
			}
		}
		
		// 부서 선택 시 해당 부서의 모든 직원정보 가져옴
		dept.onchange = function () {
			emp.length = 0;
			var deptId = -1;
			var index = dept.selectedIndex;
			deptId = dept[index].value;
			
			xhr.open('post', 'getEmp.emp');
			xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
			xhr.send("deptId=" + deptId);
			xhr.onreadystatechange = function () {
				if (xhr.readyState == 4 && xhr.status == 200) {
					var data = xhr.responseText;
					var list = JSON.parse(data);
					
					for (var i = 0; i < list.length; i++) {
						var op = new Option(list[i].eName, list[i].empId);
						emp.options[i] = op;
					}
				}
			}
		}
		
		// 직원 선택 시 해당 직원의 모든 정보 가져옴
		emp.onchange = function () {
			var empId = -1;
			var index = emp.selectedIndex;
			empId = emp[index].value;
			// alert('emp key : ' + emp[index].text + ', value : ' + empId);
			
			xhr.open('post', 'getEmpInfo.emp');
			xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
			xhr.send("empId=" + empId);
			xhr.onreadystatechange = function () {
				if (xhr.readyState == 4 && xhr.status == 200) {
					var data = xhr.responseText;
					var list = JSON.parse(data);
					var str = '<h4>결과</h4>';
					
					str += '<ul>';
					str += '<li> 사원 번호 : ' + list[0].empId + '</li>';
					str += '<li> 사원명 : ' + list[0].eName + '</li>';
					str += '<li> 이메일 : ' + list[0].email + '</li>';
					str += '<li> 전화번호 : ' + list[0].phone_number + '</li>';
					str += '<li> 급여 : ' + list[0].salary + '</li>';
					str += '<li> 매니저 아이디 : ' + list[0].mId + '</li>';
					str += '<li> 부서 아이디 : ' + list[0].deptId + '</li></ul>';
					
					result.innerHTML = str;
				}
			}
		}
	</script>

</body>
</html>