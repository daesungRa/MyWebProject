/**
 * 공통
 */
var xhr = new XMLHttpRequest();
var cnt = 0; // 첨부파일 개수 카운트 및 각 태그 구분을 위한 변수

function runBoardXML (method, url, form) {
	var brd = getId('board');
	xhr.open(method, url);
	xhr.onreadystatechange = function () {
		if (xhr.readyState == 4 && xhr.status == 200) {
			brd.innerHTML = xhr.responseText;
		}
	}
	xhr.send(form);
}

/**
 * refer by index.jsp
 */
function indexMain() {
	// guestbook
    var btnLogin = document.getElementById('btnLogin');
    var btnLogout = document.getElementById('btnLogout');
    var header = document.getElementById('title');

    var guestbook = document.getElementById('guestbook');
    var content = document.getElementById('content');
    var btnWrite = null;
    var sessionId = null;
    var writePlace = null;
    var xhr = new XMLHttpRequest();

    if (btnLogin != null) {
        btnLogin.onclick = function () {
            location.href = 'index.jsp?content=./views/member/login.jsp';
        }
    }
    if (btnLogout != null) {
        btnLogout.onclick = function () {
            location.href = './views/member/logout.jsp';
        }
    }
    header.onclick = function () {
        location.href = 'index.jsp?aside=./views/intro.jsp&content=./views/intro.jsp';
    }

    guestbook.onclick = function () {
        xhr.open('get', '/views/guestbook/viewGuestbook.jsp');
        xhr.send();
        xhr.onreadystatechange = function () {
            if (xhr.readyState == 4 && xhr.status == 200) {
                var data = xhr.responseText;
                content.innerHTML = data;

                btnWrite = document.getElementById('btnWrite');
                writePlace = document.getElementById('writePlace');
                sessionId = document.getElementById('sessionId');

                btnWrite.onclick = function () {
                    writeOn(btnWrite, writePlace, sessionId, xhr);
                }
            }
        }
    }
}

/**
 * methods for board page
 */
function funcBoardView (num) {
	var frm = document.boardFrm;
	var boardNo = document.getElementsByClassName('boardNo');
	var serial = boardNo[num + 1].innerHTML;
	frm.search.value = '';
	frm.nowPage.value = 1;
	frm.serial.value = serial;
	
	var xhr = new XMLHttpRequest();
	xhr.open('post', 'view.brd');
	var formData = new FormData(frm);
	xhr.send(formData);
	xhr.onreadystatechange = function () {
		if (xhr.readyState == 4 && xhr.status == 200) {
			var result = xhr.responseText;
			var content = document.getElementById('content');
			content.innerHTML = result;
		}
	}
}
function funcBoardSearch (num) {
	var frm = document.boardFrm;
	if (num == 1) {
		frm.search.value = '';
	}
	frm.nowPage.value = 1;
	frm.action = 'list.brd';
    // boardFrm.submit();
    
    var xhr = new XMLHttpRequest();
    xhr.open('post', 'list.brd');
    var formData = new FormData(frm);
	xhr.send(formData);
	xhr.onreadystatechange = function () {
		if (xhr.readyState == 4 && xhr.status == 200) {
			var result = xhr.responseText;
			var content = document.getElementById('content');
			content.innerHTML = result;
		}
	}
}
function funcBoardPage (nowPage) {
    var boardFrm = document.boardFrm;
	// 페이지 이동이므로 전달받은 nowPage 에 맞는 조건으로 세팅
    boardFrm.search.value = '';
    boardFrm.nowPage.value = nowPage;
    boardFrm.action = 'list.brd';
    // boardFrm.submit();
    
    var xhr = new XMLHttpRequest();
    xhr.open('post', 'list.brd');
    var formData = new FormData(boardFrm);
	xhr.send(formData);
	xhr.onreadystatechange = function () {
		if (xhr.readyState == 4 && xhr.status == 200) {
			var result = xhr.responseText;
			var content = document.getElementById('content');
			content.innerHTML = result;
		}
	}
}
function funcBoardInsert () {
	if (document.getElementById('sessionId').value == '') {
		alert("로그인 후 글 작성이 가능합니다");
		location.href = 'index.jsp?content=./views/member/login.jsp';
		return;
	}
	
	var xhr = new XMLHttpRequest();
	xhr.open('get', '/views/board/insert.jsp');
	xhr.send();
	xhr.onreadystatechange = function () {
		if (xhr.readyState == 4 && xhr.status == 200) {
			var result = xhr.responseText;
			var content = document.getElementById('content');
			content.innerHTML = result;
			
			// 최초 insert 페이지로 이동했다면 appendAttFile 함수를 실행해 첨부파일 영역에 파일첨부 div 를 한 개 추가한다
			var zone = document.getElementById('attFile_zone');
			appendAttFile(zone);
		}
	}
}
// 파일첨부 함수
function appendAttFile(att_zone) {
	var div = document.createElement('div');
	div.setAttribute('style', 'width: 120px; height: 160px; display: inline-block;');
	
	// 이미지 태그 생성 및 속성 지정
	// 위에 생성된 div 태그 내에 자식 노드로 포함된다
	var img = document.createElement('img');
	img.setAttribute('name', 'img' + cnt);
	img.setAttribute('width', '120px');
	img.setAttribute('height', '160px');
	img.src = 'http://placehold.it/120x160';
	img.onclick = imagePreView; // img 태그 클릭 시 이미지 미리보기 함수가 실행됨
	
	// file 태그 생성 및 속성 지정
	// 위에 생성된 div 태그 내에 자식 노드로 포함된다
	var file = document.createElement('input');
	file.setAttribute('type', 'file');
	file.setAttribute('name', 'attFile' + cnt);
	file.setAttribute('modify', 'no'); // 자신이 수정되었는지 판단
	file.setAttribute('style', 'display: none;');
	file.setAttribute('class', 'attFile');
	
	// 삭제 버튼
	// 위에 생성된 div 태그 내에 자식 노드로 포함된다
	var btnDel = document.createElement('input');
	btnDel.setAttribute('name', 'delFile' + cnt);
	btnDel.setAttribute('type', 'button');
	btnDel.setAttribute('value', 'x');
	btnDel.setAttribute('class', 'delFile');
	btnDel.onclick = function (ev) { // 삭제 버튼 클릭 시
		var tag = ev.srcElement; // 클릭 이벤트가 발생한 삭제 버튼 tag 를 가져와
		var parent = tag.parentNode; // tag 의 부모 노드, 즉 div 태그를 가져와
		var file = parent.getElementsByClassName('attFile')[0]; // 그 중 attFile 클래스명을 가진 노드를 가져오되, 배열 형식이므로 첫째 노드 가져오면 됨
		if (file.getAttribute('modify') == 'yes') { // 가져온 attFIle 태그의 modify 속성이 yes 라면,
			att_zone.removeChild(parent); // 전체 첨부파일 영역(att_zone) 에서 자신이 속한 부모 노드 전체 (div) 를 삭제한다
		}
	}
	
	// 생성한 div 태그 내에 img, file, btnDel 태그들을 추가한다
	div.appendChild(img);
	div.appendChild(file);
	div.appendChild(btnDel);
	
	// 완성된 div 태그를 첨부파일 영역 (att_zone) 에 추가한다
	att_zone.appendChild(div);
	// 첨부파일 개수 카운트 및 각 태그 구분을 위한 변수
	cnt++;
}
// 파일첨부를 위한 이미지프리뷰 함수
// img 태그를 클릭하면 함께 있는 file 태그를 클릭하는 효과,
// file 태그를 클릭하면 최초 1회는 파일을 추가하고, 이후에는 추가한 파일을 수정한다
// file 태그가 바뀌었다면 (onchange) 첨부파일 영역 (zone) 에 파일첨부 div 태그를 추가하는 appendAttFile 함수를 실행하고, modify 속성을 yes 로 바꾼다
// file 태그의 modify 속성이 yes 라는 것은 추후 삭제버튼 클릭 시 div 삭제의 근거가 된다
function imagePreView (ev) {
	var zone = document.getElementById('attFile_zone');
	var img = ev.srcElement; // 이미지 클릭 이벤트가 발생한 소스 태그를 얻어옴
	var parent = img.parentNode;
	var fileTag = parent.getElementsByClassName('attFile')[0]; // 마찬가지로 자신이 속한 부모 노드의 클래스 중 'attFile' 인 file 태그를 가져옴
	fileTag.click();
	
	fileTag.onchange = function () {
		var url = fileTag.files[0];
		var reader = new FileReader();
		reader.readAsDataURL(url);
		reader.onload = function (ev2) {
			img.src = ev2.target.result;
		}
		if (fileTag.getAttribute('modify') == 'no') {
			appendAttFile(zone);
		}
		fileTag.setAttribute('modify', 'yes');
	}
}
function funcBoardInsertAction (ff) {
	if (ff.userId.value == '') {
		alert('로그인 후 이용하세요');
		ff.userId.focus();
		return;
	} else if (ff.boardTitle.value == '') {
		alert('제목을 입력하세요');
		ff.boardTitle.focus();
		return;
	} else if (ff.boardContent.value == '') {
		alert('내용을 입력하세요');
		ff.boardContent.focus();
		return;
	} else if (ff.userPwd.value == '') {
		alert('비밀번호를 입력하세요');
		ff.userPwd.focus();
		return;
	}
	
	var xhr = new XMLHttpRequest();
    xhr.open('post', 'insert.brd');
    var formData = new FormData(ff);
	xhr.send(formData);
	xhr.onreadystatechange = function () {
		if (xhr.readyState == 4 && xhr.status == 200) {
			alert('새 글 등록 완료');
			var result = xhr.responseText;
			var content = document.getElementById('content');
			content.innerHTML = result;
		}
	}
}
function funcBoardModify () {
	
}
function funcBoardModifyAction () {
	
}