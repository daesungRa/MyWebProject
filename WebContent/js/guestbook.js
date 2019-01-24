/**
 * refer by guestbook.insert
 */
function insertMain () {
    var frm = document.frm;

    frm.btnSubmit.onclick = function () {
        frm.action = '';
        frm.submit();
    }
}