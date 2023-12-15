
document.getElementById('member-merchantUid').addEventListener('click', (e) => {
    // 클릭된 요소가 'member-merchantUid'인지 확인
    if (e.target.id === 'member-merchantUid') {
        // data-merchantUid 값을 얻음
        let payMerchantUid = e.target.getAttribute('data-merchantUid');
        console.log(payMerchantUid);


        ansQnamerchantUidToServer(payMerchantUid).then(result => {
            console.log(result);
        })
    }
});


async function ansQnamerchantUidToServer(payMerchantUid) {
    try {
        const url = '/member/check/receipt/' + payMerchantUid;
        const config = {
            method: 'get'
        }
        const resp = await fetch(url, config);
        const result = await resp.json();
        return result;
    } catch (error) {
        console.log(error);
    }
}