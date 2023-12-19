

// function attachClickListener(buttonId) {
//     document.getElementById(buttonId).addEventListener('click', function () {
//         let pgName = document.getElementById(buttonId).value;
//         console.log('pgName:', pgName);
//         paymentGateway(pgName);
//     });
// }

// 각종 paymentGateway 버튼
// attachClickListener('kakao_pay');
// attachClickListener('inicis_pay');
// attachClickListener('toss_pay');
// attachClickListener('payco_pay');



function paymentGateway(pgName) {
    //임시로 방이름만 가져옴. 나중에 방이름/렌탈장비/리프트권이름 유연하게 가져와야함.
    let payName = document.getElementById('item-name').innerText; //상품명
    let nameType = document.getElementById('name-type').value;  //결제하는곳
    let UniqueNumber; //호텔 룸 넘버
    if (nameType == '호텔') {
        UniqueNumber = document.getElementById('room-payinfo-num').value;
    } else if (nameType == "리프트") {

    } else {
        console.log("렌탈입니다");
    };

    let coupon = document.getElementById('couponCode').value;

    IMP.init("imp70464277");
    console.log("결제햐라12");
    IMP.request_pay({
        pg: pgName,
        pay_method: 'card', //card(신용카드), trans(실시간계좌이체), vbank(가상계좌), phone(휴대폰소액결제)
        merchant_uid: "order_no_" + new Date().getTime(), // 상점에서 관리하는 주문 번호
        name: payName,
        amount: realAmount,
        buyer_email: memberEmail,
        buyer_name: memberName,
        buyer_tel: memberPhoneNum,
        buyer_addr: memberAddress,
    }, function (rsp) {
        if (rsp.success) {

            // 서버로 데이터를 전송
            fetch("/pay/portOne", {
                method: "POST",
                headers: {
                    "Content-Type": "application/json; charset=UTF-8",
                },
                body: JSON.stringify({
                    payImpUid: rsp.imp_uid,
                    payMerchantUid: rsp.merchant_uid,
                    payPg: rsp.pg_provider,
                    payMethod: rsp.pay_method,
                    payName: rsp.name,
                    payAmount: rsp.paid_amount,
                    memberName: rsp.buyer_name,
                    memberEmail: rsp.buyer_email,
                    memberPhoneNum: rsp.buyer_tel,
                    memberAddress: rsp.buyer_addr,
                    uniqueNumber: UniqueNumber,
                    payNameType: nameType,
                    itemsArray: itemsArray,
                    couponCode: coupon,
                }),
            })
                .then((response) => response.text())
                .then((data) => {
                    // 서버에서의 추가 처리
                    if (data == "결제완료") {
                        document.getElementById('payName').value = rsp.name;
                        document.getElementById('payAmount').value = rsp.paid_amount;
                        document.getElementById('payMerchantUid').value = rsp.merchant_uid;
                        document.getElementById('payImpUid').value = rsp.imp_uid;
                        if (document.getElementById("payform")) {
                            document.getElementById("payform").submit();
                        }


                    } else {
                        //결제 실패시 처리

                        window.location.href = '/pay/PayFail?errorMessage=' + data;
                    }
                })
                .catch((error) => {
                });
        } else {
            var msg = '결제에 실패하였습니다.';
            msg += '에러내용 : ' + rsp.error_msg;

            alert(msg);
        }
    });
}


