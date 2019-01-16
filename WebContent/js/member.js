/**
 * refer by insert.jsp
 */
function mainInsert() {
    var frm = document.member;

    frm.id.focus();
    frm.id.select();

    // 다 입력한게 아니라면 엔터키 누르면 커서 이동
    var items = document.getElementsByClassName('item');
    for (var i = 0; i < items.length; i++) {
        items[i].onkeyup = function (ev) {
            if (ev.keyCode == 13) {
                var obj = null;
                switch (ev.srcElement.name) {
                    case 'id':
                        obj = frm.irum;
                        break;
                    case 'irum':
                        obj = frm.pwd;
                        break;
                    case 'pwd':
                        obj = frm.email;
                        break;
                    case 'email':
                        obj = frm.phone;
                        break;
                    case 'phone':
                        obj = frm.rdate;
                        break;
                }
                obj.focus();
                obj.select();
            }
        }
    }

    var d = new Date();

    // 가입일 현재 일자로 초기화
    /* var temp = d.getFullYear() + 1900 + ' - ' + d.getMonth() + 1 + ' - ' + d.getDate();
    frm.rdate.value = temp; */
    frm.rdate.valueAsDate = d;

    // 이미지를 선택하거나 수정한 경우
    frm.photo.onchange = imagePreView;

    // 중복체크
    frm.btnIdCheck.onclick = function () {
        var id = frm.id;
        if (id.value == '') {
            id.focus();
            alert('pla input id..');
        } else {
        	var uri = './views/member/idCheck.jsp?id=' + id.value;
            var win = window.open(uri, 'win', 'width: 200px; height: 50px;, resizable=no, toolbar=no');
        }
    }

    // 전송 버튼이 클릭된 경우
    frm.btnSubmit.onclick = function () {
        var obj = inputDataCheck(frm);
        // obj 가 null 이면, submit 이 그대로 실행됨
        if (obj != null) {
            if (obj.value == 'unChecked') {
                frm.id.focus();
                alert('아이디 중복확인해 주세요');
            } else {
                obj.focus();
                alert('데이터를 확인해 주세요');
            }
            return false;
        }
        frm.submit();
    }
}

function imagePreView (e) {
    var frm = document.member;
    var url = e.srcElement;
    var file = url.files[0];
    var reader = new FileReader();
    reader.readAsDataURL(file);
    reader.onload = function (e2) {
        var img = new Image();
        img.src = e2.target.result;
        frm.image.src = img.src;
    }
}

function inputDataCheck (frm) {
    var obj = null;
    var emailExp01 = /^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$/;
    var emailExp02 = /^\w+@\w+.\w(.\w){1,2}/;
    var phoneExp01 = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/;
    var phoneExp02 = /^\d{2,3}-\d{3,4}-\d{4}$/;

    if (frm.id.value == '') obj = frm.id;
    else if (frm.isChecked.value == 'unChecked') obj = frm.isChecked;
    else if (frm.irum.value == '') obj = frm.irum;
    else if (frm.pwd.value == '') obj = frm.pwd;
    else if (frm.rdate.value == '') obj = frm.rdate;
    else if (!emailExp02.test(frm.email.value)) obj = frm.email;
    else if (!phoneExp02.test(frm.phone.value)) obj = frm.phone;

    return obj; // ok == null, data err == data
}