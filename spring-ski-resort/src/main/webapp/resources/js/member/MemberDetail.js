
//주소 찾기
function clickAddr() {
    document.getElementById('button-addon2').click();
}


//광고성 체크
document.getElementById('flexSwitchCheckDefault').addEventListener('click', () => {
    let id = document.getElementById('flexSwitchCheckDefault').value;
    let check = '';
    if (document.getElementById('flexSwitchCheckDefault').checked == true) {
        check = 'terms3check';
    } else {
        check = 'non-check';
    }

    let checkData = {
        memberId: id,
        memberTerms3: check
    }


    cdChecker(checkData);
})


async function cdChecker(checkData) {
    try {
        const url = '/member/check/cdcheck';
        const config = {
            method: 'post',
            headers: {
                'Content-Type': 'application/json; charset=utf-8'
            },
            body: JSON.stringify(checkData)
        }
        await fetch(url, config);

    } catch (error) {
        console.log(error);
    }

}


/* 이메일 로직*/
/*이메일 인증*/
// 중복체크
async function emailCheck(email) {
    try {
        const url = "/member/check/email/" + email;
        const config = {
            method: 'get'
        };
        const resp = await fetch(url, config);
        const result = await resp.text();
        return result;
    } catch (error) {
        console.log(error);
    }
}
// 인증로직
async function emailNumCheck(email) {
    try {
        const url = "/member/check/num/" + email;
        const config = {
            method: 'get'
        };
        const resp = await fetch(url, config);
        const result = await resp.text();
        return result;
    } catch (error) {
        console.log(error);
    }
}

document.getElementById('modalEmailCheckBtn').addEventListener('click', () => {
    const email = document.getElementById('modalEmailCheck').value;
    const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

    document.getElementById('emailCheckSuccess').disabled = 'disabled';

    if (!emailPattern.test(email)) {
        document.getElementById('modalEmailCheck').className = 'form-control is-invalid';
        document.getElementById('emailDuplicateCheck').innerText = '유효하지 않은 이메일입니다.';
        document.getElementById('emailDuplicateCheck').style.color = 'red';
        return;
    }


    emailCheck(email).then(result => {

        if (result > 0) {
            document.getElementById('modalEmailCheck').className = 'form-control is-invalid';
            document.getElementById('emailDuplicateCheck').innerText = '가입된 이메일이 이미 존재합니다.';
            document.getElementById('emailDuplicateCheck').style.color = 'red';
        } else {
            document.getElementById('modalEmailCheck').className = 'form-control is-valid';
            document.getElementById('emailDuplicateCheck').innerText = '이메일을 확인해 주세요.';
            document.getElementById('emailDuplicateCheck').style.color = 'green';
            document.getElementById('modalEmailCheckBtn').disabled = true;



            let modalEmailNum = document.getElementById('modal-body2');
            modalEmailNum.innerHTML = '';

            let str = `<div class="form-group registerBox rb-5">`;
            str += `<label for="modalEmailCheck" class="form-label mt-4">인증번호</label>`;
            str += `<div class="input-group mb-3">`;
            str += `<input type="text" class="form-control" id="userAuthKey" aria-describedby="emailHelp" placeholder="인증번호" />`;
            str += `<button type="button" class="btn btn-primary" id="modalEmailCheckBtn2">인증번호 확인</button>`;
            str += `</div>`;
            str += `<div id="modalEmailMessage"></div>`;
            str += `</div>`;
            modalEmailNum.innerHTML += str;

            let serverAuthKey = 0;
            emailNumCheck(email).then(result => {
                serverAuthKey = result;
            });

            document.getElementById('modalEmailCheckBtn2').addEventListener('click', () => {
                console.log('사용자키 : ' + document.getElementById('userAuthKey').value);
                console.log('서버키 : ' + serverAuthKey);
                console.log('인증완료!');
                if (serverAuthKey != document.getElementById('userAuthKey').value ||
                    document.getElementById('userAuthKey').value == '' ||
                    document.getElementById('userAuthKey').value == null) {

                    console.log('인증실패!');
                    document.getElementById('userAuthKey').className = 'form-control is-invalid';
                    document.getElementById('modalEmailMessage').innerText = '인증번호를 확인해주세요.';
                    document.getElementById('modalEmailMessage').style.color = 'red';

                } else {

                    document.getElementById('modalEmailCheckBtn2').disabled = true;
                    document.getElementById('userAuthKey').className = 'form-control is-valid';
                    document.getElementById('modalEmailMessage').innerText = '인증완료 버튼을 누르세요.';
                    document.getElementById('modalEmailMessage').style.color = 'green';
                    document.getElementById('emailCheckSuccess').disabled = false;
                    document.getElementById('inputMemberEmail').value = email;

                }
            })


        }

    })

    document.getElementById('emailCheckSuccess').addEventListener('click', () => {
        document.getElementById('modalClose').click();
    })


}) 




//이메일 입력창 띄우기
document.getElementById('inputMemberEmail').addEventListener('click', () => {
    document.getElementById('MemberEmailCheck').click();

})