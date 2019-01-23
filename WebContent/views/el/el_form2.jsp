<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL Insert Form Enctype</title>
</head>
<body>

	<div id='elForm'>
		<h1>EL Insert Form Enctype</h1>
		
		<form name='frm' action='index.jsp?aside=./index_el.jsp&content=./views/el/el_form_result2.jsp'
				method='post' enctype="multipart/form-data">
			<label>인사말 : </label>
			<input type='text' name='intro' placeholder='임의의 값을 입력하세요' /><br/>
			
			<label>좋아하는 스포츠 : </label>
			<label><input type='radio' name='sports' value='baseball' />야구</label>
			<label><input type='radio' name='sports' value='tennis' />테니스</label><br/>
			
			<label>좋아하는 강 : </label>
			<label><input type='checkbox' name='rivers' value='han'/>한강</label>
			<label><input type='checkbox' name='rivers' value='kum'/>금강</label>
			<label><input type='checkbox' name='rivers' value='nackdong'/>낙동강</label>
			<label><input type='checkbox' name='rivers' value='duman'/>두만강</label><br/>
			
			<label>취미 (복수입력) : </label>
			<select name='hobbies' multiple>
				<option value='reading'>독서</option>
				<option value='listenMusic'>음악감상</option>
				<option value='writing'>글쓰기</option>
				<option value='sleeping'>잠자기</option>
				<!-- <optgroup label="static">
					<option value='reading'>독서</option>
					<option value='listenMusic'>음악감상</option>
					<option value='writing'>글쓰기</option>
				</optgroup>
				<optgroup label="active">
					<option value='soccer'>축구</option>
					<option value='basketball'>농구</option>
					<option value='baseball'>야구</option>
				</optgroup> -->
			</select><br/>
			<input type='submit' value='제 출' />
		</form>
	</div>

</body>
</html>