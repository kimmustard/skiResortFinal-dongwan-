

document.getElementById('qna-merchantUid-btn').addEventListener('click', () => {
    let errorMessage = document.getElementById('qna-table-errorMessage');
    let merchantUid = document.getElementById('qna-merchantUid').value;
    errorMessage.innerHTML = '';

    qnaMemberMarchantUidToServer(merchantUid).then(result => {

        if (result == '1') {
            let str = `<span style="color:blue;">주문번호가 확인되었습니다.</span>`
            errorMessage.innerHTML += str;
        } else {
            let str = `<span style="color:red;">존재하지않는 주문번호입니다.</span>`;
            errorMessage.innerHTML += str;
        }

    })
})

async function qnaMemberMarchantUidToServer(merchantUid) {

    try {
        const url = '/member/check/merchant/' + merchantUid;
        const config = {
            method: 'get'
        }
        const resp = await fetch(url, config);
        const result = await resp.text();
        return result;
    } catch (error) {
        console.log(error);
    }
}

