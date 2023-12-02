

function showRowData(button) {
    let div = document.getElementById('transactionInfo');
    let refundDiv = document.getElementById('refundInfo');
    let row = button.closest('tr');
    let tds = row.querySelectorAll('td');

    let rowData = [];

    tds.forEach(function (td) {
        rowData.push(td.innerText);
    });

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

    document.getElementById('refundInfoBtn').addEventListener('click', () => {
        

        let textareaValue = document.getElementById('optionsRadios4').checked ? document.getElementById('refundText').value : '';
    })
}

async function detailToRefund() {
    
};


