
//홈페이지 버튼눌러서 쿠폰받기
if(document.getElementById('coupon_get')){
    document.getElementById('coupon_get').addEventListener('click', () => {
        let code = document.getElementById('coupon_get').value;
        couponGetToServer(code).then(result => {
            if (result == 1) {
                alert('쿠폰 발급 완료!')
            } else if(result == 2) {
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

//내 쿠폰 목록 보기
document.getElementById('my_coupon_list').addEventListener('click', () => {
    //쿠폰 목록창 띄우는 코드 
    //리스트 가져오기
    myCouponListGet().then(result =>  {
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
        if (result.length != 0) {
            console.log('사용자 쿠폰 리스트 :' + JSON.stringify(result));
            console.log(result);
            for(let i = 0 ; i < result.length; i++){
              
                couponInt = parseInt(result[0].couponInt);
                console.log(couponInt);
            
            document.getElementById('myCouponList').innerHTML =`${result[i].couponName} <input type="radio" id="coupon" name="coupon" onclick="usecoupon(${result[0].couponInt},${result[0].couponRate})" value="${result[i].couponCode}">`
            }

        }else{

            alert("사용가능한 쿠폰이 없습니다.")
        }
       
    })
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


    
