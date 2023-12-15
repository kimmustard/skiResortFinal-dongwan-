
// 중복 호출 방지 플래그
let isSubmitting = false;

function showRowData(button) {
    let div = document.getElementById('transactionInfo');
    let refundDiv = document.getElementById('refundInfo');
    let row = button.closest('tr');
    let tds = row.querySelectorAll('td');
    let rowData = [];

    tds.forEach(function (td) {
        rowData.push(td.innerText);
    });
    console.log('알려줘', rowData);
    div.innerHTML = '';
    let str = `<span style="font-weight:bold">결제정보</span> <br><br>`;
    str += `<span>주문번호 : ${rowData[0]}</span> <br>`;
    str += `<span>결제은행 : ${rowData[1]}</span> <br>`;
    str += `<span>주문명 : ${rowData[2]}</span> <br>`;
    str += `<span>금액 : ${rowData[3]}</span> <br>`;
    str += `<span>이름 : ${rowData[4]}</span> <br>`;
    str += `<span>연락처 : ${rowData[5]}</span> <br>`;
    str += `<span>결제일자 : ${rowData[7]}</span> <br>`;
    div.innerHTML = str;


    refundDiv.innerHTML = '';
    let str2 = `<div class="refund-title">`;
    str2 += `<span>환불사유를 작성해주세요.</span>`;
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
            payMerchantUid: rowData[0],
            payImpUid: row.querySelector('td input[type="hidden"]').value,
            refundReason: selectedValue,
            refundName: rowData[2],
            refundAmount: parseInt(rowData[3].replace(/\D/g, ''), 10),
            refundType: '구매자',
            refundNameType: rowData[8],
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
    window.location.href = '/pay/memberPayList';
}


function receiptRowData(button) {
    let receiptMemberDiv = document.getElementById('receiptMember');
    let receiptInfoDiv = document.getElementById('receiptInfo');
    let row = button.closest('tr');
    let tds = row.querySelectorAll('td');
    let rowData = [];

    receiptMemberDiv.innerHTML = '';

    receiptInfoDiv.innerHTML = '';


    tds.forEach(function (td) {
        rowData.push(td.innerText);
    });
    
    detailToReceipt(rowData[0]).then(result => {
        
    })


}

async function detailToReceipt(payMerchantUid){
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