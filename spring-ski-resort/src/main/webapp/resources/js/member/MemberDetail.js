
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

