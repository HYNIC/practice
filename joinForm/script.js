// 변수 선언
let joinBtn, email, username, pw, re_pw, phoneArr, city, gender, checkPhone, input_err, email_err, pw_err;

joinBtn = document.querySelector("#submit-btn");
email = document.querySelector("#email");
username = document.querySelector("#name");
pw = document.querySelector("#pw");
re_pw = document.querySelector("#pw2");
phoneArr = document.querySelectorAll(".phone");
city = document.querySelector(".join-form-city"); 

// 이벤트리스너 
document.querySelector(".join-form").addEventListener("input", activateBtn); // 폼 이벤트 리스너(버튼활성화)
joinBtn.addEventListener("click", confirmInput); // 버튼클릭시 가입정보 alert띄우기
email.addEventListener("input", checkEmail); // 이메일 형식 체크

// 숫자입력체크
phoneArr.forEach( (phone) => {
    phone.addEventListener("input", (e) => checkNum(e.currentTarget));
});

// 연락처 포커스이동
for (let i = 0; i < phoneArr.length; i++) {
    if (i < phoneArr.length -1) {
        phoneArr[i].addEventListener("keyup", (e) => moveFocus(e.currentTarget, phoneArr[i + 1]));
    } else {
        phoneArr[i].addEventListener("keyup", (e) => moveFocus(e.currentTarget, city));
    }
}


// 버튼 활성화
function activateBtn() {
    checkPw();

    // input마다 gender checked된 값 확인
    gender = document.querySelector("input[name='gender']:checked");

    // 연락처 값이 완전히 입력되었는지 확인
    for (i = 0; i < phoneArr.length; i++) {
        checkPhone = phoneArr[i].value.length == phoneArr[i].getAttribute('maxlength');
        if (!checkPhone) {
            break;
        }
    }

    // 모든 값이 작성되었는지 확인
    let input_check = email.value && username.value && pw.value && re_pw.value && checkPhone && (city.value.length != 0) && gender.value;

    // 에러메시지 떠있는지 확인
    let isErr = (email_err.style.display == "block") || (pw_err.style.display == "block");

    // 조건에 따라 버튼 활성화
    if (!input_check) {
        joinBtn.disabled = true;
    } else if (isErr) {
        joinBtn.disabled = true;
    } else {
        joinBtn.disabled = false;
    }
}

// 가입정보 alert창 띄우는 함수
function confirmInput() {
    let msg;
    msg = '가입정보를 확인해 주세요\n'
    msg += '\nE-mail : ' + email.value;
    msg += '\n이름 : ' + username.value;
    msg += '\n비밀번호 : ' + pw.value;
    msg += '\n비밀번호 확인 : ' + re_pw.value;
    msg += '\n연락처 : ' + phone1.value + '-' + phone2.value + '-' + phone3.value;
    msg += '\n지역 : ' + city.value;
    msg += '\n성별 : ' + gender.value; 
    
    alert(msg);
}

// email형식 체크 함수
function checkEmail() {
    email_err = document.querySelector("#err-email");

    let email_str = email.value.split('@');
    
    if (!email_str[1]) {
        email.style.border = "2px solid tomato";
        email_err.style.display = "block";
        email_err.innerText = "올바른 이메일 형식이 아닙니다"
    } else {
        let email_domain = email_str[1].split('.');
        if (!email_domain[1]) {
            email.style.border = "2px solid tomato";
            email_err.style.display = "block";
            email_err.innerText = "올바른 이메일 형식이 아닙니다"
        } else {
            email.style.border = "1px solid grey";
            email_err.style.display = "none";
            email_err.innerText = "";
        }
    } 
}

// 비밀번호 일치 확인
function checkPw() {
    pw_err = document.querySelector("#err-pw");

    if (pw.value != re_pw.value) {
        pw.style.border = "2px solid tomato";
        re_pw.style.border = "2px solid tomato";
        pw_err.style.display = "block";
        pw_err.innerText = "비밀번호가 일치하지 않습니다."
    } else {
        pw.style.border = "1px solid grey";
        re_pw.style.border = "1px solid grey";
        pw_err.style.display = "none";
        pw_err.innerText = "";
    }
}

// 연락처 숫자만 입력가능하도록.
function checkNum(arg) {
    arg.value = arg.value.replace(/[^0-9]/g,'');
}

// 연락처 포커스 이동
function moveFocus(arg, next) {
    if(arg.value.length == arg.getAttribute('maxlength')) {
        next.focus();
        return;
    }
}
