<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jQuery Event test</title>
<script src='/js/jquery-3.3.1.min.js'></script>
<script>
	$(document).ready(function () {
		$('#eventFrm').css({"width":"500px", "padding":"10px 0 10px 25px", "margin-bottom":"10px", "border":"2px solid #ddd", "display":"inline-block", "border-radius":"8px"});
		$('#result').css({"width":"500px", "height":"150px", "padding":"10px 0 10px 25px", "border":"2px solid #ddd", "display":"inline-block", "border-radius":"8px"});
		var cnt = 1; // 전송 횟수
		var str = '';
		
		$('#btnOne').one('click', function () {
			str = '전송횟수 : ' + cnt;
			$('#result').text(str);
			cnt++;
			
			$('#btnTrigger').trigger('click'); // 클릭 이벤트 발생
		});
		$('#btnTrigger').click(chk);
		$('#mid').bind('keyup', bindFunc);
		$('#subject').bind('keyup', bindFunc);
		$('#content').bind('keyup', bindFunc);
	});
	
	function chk () {
		// 폼 태그는 여러 개 있을 수 있다고 가정하여 무조건 배열 처리한다
		var $frm = $('#eventFrm');
		// 현재 폼 내에 존재하는 데이터를 직렬화하여 data 변수에 저장
		var data = $('#eventFrm').serialize();
		// 직렬화 저장 후, 배열처리된 폼 태그의 각 항목에 빈 공백을 입력함
		$frm[0].mid.value = '';
		$frm[0].subject.value = '';
		$frm[0].content.value = '';
		
		$('#btnOne').trigger('click');
		$('#result').html($('#result').html() + '<br/>' + data);
	}
	function bindFunc (ev) {
		var frm = $('#eventFrm')[0]; // 폼 태그를 셀렉트하면 무조건 유사 배열 처리
		//if (ev.keyCode == 13) { // enter key
			var str = '<li>작성자 : ' + frm.mid.value
					+ '<li>제목 : ' + frm.subject.value
					+ '<li>내용 : ' + frm.content.value;
			$('#result').html(str);
		//}
	}
</script>
</head>
<body>

	<div id='eventTest'>
		<h2>jQuery Event test</h2>
		<h3>Event(one, trigger, bind)</h3>
		
		<form name='frm' id='eventFrm' method='post'>
			<label for="mid">작성자</label><br/>
			<input type='text' name='mid' id='mid' value='hong' /><br/>
			<label for="subject">제목</label><br/>
			<input type='text' name='subject' id='subject' value='hihihi!~~' /><br/><br/>
			<textarea id='content' name='content' rows="5" cols="50" style='resize: none;'>hello hello!</textarea><br/><br/>
		</form><br/>
		<input type='button' id='btnOne' value='한번 전송(ONE)' />
		<input type='button' id='btnTrigger' value='TRIGGER' />
		<input type='button' id='btnBind' value='BIND' />
		<input type='button' id='btnReset' value='RESET' onclick='location.reload();' /><br/><br/>
		<div id='result'></div>
	</div>

</body>
</html>