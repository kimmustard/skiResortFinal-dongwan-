//등급별 금액연산
let grade = document.getElementById('memberGradeInput').value;
let discountRate = 0;  // 기본값은 할인율이 0%

//홈페이지 버튼눌러서 쿠폰받기

if (document.getElementById('coupon_get')) {
    document.getElementById('coupon_get').addEventListener('click', () => {
        let code = document.getElementById('coupon_get').value;
        couponGetToServer(code).then(result => {
            if (result == 1) {
                alert('쿠폰 발급 완료!')
            } else if (result == 2) {
                alert('로그인 후 이용해주세요.')
            } else {
                alert('이미 발급된 쿠폰입니다.')
            }
        })
    })
}


async function couponGetToServer(code) {
    try {
        const url = "/member/check/coupon/" + code
        const config = {
            method: 'GET'
        };
        const resp = await fetch(url, config);
        const result = await resp.text();
        return result;
    } catch (error) {
        console.log(error);
    }
}

let couponInt;

//쿠폰 목록창 띄우는 코드 
//리스트 가져오기
myCouponListGet().then(result => {
    /* 받아온 JSON을 목록창에 쿠폰 작성하기
        couponCode : 생략
        couponDay : 생략
        memberNum : 생략

        //출력 정보
        couponName : 쿠폰이름
        couponInt : 할인율 정수값
        couponRate : 할인율 퍼센트
        couponStart : 시작날짜
        couponEnd : 종료날짜

        
    */

    const myCouponList = document.getElementById('myCouponList');
    myCouponList.innerHTML = '';

    if (result.length != 0) {

        const today = new Date();

        for (let i = 0; i < result.length; i++) {

            // 날짜 포맷터
            let monthStart = parseInt(result[i].couponStart.substring(5, 7), 10); // 월
            let dayStart = parseInt(result[i].couponStart.substring(8, 10), 10);  // 일
            let monthEnd = parseInt(result[i].couponEnd.substring(5, 7), 10); // 월
            let dayEnd = parseInt(result[i].couponEnd.substring(8, 10), 10); // 일
            let formattedDateStart = monthStart + '-' + dayStart;
            let formattedDateEnd = monthEnd + '-' + dayEnd;


            let d_end_month = monthEnd; // 종료 날짜의 월(month)
            let d_end_day = dayEnd; // 종료 날짜의 일(day)
            let today_d_day = today.getDate(); // 오늘 날짜의 일(day)
            let today_d_month = today.getMonth() + 1; // 오늘 날짜의 월(month)

            // 오늘 날짜와 종료 날짜의 차이 계산
            let diffInDays = d_end_day - today_d_day;
            let diffInMonths = d_end_month - today_d_month;

            // 월이 변경된 경우, 정확한 월 단위의 차이를 계산
            if (diffInDays < 0) {
                const daysInCurrentMonth = new Date(today.getFullYear(), today_d_month, 0).getDate();
                diffInDays += daysInCurrentMonth;
                diffInMonths -= 1;
            }



            couponInt = parseInt(result[0].couponInt);
            console.log(couponInt);

            let str = `<label for="r${i}">`;
            str += `<div class="couponBox" id="cbox${i}">`;

            if (result[i].couponInt == 0) {
                str += `<div class="couponBox1"><span>${result[i].couponRate}%</span></div>`;
            } else {
                str += `<div class="couponBox1"><span>${result[i].couponInt}원</span></div>`;
            }
            str += `<div class="endDays">D-${diffInDays}</div>`;
            str += `<div class="couponBox2">`;
            str += `<div><p>${formattedDateStart} ~ ${formattedDateEnd}</p>`;
            str += `<span>${result[i].couponName}</span></div>`;
            str += `<input id="r${i}" type="radio" name="coupon" value="${result[i].couponCode}" style="display:none">`;
            str += `</div>`;

            str += `</div>`;
            str += `</label>`;
            myCouponList.innerHTML += str;
        }

        // 라디오 버튼 로직
        document.addEventListener('click', (e) => {
            if (e.target.type !== 'radio' || e.target.name !== 'coupon') {
                return;
            }

            const index = e.target.id.slice(1);
            const couponBox = document.getElementById(`cbox${index}`);

            if (e.target.checked) {
                // 같은 라디오 버튼을 다시 클릭하면 체크를 해제하도록 변경
                if (couponBox.style.border === '3px solid red') {
                    e.target.checked = false;
                    couponBox.style.border = '';
                    // 라디오 버튼이 체크가 해제되면 원래 가격으로 설정
                    usecoupon(discountRate, 0, 0); //실제값 원래대로 돌림
                } else {
                    // 체크된 라디오 박스가 있다면, 모든 라디오 박스의 스타일을 원래대로 되돌린 후, 선택된 라디오 박스에 대해서만 스타일을 변경
                    const radioButtons = document.querySelectorAll('[name="coupon"]');
                    radioButtons.forEach((radio, i) => {
                        const otherCouponBox = document.getElementById(`cbox${i}`);
                        otherCouponBox.style.border = '';
                        radio.checked = false; // 체크된 상태를 해제
                    });

                    couponBox.style.border = '3px solid red'; // 여기에 굵게 하고 싶은 border 스타일을 적용

                    // 할인율 계산
                    usecoupon(discountRate, result[index].couponInt, result[index].couponRate);
                    // 클릭된 라디오 버튼의 값을 couponCode에 설정
                    document.getElementById('couponCode').value = result[index].couponCode;
                }
            }
        });
    } else {
        
    }
})





async function myCouponListGet() {
    try {
        const url = "/member/check/couponList"
        const config = {
            method: 'GET'
        };
        const resp = await fetch(url, config);
        const result = await resp.json();
        return result;
    } catch (error) {
        console.log(error);
    }
}

/** 할인적용 이벤트
 * 
 *  
 */
function usecoupon(discountRate, couponInt, couponrate) {

    if (grade == 'Silver') {
        discountRate = 3;
    } else if (grade == 'Gold') {
        discountRate = 5;
    } else if (grade == 'Manager') {
        discountRate = 7;
    } else if (grade == 'VIP') {
        discountRate = 10;
    } else {
        discountRate = 0;
    }

    //등급과 할인율 표시
    document.getElementById('userGradeRate').innerHTML = `<span style="font-weight:bold;">${grade}</span><span style="font-weight:bold;">(${discountRate}%)</span>`;

    let productPrice = parseFloat(document.getElementById("productPrice").value);
    console.log(productPrice);

    // 할인율 계산 (원금*discountRate/100)
    let discountAmount = productPrice * (discountRate / 100);

    // 나머지 할인 및 쿠폰 적용
    let totalprice = productPrice - discountAmount - couponInt - (productPrice * (couponrate / 100));
    console.log(productPrice, totalprice);

    document.getElementById('realpayvalue').value = totalprice;
    document.getElementById('userViewpay').innerHTML = `${totalprice.toLocaleString()}원 <del>${productPrice.toLocaleString()}</del>원`;
    realAmount = totalprice;
}

