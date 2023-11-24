document.getElementById("nextBtn").addEventListener('click', () => {
    let rentalLiftStart = document.getElementById('rentalLiftStart').value;
    let adultPeople = document.getElementById('adultPeople').value;
    let kidPeople = document.getElementById('kidPeople').value;
    if (adultPeople == "0" && kidPeople == "0") {
        alert('인원수를 입력해주세요!');
    } else if (rentalLiftStart == "") {
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
                document.getElementById('rentalLiftStart').value = start.format('YYYY-MM-DD');
            });
            $(this).data('daterangepicker').show();
        });
    }

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
            updateFees();
        });

        adultIncrementBtn.addEventListener('click', function () {
            updatePeopleCount(adultPeopleInput, 1);
            updateFees();
        });

        kidDecrementBtn.addEventListener('click', function () {
            updatePeopleCount(kidPeopleInput, -1);
            updateFees();
        });

        kidIncrementBtn.addEventListener('click', function () {
            updatePeopleCount(kidPeopleInput, 1);
            updateFees();
        });
    }

    let morning = document.getElementById('morningTicket');
    let afternoon = document.getElementById('afternoonTicket');
    let dayTime = document.getElementById('dayTimeTicket');
    let nightTime = document.getElementById('nightTimeTicket');
    let allDay = document.getElementById('allDayTicket');
    let season = document.getElementById('seasonTicket');

    let rentalLiftAdultFeeInput = document.querySelector('input[name="rentalLiftAdultFee"]');
    let rentalLiftKidFeeInput = document.querySelector('input[name="rentalLiftKidFee"]');

    function updateFees() {
        // 오전권
        if (morning.checked && parseInt(adultPeopleInput.value) == 1) {
            rentalLiftAdultFeeInput.value = '40000';
        } else if (morning.checked && parseInt(adultPeopleInput.value) >= 2) {
            rentalLiftAdultFeeInput.value = parseInt(40000 * adultPeopleInput.value);
        }
        if (morning.checked && parseInt(kidPeopleInput.value) == 1) {
            rentalLiftKidFeeInput.value = '30000';
        } else if (morning.checked && parseInt(kidPeopleInput.value) >= 2) {
            rentalLiftKidFeeInput.value = parseInt(30000 * kidPeopleInput.value);
        }

        // 오후권
        if (afternoon.checked && parseInt(adultPeopleInput.value) == 1) {
            rentalLiftAdultFeeInput.value = '50000';
        } else if (afternoon.checked && parseInt(adultPeopleInput.value) >= 2) {
            rentalLiftAdultFeeInput.value = parseInt(50000 * adultPeopleInput.value);
        }
        if (afternoon.checked && parseInt(kidPeopleInput.value) == 1) {
            rentalLiftKidFeeInput.value = '40000';
        } else if (afternoon.checked && parseInt(kidPeopleInput.value) >= 2) {
            rentalLiftKidFeeInput.value = parseInt(40000 * kidPeopleInput.value);
        }

        // 주간권
        if (dayTime.checked && parseInt(adultPeopleInput.value) == 1) {
            rentalLiftAdultFeeInput.value = '60000';
        } else if (dayTime.checked && parseInt(adultPeopleInput.value) >= 2) {
            rentalLiftAdultFeeInput.value = parseInt(60000 * adultPeopleInput.value);
        }
        if (dayTime.checked && parseInt(kidPeopleInput.value) == 1) {
            rentalLiftKidFeeInput.value = '50000';
        } else if (dayTime.checked && parseInt(kidPeopleInput.value) >= 2) {
            rentalLiftKidFeeInput.value = parseInt(50000 * kidPeopleInput.value);
        }

        // 야간권
        if (nightTime.checked && parseInt(adultPeopleInput.value) == 1) {
            rentalLiftAdultFeeInput.value = '40000';
        } else if (nightTime.checked && parseInt(adultPeopleInput.value) >= 2) {
            rentalLiftAdultFeeInput.value = parseInt(40000 * adultPeopleInput.value);
        }
        if (nightTime.checked && parseInt(kidPeopleInput.value) == 1) {
            rentalLiftKidFeeInput.value = '30000';
        } else if (nightTime.checked && parseInt(kidPeopleInput.value) >= 2) {
            rentalLiftKidFeeInput.value = parseInt(30000 * kidPeopleInput.value);
        }

        // 종일권
        if (allDay.checked && parseInt(adultPeopleInput.value) == 1) {
            rentalLiftAdultFeeInput.value = '75000';
        } else if (allDay.checked && parseInt(adultPeopleInput.value) >= 2) {
            rentalLiftAdultFeeInput.value = parseInt(75000 * adultPeopleInput.value);
        }
        if (allDay.checked && parseInt(kidPeopleInput.value) == 1) {
            rentalLiftKidFeeInput.value = '65000';
        } else if (allDay.checked && parseInt(kidPeopleInput.value) >= 2) {
            rentalLiftKidFeeInput.value = parseInt(65000 * kidPeopleInput.value);
        }

        // 시즌권
        if (season.checked && parseInt(adultPeopleInput.value) == 1) {
            rentalLiftAdultFeeInput.value = '380000';
        } else if (season.checked && parseInt(adultPeopleInput.value) >= 2) {
            rentalLiftAdultFeeInput.value = parseInt(380000 * adultPeopleInput.value);
        }
        if (season.checked && parseInt(kidPeopleInput.value) == 1) {
            rentalLiftKidFeeInput.value = '350000';
        } else if (season.checked && parseInt(kidPeopleInput.value) >= 2) {
            rentalLiftKidFeeInput.value = parseInt(350000 * kidPeopleInput.value);
        }

    }



    morning.addEventListener('change', function () {
        updateFees();
    })
    afternoon.addEventListener('change', function () {
        updateFees();
    })
    dayTime.addEventListener('change', function () {
        updateFees();
    })
    nightTime.addEventListener('change', function () {
        updateFees();
    })
    allDay.addEventListener('change', function () {
        updateFees();
    })
    season.addEventListener('change', function () {
        updateFees();
    })
});


document.addEventListener('DOMContentLoaded', function () {
    let dateRangePicker = document.getElementById('dateRangePicker');
    let rentalLiftStart = document.getElementById('rentalLiftStart');

    if (dateRangePicker && rentalLiftStart) {
        dateRangePicker.addEventListener('input', function () {
            rentalLiftStart.value = this.value;
        });

        dateRangePicker.addEventListener('cancel.daterangepicker', function () {
            rentalLiftStart.value = '';
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