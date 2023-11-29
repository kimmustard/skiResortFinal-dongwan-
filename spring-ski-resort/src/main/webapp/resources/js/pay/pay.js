function attachClickListener(buttonId) {
    document.getElementById(buttonId).addEventListener('click', function () {
        let pgName = document.getElementById(buttonId).value;
        console.log('pgName:', pgName);
        paymentGateway(pgName);
    });
}

// 각종 paymentGateway 버튼
attachClickListener('kakao_pay');
attachClickListener('inicis_pay');
attachClickListener('toss_pay');
attachClickListener('payco_pay');



function paymentGateway(pgName) {

    IMP.init("imp70464277");

    IMP.request_pay({
        pg: pgName,
        pay_method: 'card', //card(신용카드), trans(실시간계좌이체), vbank(가상계좌), phone(휴대폰소액결제)
        merchant_uid: "order_no_" + new Date().getTime(), // 상점에서 관리하는 주문 번호
        name: '주문명:결제테스트',
        amount: 1000,
        buyer_email: 'iamport@siot.do',
        buyer_name: '구매자이름',
        buyer_tel: '010-1234-5678',
        buyer_addr: '서울특별시 강남구 삼성동',
        buyer_postcode: '123-456'
    }, function (rsp) {
        if (rsp.success) {
            // 서버로 데이터를 전송
            fetch("/pay/portOne", {
                method: "POST",
                headers: {
                    "Content-Type": "application/json; charset=UTF-8",
                },
                body: JSON.stringify({
                    imp_uid: rsp.imp_uid,
                    merchant_uid: rsp.merchant_uid,
                    // 기타 필요한 데이터가 있으면 추가 전달

                }),
            })
                .then((response) => response.json())
                .then((data) => {
                    // 서버에서의 추가 처리
                    if (data.everythings_fine) {
                        var msg = '결제가 완료되었습니다.';
                        msg += '\n고유ID : ' + rsp.imp_uid;
                        msg += '\n상점 거래ID : ' + rsp.merchant_uid;
                        msg += '\결제 금액 : ' + rsp.paid_amount;
                        msg += '카드 승인번호 : ' + rsp.apply_num;

                        alert(msg);
                    } else {
                        // 결제가 되지 않은 경우의 처리
                    }
                })
                .catch((error) => {
                    console.error('Error:', error);
                });
        } else {
            var msg = '결제에 실패하였습니다.';
            msg += '에러내용 : ' + rsp.error_msg;

            alert(msg);
        }
    });
}
