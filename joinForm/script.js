// 연락처 포커스 이동
function moveFocus(arg, next, len) {
    if(arg.value.length == len) {
        next.focus();
        return;
    }
}

// 버튼 활성화
function activateBtn() {            
    const joinBtn = document.querySelector("#submit-btn"),
        email = document.querySelector("#email"),
        name = document.querySelector("#name"),
        pw = document.querySelector("#pw"),
        re_pw = document.querySelector("#pw2"),
        phone1 = document.querySelector("#phone1"),
        phone2 = document.querySelector("#phone2"),
        phone3 = document.querySelector("#phone3"),
        city = document.querySelector(".join-form-city"),
        gender = document.querySelector("input[name='gender']:checked");
    
    if (!(email.value && name.value && pw.value && re_pw.value && (phone1.value.length == 3) && (phone2.value.length == 4) && (phone3.value.length == 4) && (city.value.length != 0) && gender.value)) {
        joinBtn.disabled = true;
    } else {
        joinBtn.disabled = false;
    }
}

function confirmInput() {
    let email = document.querySelector("#email"),
        name = document.querySelector("#name"),
        pw = document.querySelector("#pw"),
        re_pw = document.querySelector("#pw2"),
        phone1 = document.querySelector("#phone1"),
        phone2 = document.querySelector("#phone2"),
        phone3 = document.querySelector("#phone3"),
        city = document.querySelector(".join-form-city"),
        gender = document.querySelector("input[name='gender']:checked");

    let msg;
    msg = '가입정보를 확인해 주세요\n'
    msg += '\nE-mail : ' + email.value;
    msg += '\n이름 : ' + name.value;
    msg += '\n비밀번호 : ' + pw.value;
    msg += '\n비밀번호 확인 : ' + re_pw.value;
    msg += '\n연락처 : ' + phone1.value + '-' + phone2.value + '-' + phone3.value;
    msg += '\n지역 : ' + city.value;
    msg += '\n성별 : ' + gender.value; 
    
    alert(msg);
}

function checkEmail() {
    let email = document.querySelector("#email");
    let errMsg = document.querySelector("#err-email");

    let str = email.value.split('@');
    
    if (!str[1]) {
        email.style.border = "2px solid tomato";
        errMsg.style.display = "block";
        errMsg.innerText = "올바른 이메일 형식이 아닙니다"
    } else {
        email.style.border = "1px solid grey";
        errMsg.style.display = "none";
        errMsg.innerText = "";
    }
}

function checkPw() {
    let pw = document.querySelector("#pw");
    let re_pw = document.querySelector("#pw2");
    let errMsg = document.querySelector("#err-pw");

    if (pw.value != re_pw.value) {
        pw.style.border = "2px solid tomato";
        re_pw.style.border = "2px solid tomato";
        errMsg.style.display = "block";
        errMsg.innerText = "비밀번호가 일치하지 않습니다."
    } else {
        pw.style.border = "1px solid grey";
        re_pw.style.border = "1px solid grey";
        errMsg.style.display = "none";
        errMsg.innerText = "";
    }
}



