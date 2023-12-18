function fnContains(str, substr) {
    return str.indexOf(substr) !== -1;
}

let itemSum = 0;
let itemAdultFee = 0;
let itemKidFee = 0;

document.getElementById("nextBtn").addEventListener('click', () => {
    let rentalReserveStart = document.getElementById('rentalReserveStart').value;

    if (rentalReserveStart == "") {
        alert('날짜를 선택해주세요!');
    } else {
        document.getElementById('nextBtn').style.display = 'none';
        for (let i = 0; i < localStorage.length; i++) {
            let itemArr = JSON.parse(localStorage.getItem(`${i}`));
            console.log(itemArr);
        }
    }

    //     document.getElementById('rentalItemNum').value = "";
    //     document.getElementById('showItemName').value = "";
    //     document.getElementById('showAdultFee').value = "0";
    //     document.getElementById('showKidFee').value = "0";
    //     document.getElementById('showTotalFee').value = "0";

    //     let itemNames = '';

    //     for (let i = 0; i < localStorage.length; i++) {
    //         let itemArr = JSON.parse(localStorage.getItem(`${i}`));
    //         console.log(itemArr);

    //         document.getElementById('rentalItemNum').value = itemArr[i].rentalItemNum;

    //         itemNames += itemArr[i].rentalItemName + ', ';


    //         if (fnContains(itemArr[i].rentalItemName, '주니어')) {
    //             itemKidFee += parseInt(itemArr[i].rentalItemPrice);
    //             document.getElementById('showKidFee').value = itemKidFee.toLocaleString() + "원";
    //         } else {
    //             itemAdultFee += parseInt(itemArr[i].rentalItemPrice);
    //             document.getElementById('showAdultFee').value = itemAdultFee.toLocaleString() + "원";
    //         }


    //         itemSum += parseInt(itemArr[i].rentalItemPrice);

    //     }

    //     itemNames = itemNames.slice(0, -2);

    //     document.getElementById('showItemName').value = itemNames;
    //     document.getElementById('showTotalFee').value = itemSum.toLocaleString() + "원";
    // 
})



// 달력
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

