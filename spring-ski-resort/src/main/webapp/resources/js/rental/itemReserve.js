document.getElementById('localStorageTest').addEventListener('click', () => {
    console.log('ddd');

    document.getElementById('rentalItemNum').value = "";
    document.getElementById('showItemName').value = "";
    document.getElementById('showAdultFee').value = "";
    document.getElementById('showKidFee').value = "";

    for (let i = 0; i < localStorage.length; i++) {
        let item = JSON.parse(localStorage.getItem(`${i}`));
        console.log(item);
        document.getElementById('rentalItemNum').value = item.rentalItemNum;
        document.getElementById('showItemName').value = item.rentalItemName;
        document.getElementById('showAdultFee').value = item.rentalItemPrice;
        document.getElementById('showKidFee').value = item.rentalItemPrice;


    }

})



document.getElementById("nextBtn").addEventListener('click', () => {
    let rentalReserveStart = document.getElementById('rentalReserveStart').value;

    if (rentalReserveStart == "") {
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

