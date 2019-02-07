/**
 * refer by viewGuestbook.jsp
 */
function writeOn(btnWrite, writePlace, sessionId, xhr) {
    if (btnWrite.value == '방명록 쓰기' && sessionId.value != '') { // 로그인 시
        // alert(sessionId.value + ' : 로그인 상태입니다');
        btnWrite.value = '방명록 닫기';

        xhr.open('get', '/views/guestbook/write.jsp');
        xhr.send();
        xhr.onreadystatechange = function () {
            if (xhr.readyState == 4 && xhr.status == 200) {
                var data = xhr.responseText;
                writePlace.innerHTML = data;
            }
        }
    } else if (btnWrite.value == '방명록 닫기' && sessionId.value != '') {
        // alert('방명록 쓰기를 닫습니다');
        btnWrite.value = '방명록 쓰기';
        writePlace.innerHTML = '';
    } else {
        alert('비로그인 상태입니다. 로그인 후 이용하세요');
        location.href = 'index.jsp?content=/views/member/login.jsp';
    }
}

function modifyOn(ff) {
    if (ff.btnModify.value == '저장') {
        var p = prompt("저장하려면 암호를 입력하세요", "");
        ff.pwd.value = p;
        ff.content.readOnly = true;
        ff.btnModify.value = '수정';
        ff.submit();
    } else {
        ff.content.readOnly = false;
        ff.btnModify.value = '저장';
    }
}

function funcInsert(ff) {
    var p = prompt("방명록을 등록하려면 암호를 입력하세요", "");
    ff.pwd.value = p;
    ff.submit();
}

function funcDelete(ff) {
    var p = prompt("삭제하려면 암호를 입력하세요", "");
    ff.action = "delete.gb";
    ff.pwd.value = p;
    ff.submit();
}

function createWritePage() {
    location.href = "viewGuestbook.gb";
}

function funcSearch(ff) {
    ff.nowPage.value = 1;
    ff.submit();
}

function movePage(nowPage) {
    var frm = document.member;
    frm.nowPage.value = nowPage;
    frm.submit();
}

function fit(tx) {
    var len = tx.value.split('\n').length;
    if (len > 10) len = 10;
    tx.rows = len;
}