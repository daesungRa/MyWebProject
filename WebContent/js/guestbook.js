/**
 * refer by guestbook.insert
 */
function insertMain() {
    var frm = document.frm;

    frm.btnSubmit.onclick = function () {
        frm.action = '';
        frm.submit();
    }
}

/**
 * refer by guestbook.list
 */
function listMain() {
    var frm = document.frm;

    // 검색창 전체선택
    frm.search.onfocus = function () {
        frm.search.select();
    }

    // 검색
    frm.btnSearch.onclick = function () {
        frm.nowPage.value = 1;
        frm.submit();
    }

    // 전체검색
    frm.btnSearchAll.onclick = function () {
        frm.search.value = 'SelectAll';
        frm.nowPage.value = 1;
        frm.submit();
    }
}

/**
 * refer by guestbook.list
 */
function viewMain() {
    var frm = document.frm;

    frm.getElementById('guestbookViewPage').getElementById('btnWrite').onclick = createWritePage(frm);
}

function createWritePage(ff) {
    location.href = 'index.jsp?aside=/control.jsp&content=/views/guestbook/viewGuestBook.jsp&write=true';
}

function modifyOn(ff) {
    if (ff.btnModify.value == '저장') {
        var p = prompt("저장하려면 암호를 입력하세요");
        ff.content.readOnly = true;
        ff.btnModify.value = '수정';
        ff.submit();
    } else {
        ff.content.readOnly = false;
        ff.btnModify.value = '저장';
    }
}

function funcDelete(ff) {
    var p = prompt("삭제하려면 암호를 입력하세요");
    ff.submit();
}