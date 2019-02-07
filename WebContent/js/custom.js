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
    
    // board
    var btnMoveBoardInsert = document.getElementById('moveBoardInsert');
    
    btnMoveBoardInsert.onclick = function () {
    	funcMoveBoardInsert(xhr);
    }
}

/**
 * methods for board page
 */
function funcMoveBoardInsert (xhr) {
	xhr.open('get', '/views/board/insert.jsp');
	xhr.send();
	xhr.onreadystatechange = function () {
		if (xhr.readyState == 4 && xhr.status == 200) {
			var result = xhr.responseText;
			var content = document.getElementById('content');
			content.innerHTML = result;
		}
	}
}
function searchBoard (num) {
	var boardFrm = document.boardFrm;
	if (num == 1) {
		boardFrm.search.value = '';
	}
    boardFrm.nowPage.value = 1;
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
function movePage (nowPage) {
    var boardFrm = document.boardFrm;
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