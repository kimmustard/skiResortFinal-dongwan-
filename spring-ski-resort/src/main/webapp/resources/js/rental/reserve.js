document.getElementById("payBtn").addEventListener('click', () => {
    let rentalReserveStart = document.getElementById('rentalReserveStart').value;
    let adultPeople = document.getElementById('adultPeople').value;
    let kidPeople = document.getElementById('kidPeople').value;
    if (adultPeople == "0" && kidPeople == "0") {
        alert('인원수를 입력해주세요!');
    } else if (rentalReserveStart == "") {
        alert('날짜를 선택해주세요!');
    } else {
        document.getElementById("innerbox").style.display = "block";
        document.getElementById('adultDecrementBtn').style.display = "none";
        document.getElementById('adultIncrementBtn').style.display = "none";
        document.getElementById('kidDecrementBtn').style.display = "none";
        document.getElementById('kidIncrementBtn').style.display = "none";
    }
})

document.addEventListener('DOMContentLoaded', function () {
    // DateRangePicker 초기화
    let dateRangePicker = document.getElementById('dateRangePicker');

    if (dateRangePicker) {
        // DateRangePicker 이벤트 처리
        dateRangePicker.addEventListener('click', function () {
            // DateRangePicker를 호출하여 달력 표시
            let options = {
                singleDatePicker: true, // 하나의 날짜만 선택
                showDropdowns: false, // 년도 및 월 선택 활성화
                locale: {
                    format: 'YYYY-MM-DD', // 날짜 형식 설정
                    applyLabel: '적용',
                    cancelLabel: '취소',
                },
                minDate: moment(),
            };

            // 달력 표시
            $(this).daterangepicker(options, function (start, end, label) {
                // 선택한 날짜로 "rentalReserveStart" 입력 필드 업데이트
                document.getElementById('rentalReserveStart').value = start.format('YYYY-MM-DD');
            });
            $(this).data('daterangepicker').show();
        });
    }
});


document.addEventListener('DOMContentLoaded', function () {
    let dateRangePicker = document.getElementById('dateRangePicker');
    let rentalReserveStart = document.getElementById('rentalReserveStart');

    if (dateRangePicker && rentalReserveStart) {
        dateRangePicker.addEventListener('input', function () {
            rentalReserveStart.value = this.value;
        });

        dateRangePicker.addEventListener('cancel.daterangepicker', function () {
            rentalReserveStart.value = '';
        });
    }
});

document.addEventListener("DOMContentLoaded", function () {
    let peopleInput = document.getElementById('people');
    let peopleDiv = document.getElementById('peopleList');

    if (peopleInput && peopleDiv) {
        peopleInput.addEventListener('click', function () {
            // 숨겨진 div의 표시 여부
            if (peopleDiv.style.display === 'none') {
                peopleDiv.style.display = 'block';
            } else {
                peopleDiv.style.display = 'none';
            }
        });
    }

    let adultDecrementBtn = document.getElementById('adultDecrementBtn');
    let adultIncrementBtn = document.getElementById('adultIncrementBtn');
    let adultPeopleInput = document.getElementById('adultPeople');

    let kidDecrementBtn = document.getElementById('kidDecrementBtn');
    let kidIncrementBtn = document.getElementById('kidIncrementBtn');
    let kidPeopleInput = document.getElementById('kidPeople');

    if (adultDecrementBtn && adultIncrementBtn && adultPeopleInput &&
        kidDecrementBtn && kidIncrementBtn && kidPeopleInput) {

        adultDecrementBtn.addEventListener('click', function () {
            updatePeopleCount(adultPeopleInput, -1);
        });

        adultIncrementBtn.addEventListener('click', function () {
            updatePeopleCount(adultPeopleInput, 1);
        });

        kidDecrementBtn.addEventListener('click', function () {
            updatePeopleCount(kidPeopleInput, -1);
        });

        kidIncrementBtn.addEventListener('click', function () {
            updatePeopleCount(kidPeopleInput, 1);
        });
    }
});

function updatePeopleCount(inputElement, increment) {
    let currentCount = parseInt(inputElement.value, 10);
    let newCount = currentCount + increment;

    // 최소값은 1로 설정
    newCount = Math.max(newCount, 1);

    inputElement.value = newCount;
}