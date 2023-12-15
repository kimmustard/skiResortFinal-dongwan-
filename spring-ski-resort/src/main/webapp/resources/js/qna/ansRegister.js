
let receiptSwitch = 0;

document.getElementById('member-merchantUid').addEventListener('click', (e) => {

    let board = document.getElementById('receipt-board');
    if (receiptSwitch == 0) {
        board.style.right = '0px';
        receiptSwitch = 1;
    } else if (receiptSwitch == 1) {
        board.style.right = '-500px';
        receiptSwitch = 0;
    }


    // 클릭된 요소가 'member-merchantUid'인지 확인
    if (e.target.id === 'member-merchantUid') {
        // data-merchantUid 값을 얻음
        let payMerchantUid = e.target.getAttribute('data-merchantUid');
        let div = document.getElementById('member-receipt-body');
        div.innerHTML = '';

        ansQnamerchantUidToServer(payMerchantUid).then(result => {
            console.log(result);
            // 객체의 각 속성을 특정 형식으로 출력하되, null 값은 출력하지 않음
            let str = `<h3>회원정보</h3>`;
            if (result.memberType != 'normal') {
                str += `<p>회원ID : ${result.memberEmail} (${result.memberType})</p>`;
            } else {
                str += `<p>회원ID : ${result.memberId}</p>`;
            }
            str += `<p>이름 : ${result.memberName}</p>`;
            str += `<p>번호 : ${result.memberPhoneNum}</p>`;
            str += `<p>결제회사 : ${result.payPg}</p>`;
            str += `<p>결제상태 : ${result.payStatus}</p>`;
            str += `<p>결제금액 : ${result.payAmount}원</p>`;
            str += `<p>결제시간 : ${result.payRegAt}</p>`;
            str += `<p>결제상품 : ${result.payName}</p><hr>`

            if (result.payStatus != '결제완료') {
                str += `<p><font style="color:red;font-size:20px;"><strong>환불 완료된 회원입니다. </strong></font></p>`;
                str += `<p>환불번호 : ${result.refundImpUid}</p>`;
                str += `<p>환불사유 : ${result.refundReason}</p>`;
                str += `<p>환불일자 : ${result.refundRegAt}</p>`;
                str += `<p>환불신청인 : ${result.refundType}</p>`;
                div.innerHTML = str;
                return;
            }

            str += `<p><font style="color:red;font-size:20px;"><strong>"${result.payNameType}" 상품을 구매한 회원입니다. </strong></font></p>`;
            if (result.payNameType == '호텔') {
                str += `<p>인원수 : 성인 ${result.hotelReservePeople} 명 / 어린이 ${result.hotelReserveChild} 입니다.</p>`;
                str += `<p>숙박 시작일 : ${result.hotelReserveStayEnd} / 숙박 종료일 : ${result.hotelReserveStayStart}</p>`;
            }else if (result.payNameType == '리프트') {
                str += `<p>인원수 : 성인 ${result.rentalLiftAdult} 명 / 어린이 ${result.rentalLiftKid} 입니다.</p>`;
                str += `<p>리프트권 시작일 : ${result.rentalLiftStart}</p>`;
            }else {
                str += `<p>인원수 : 성인 ${result.rentalReserveAdult} 명 / 어린이 ${result.rentalReserveKid} 입니다.</p>`;
                str += `<p>렌탈대여 시작일 : ${result.rentalReserveStart}</p>`;
            }
            div.innerHTML = str;
        });
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

