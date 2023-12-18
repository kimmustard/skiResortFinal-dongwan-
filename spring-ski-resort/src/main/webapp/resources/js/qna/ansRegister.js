
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
            str += `<p>주문번호 : ${result.payMerchantUid}</p>`;
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
                str += `<p>숙박 시작일 : ${result.hotelReserveStayEnd}</p> <p>숙박 종료일 : ${result.hotelReserveStayStart}</p>`;
            }else if (result.payNameType == '리프트') {
                str += `<p>인원수 : 성인 ${result.rentalLiftAdult} 명 / 어린이 ${result.rentalLiftKid} 입니다.</p>`;
                str += `<p>리프트권 시작일 : ${result.rentalLiftStart}</p>`;
            }else {
                str += `<p>인원수 : 성인 ${result.rentalReserveAdult} 명 / 어린이 ${result.rentalReserveKid} 입니다.</p>`;
                str += `<p>렌탈대여 시작일 : ${result.rentalReserveStart}</p>`;
            }

            str += `<button class="admin-refund-check" id="admin-refund-check" data-bs-toggle="modal" data-bs-target="#staticBackdrop">환불승인</button>`;

            div.innerHTML = str;
            
            if (document.getElementById('admin-refund-check')) {
                document.getElementById('admin-refund-check').addEventListener('click', () => {
                    showRowData(result);
                })
            }
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



// 중복 호출 방지 플래그
let isSubmitting = false;

function showRowData(result) {
    console.log('모달창 데이터', result);

    let rowData = [];


    let div = document.getElementById('transactionInfo');
    let refundDiv = document.getElementById('refundInfo');

   
    div.innerHTML = '';
    let str = `<h3 style="font-weight:bold">결제정보</h3>`;
    str += `<p>주문번호 : ${result.payMerchantUid}</p>`;
    str += `<p>결제은행 : ${result.payPg}</p>`;
    str += `<p>주문명 : ${result.payName}</p>`;
    str += `<p>금액 : ${result.payAmount}</p>`;
    str += `<p>이름 : ${result.memberName}</p>`;
    str += `<p>연락처 : ${result.memberPhoneNum}</p>`;
    str += `<p>결제일자 : ${result.payRegAt}</p>`;
    div.innerHTML = str;


    refundDiv.innerHTML = '';
    let str2 = `<div class="refund-title">`;
    str2 += `<p>환불사유를 작성해주세요.</p>`;
    str2 += `</div>`;
    str2 += `<div class="form-check">`;
    str2 += `<input class="form-check-input" type="radio" name="optionsRadios" id="optionsRadios1" value="개인사정" checked="">`;
    str2 += `<label class="form-check-label" for="optionsRadios1">개인사정</label>`;
    str2 += `</div>`;
    str2 += `<div class="form-check">`;
    str2 += `<input class="form-check-input" type="radio" name="optionsRadios" id="optionsRadios2" value="업체태도 불량">`;
    str2 += `<label class="form-check-label" for="optionsRadios2">업체태도 불량</label>`;
    str2 += `</div>`;
    str2 += `<div class="form-check">`;
    str2 += `<input class="form-check-input" type="radio" name="optionsRadios" id="optionsRadios4" value="">`;
    str2 += `<label class="form-check-label" for="optionsRadios4">기타사유</label>`;
    str2 += `</div>`;
    str2 += `<textarea id="refundText" placeholder="기타사유 선택시 작성해주세요."></textarea>`;
    refundDiv.innerHTML = str2;

    /*환불에 필요한 정보를 서버에 넘기는 코드 시작*/
    document.getElementById('refundInfoBtn').addEventListener('click', () => {

        // 중복 호출 방지
        if (isSubmitting) {
            return;
        }

        // 중복 호출 방지 플래그 설정
        isSubmitting = true;

        // 라디오 버튼 요소들을 가져옴
        let radioButtons = document.getElementsByName('optionsRadios');

        // 선택된 라디오 버튼의 값을 찾음
        let selectedValue;
        for (let i = 0; i < radioButtons.length; i++) {
            if (radioButtons[i].checked) {
                selectedValue = radioButtons[i].value;
                break;
            }
        }
        // 기타 사유 체크 시
        if (selectedValue === '' && document.getElementById('optionsRadios4').checked) {
            selectedValue = document.getElementById('refundText').value;
        }

        /*결제 정보 + 환불 사유 넘기는 객체 생성*/
        let refundInfo = {
            refundImpUid: "refund_no_" + new Date().getTime(),
            payMerchantUid: `${result.payMerchantUid}`,
            payImpUid: `${result.payImpUid}`,
            refundReason: selectedValue,
            refundName: `${result.payName}`,
            refundAmount: parseInt(`${result.payAmount}`.replace(/\D/g, ''), 10),
            refundType: '관리자',
            refundNameType: `${result.payNameType}`,
        };
        console.log(refundInfo);

        detailToRefund(refundInfo);


    })
}

//서버로 환불정보를 보냅니다.
async function detailToRefund(refundInfo) {
    try {
        const response = await fetch('/pay/refund', {
            method: 'post',
            headers: {
                "Content-Type": "application/json; charset=UTF-8",
            },
            body: JSON.stringify(refundInfo)
        });

        if (response.ok) {
            // 성공적인 응답 처리
            console.log("response 성공", response);

            // 서버에서 반환된 데이터 활용
            const data = await response.text();
            alert(data);

            console.log(data);

            // 환불 요청이 성공했으면 모달 창을 닫고 리다이렉트 수행
            closeModalAndRedirect();
        } else {
            // 실패한 경우
            const errorMessage = await response.text();
            throw new Error(errorMessage);
        }
    } catch (error) {
        console.log(error.message);
        alert(error.message);
    } finally {
        // 중복 호출 방지 플래그 해제
        isSubmitting = false;
    }
}

function closeModalAndRedirect() {
    // 순수 JavaScript를 사용하여 모달 창 닫기
    var modal = document.getElementById('staticBackdrop');
    var modalInstance = bootstrap.Modal.getInstance(modal);
    if (modalInstance) {
        modalInstance.hide();
    }

    // 리다이렉션을 수행하고 페이지를 이동
    window.location.reload();
}