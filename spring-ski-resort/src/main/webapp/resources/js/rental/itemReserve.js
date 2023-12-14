document.getElementById("people").addEventListener('click', () => {

    document.getElementById('peopleList').style.display = "block";
})

document.getElementById("nextBtn").addEventListener('click', () => {
    let rentalReserveStart = document.getElementById('rentalReserveStart').value;
    let rentalReserveAdult = document.getElementById('rentalReserveAdult').value;

    if (rentalReserveAdult == "0") {
        alert('인원수를 입력해주세요!');
    } else if (rentalReserveStart == "") {
        alert('날짜를 선택해주세요!');
    } else {
        document.getElementById("innerbox").style.display = "block";
        document.getElementById('nextBtn').style.display = 'none';
    }
})


$(function () {
    let dateRangePicker = document.getElementById('dateRangePicker');

    if (dateRangePicker) {
        let options = {
            singleDatePicker: true,
            showDropdowns: false,
            locale: {
                format: 'YYYY-MM-DD',
                applyLabel: '적용',
                cancelLabel: '취소',
            },
            minDate: moment(),
            startDate: moment(),
            autoUpdateInput: false,
        };

        // 한국어 locale 설정
        moment.locale('ko');

        // DateRangePicker를 호출하여 달력 표시
        $(dateRangePicker).daterangepicker(options, function (start) {
            let selectedDate = start.format('YYYY-MM-DD');
            let selectedDayOfWeek = moment(selectedDate).format('dddd');

            // 선택한 날짜로 "rentalReserveStart" 입력 필드 업데이트
            document.getElementById('rentalReserveStart').value = selectedDate;

            // 동적으로 요일을 표시
            document.getElementById('dateRangePicker').value = `${selectedDate} (${selectedDayOfWeek})`;
        });

        // '적용' 버튼을 눌렀을 때 발생하는 이벤트
        $(dateRangePicker).on('apply.daterangepicker', function (ev, picker) {
            let selectedDate = picker.startDate.format('YYYY-MM-DD');
            let selectedDayOfWeek = moment(selectedDate).format('dddd');

            // 선택한 날짜로 "rentalReserveStart" 입력 필드 업데이트
            document.getElementById('rentalReserveStart').value = selectedDate;

            // 동적으로 요일을 표시
            let displayValue = `${selectedDate} (${selectedDayOfWeek})`;
            console.log(displayValue);  // 디버깅용: 출력된 값 확인
            document.getElementById('dateRangePicker').value = displayValue;

            // 여기에 '적용' 버튼을 클릭했을 때의 추가 동작을 넣으세요.

        });
    }
});

//성인 버튼 조작
document.getElementById("adult+Btn").addEventListener('click', () => {
    let cnt = parseInt(document.getElementById('adult-Count').innerText);
    if (cnt < 30) {
        cnt += 1;
    }

    document.getElementById('adult-Count').innerText = cnt;
    AllPeopleCount();
})

document.getElementById("adult-Btn").addEventListener('click', () => {
    let cnt = parseInt(document.getElementById('adult-Count').innerText);
    if (cnt > 1) {
        cnt -= 1;
    }
    document.getElementById('adult-Count').innerText = cnt;
    AllPeopleCount();
})


//어린이 버튼 조작
document.getElementById("child+Btn").addEventListener('click', () => {
    let cnt = parseInt(document.getElementById('child-Count').innerText);
    if (cnt < 10) {
        cnt += 1;
    }

    document.getElementById('child-Count').innerText = cnt;
    AllPeopleCount();
    //  childAgeSelectCreater();
})

document.getElementById("child-Btn").addEventListener('click', () => {
    let cnt = parseInt(document.getElementById('child-Count').innerText);
    if (cnt > 0) {
        cnt -= 1;
    }
    document.getElementById('child-Count').innerText = cnt;
    AllPeopleCount();
    //  childAgeSelectCreater();
})

//인원수 세주는거
function AllPeopleCount() {
    $('#people').attr('placeholder', `성인 ${document.getElementById('adult-Count').innerText}명 · 아동 ${document.getElementById('child-Count').innerText}명 `);
    document.getElementById('rentalReserveAdult').value = document.getElementById('adult-Count').innerText;
    document.getElementById('rentalReserveKid').value = document.getElementById('child-Count').innerText;

}

//peoplelist 사라지는 이벤트
document.getElementById('peoplelistClose').addEventListener('click', () => {
    document.getElementById('peopleList').style.display = "none";
})
var targetArea1 = document.getElementById('peopleList');
var targetArea2 = document.getElementById('people');
document.addEventListener('click', function (event) {
    if (!targetArea1.contains(event.target) || !targetArea2.contains(event.target)) {
        document.getElementById('peopleList').style.display = "none";
    }
});
targetArea1.addEventListener('click', function (event) {
    event.stopPropagation();
});
targetArea2.addEventListener('click', function (event) {
    event.stopPropagation();
});


// 렌탈장비명, 요금 표시
function updateItemInfo(name, adultFee, kidFee) {

}