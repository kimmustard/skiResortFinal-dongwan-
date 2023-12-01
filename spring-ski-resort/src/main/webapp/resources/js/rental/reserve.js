document.getElementById("nextBtn").addEventListener('click', () => {
    let rentalLiftStart = document.getElementById('rentalLiftStart').value;
    let rentalLiftAdult = document.getElementById('rentalLiftAdult').value;
    let rentalLiftKid = document.getElementById('rentalLiftKid').value;
    if (rentalLiftAdult == "0") {
        alert('인원수를 입력해주세요!');
    } else if (rentalLiftStart == "") {
        alert('날짜를 선택해주세요!');
    } else {
        document.getElementById("innerbox").style.display = "block";
        document.getElementById('nextBtn').style.display = 'none';
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
            $(this).daterangepicker(options, function (start) {
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
        if (morning.checked && parseInt(rentalLiftAdult.value) == 1) {
            rentalLiftAdultFeeInput.value = '40000';
        } else if (morning.checked && parseInt(rentalLiftAdult.value) >= 2) {
            rentalLiftAdultFeeInput.value = parseInt(40000 * rentalLiftAdult.value);
        }
        if (morning.checked && parseInt(rentalLiftKid.value) == 1) {
            rentalLiftKidFeeInput.value = '30000';
        } else if (morning.checked && parseInt(rentalLiftKid.value) >= 2) {
            rentalLiftKidFeeInput.value = parseInt(30000 * rentalLiftKid.value);
        }

        // 오후권
        if (afternoon.checked && parseInt(rentalLiftAdult.value) == 1) {
            rentalLiftAdultFeeInput.value = '50000';
        } else if (afternoon.checked && parseInt(rentalLiftAdult.value) >= 2) {
            rentalLiftAdultFeeInput.value = parseInt(50000 * rentalLiftAdult.value);
        }
        if (afternoon.checked && parseInt(rentalLiftKid.value) == 1) {
            rentalLiftKidFeeInput.value = '40000';
        } else if (afternoon.checked && parseInt(rentalLiftKid.value) >= 2) {
            rentalLiftKidFeeInput.value = parseInt(40000 * rentalLiftKid.value);
        }

        // 주간권
        if (dayTime.checked && parseInt(rentalLiftAdult.value) == 1) {
            rentalLiftAdultFeeInput.value = '60000';
        } else if (dayTime.checked && parseInt(rentalLiftAdult.value) >= 2) {
            rentalLiftAdultFeeInput.value = parseInt(60000 * rentalLiftAdult.value);
        }
        if (dayTime.checked && parseInt(rentalLiftKid.value) == 1) {
            rentalLiftKidFeeInput.value = '50000';
        } else if (dayTime.checked && parseInt(rentalLiftKid.value) >= 2) {
            rentalLiftKidFeeInput.value = parseInt(50000 * rentalLiftKid.value);
        }

        // 야간권
        if (nightTime.checked && parseInt(rentalLiftAdult.value) == 1) {
            rentalLiftAdultFeeInput.value = '40000';
        } else if (nightTime.checked && parseInt(rentalLiftAdult.value) >= 2) {
            rentalLiftAdultFeeInput.value = parseInt(40000 * rentalLiftAdult.value);
        }
        if (nightTime.checked && parseInt(rentalLiftKid.value) == 1) {
            rentalLiftKidFeeInput.value = '30000';
        } else if (nightTime.checked && parseInt(rentalLiftKid.value) >= 2) {
            rentalLiftKidFeeInput.value = parseInt(30000 * rentalLiftKid.value);
        }

        // 종일권
        if (allDay.checked && parseInt(rentalLiftAdult.value) == 1) {
            rentalLiftAdultFeeInput.value = '75000';
        } else if (allDay.checked && parseInt(rentalLiftAdult.value) >= 2) {
            rentalLiftAdultFeeInput.value = parseInt(75000 * rentalLiftAdult.value);
        }
        if (allDay.checked && parseInt(rentalLiftKid.value) == 1) {
            rentalLiftKidFeeInput.value = '65000';
        } else if (allDay.checked && parseInt(rentalLiftKid.value) >= 2) {
            rentalLiftKidFeeInput.value = parseInt(65000 * rentalLiftKid.value);
        }

        // 시즌권
        if (season.checked && parseInt(rentalLiftAdult.value) == 1) {
            rentalLiftAdultFeeInput.value = '380000';
        } else if (season.checked && parseInt(rentalLiftAdult.value) >= 2) {
            rentalLiftAdultFeeInput.value = parseInt(380000 * rentalLiftAdult.value);
        }
        if (season.checked && parseInt(rentalLiftKid.value) == 1) {
            rentalLiftKidFeeInput.value = '350000';
        } else if (season.checked && parseInt(rentalLiftKid.value) >= 2) {
            rentalLiftKidFeeInput.value = parseInt(350000 * rentalLiftKid.value);
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

function updatePeopleCount(inputElement, increment) {
    let currentCount = parseInt(inputElement.value, 10);
    let newCount = currentCount + increment;

    // 최소값은 1로 설정
    newCount = Math.max(newCount, 1);

    inputElement.value = newCount;
}

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
    $('#people').attr('placeholder', `성인 : ${document.getElementById('adult-Count').innerText}명 · 아동 ${document.getElementById('child-Count').innerText}명 `);
    document.getElementById('rentalLiftAdult').value = document.getElementById('adult-Count').innerText;
    document.getElementById('rentalLiftKid').value = document.getElementById('child-Count').innerText;

}

//peoplelist 사라지는 이벤트
document.getElementById('peoplelistClose').addEventListener('click', () => {
    document.getElementById('peopleList').style.display = "none";
})
var targetArea1 = document.getElementById('peopleList');
var targetArea2 = document.getElementById('people');
document.addEventListener('click', function (event) {
    if (!targetArea1.contains(event.target) || !targetArea2.contains(event.target)) {
        console.log("tq");
        document.getElementById('peopleList').style.display = "none";
    }
});
targetArea1.addEventListener('click', function (event) {
    event.stopPropagation();
});
targetArea2.addEventListener('click', function (event) {
    event.stopPropagation();
});