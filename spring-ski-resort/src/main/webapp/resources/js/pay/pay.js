
// $("#check_module").click(function () {
//     IMP.init('imp70464277'); 
//     // i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
//     // ''안에 띄어쓰기 없이 가맹점 식별코드를 붙여넣어주세요. 안그러면 결제창이 안뜹니다.
//     IMP.request_pay({
//         pg: 'html5_inicis.MIIiasTest',
//         pay_method: 'card',
//         merchant_uid: 'merchant_' + new Date().getTime(),
//         /* 
//             *  merchant_uid에 경우 
//             *  https://docs.iamport.kr/implementation/payment
//             *  위에 url에 따라가시면 넣을 수 있는 방법이 있습니다.
//             */
//         name: '주문명 : 아메리카노',
//         // 결제창에서 보여질 이름
//         // name: '주문명 : ${auction.a_title}',
//         // 위와같이 model에 담은 정보를 넣어 쓸수도 있습니다.
//         amount: 1000,
//         // amount: ${bid.b_bid},
//         // 가격 
//         buyer_name: '이름',
//         // 구매자 이름, 구매자 정보도 model값으로 바꿀 수 있습니다.
//         // 구매자 정보에 여러가지도 있으므로, 자세한 내용은 맨 위 링크를 참고해주세요.
//         buyer_postcode: '123-456',
//         }, function (rsp) {
//             console.log(rsp);
//         if (rsp.success) {
//             var msg = '결제가 완료되었습니다.';
//             msg += '결제 금액 : ' + rsp.paid_amount;
//             // success.submit();
//             // 결제 성공 시 정보를 넘겨줘야한다면 body에 form을 만든 뒤 위의 코드를 사용하는 방법이 있습니다.
//             // 자세한 설명은 구글링으로 보시는게 좋습니다.
//         } else {
//             var msg = '결제에 실패하였습니다.';
//             msg += '에러내용 : ' + rsp.error_msg;
//         }
//         alert(msg);
//     });
// });


IMP.init("imp70464277");
IMP.request_pay({
    pg: 'html5_inicis',
    pay_method: 'card',
    merchant_uid: "order_no_0001", // 상점에서 관리하는 주문 번호
    name: '주문명:결제테스트',
    amount: 14000,
    buyer_email: 'iamport@siot.do',
    buyer_name: '구매자이름',
    buyer_tel: '010-1234-5678',
    buyer_addr: '서울특별시 강남구 삼성동',
    buyer_postcode: '123-456'
}, function (rsp) {
    if (rsp.success) {
        //[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
        jQuery.ajax({
            url: "/payments/complete", //cross-domain error가 발생하지 않도록 주의해주세요
            type: 'POST',
            dataType: 'json',
            data: {
                imp_uid: rsp.imp_uid
                //기타 필요한 데이터가 있으면 추가 전달
            }
        }).done(function (data) {
            //[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
            if (everythings_fine) {
                var msg = '결제가 완료되었습니다.';
                msg += '\n고유ID : ' + rsp.imp_uid;
                msg += '\n상점 거래ID : ' + rsp.merchant_uid;
                msg += '\결제 금액 : ' + rsp.paid_amount;
                msg += '카드 승인번호 : ' + rsp.apply_num;

                alert(msg);
            } else {
                //[3] 아직 제대로 결제가 되지 않았습니다.
                //[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
            }
        });
    } else {
        var msg = '결제에 실패하였습니다.';
        msg += '에러내용 : ' + rsp.error_msg;

        alert(msg);
    }
});