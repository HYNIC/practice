// 연락처 포커스 이동
function moveFocus(arg, next, len) {
    if(arg.value.length == len) {
        next.focus();
        return;
    }
}

let input = document.querySelectorAll(".form-input");
let submit_btn = document.querySelector("#submit-btn");
input.addEventListener("change", activate_btn);

// 버튼활성화
function activate_btn() {
    if (input.value == "") {
        submit_btn.disabled = true;
    } else {
        submit_btn.disabled = false;
    }
}

