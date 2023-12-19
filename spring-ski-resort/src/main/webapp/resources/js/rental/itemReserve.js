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



// // 달력
// $(function () {
//     let dateRangePicker = document.getElementById('dateRangePicker');

//     if (dateRangePicker) {
//         let options = {
//             singleDatePicker: true,
//             showDropdowns: false,
//             locale: {
//                 format: 'YYYY-MM-DD',
//                 applyLabel: '적용',
//                 cancelLabel: '취소',
//             },
//             minDate: moment(),
//             startDate: moment(),
//             autoUpdateInput: false,
//         };

//         // 한국어 locale 설정
//         moment.locale('ko');

//         // DateRangePicker를 호출하여 달력 표시
//         $(dateRangePicker).daterangepicker(options, function (start) {
//             let selectedDate = start.format('YYYY-MM-DD');
//             let selectedDayOfWeek = moment(selectedDate).format('dddd');

//             // 선택한 날짜로 "rentalReserveStart" 입력 필드 업데이트
//             document.getElementById('rentalReserveStart').value = selectedDate;

//             // 동적으로 요일을 표시
//             document.getElementById('dateRangePicker').value = `${selectedDate} (${selectedDayOfWeek})`;
//         });

//         // '적용' 버튼을 눌렀을 때 발생하는 이벤트
//         $(dateRangePicker).on('apply.daterangepicker', function (ev, picker) {
//             let selectedDate = picker.startDate.format('YYYY-MM-DD');
//             let selectedDayOfWeek = moment(selectedDate).format('dddd');

//             // 선택한 날짜로 "rentalReserveStart" 입력 필드 업데이트
//             document.getElementById('rentalReserveStart').value = selectedDate;

//             // 동적으로 요일을 표시
//             let displayValue = `${selectedDate} (${selectedDayOfWeek})`;
//             console.log(displayValue);  // 디버깅용: 출력된 값 확인
//             document.getElementById('dateRangePicker').value = displayValue;

//             // 여기에 '적용' 버튼을 클릭했을 때의 추가 동작을 넣으세요.

//         });
//     }
// });


//달력
function updateCustomText(dateRange, resultId) {
    var startDate = moment(dateRange.split(' ~ ')[0]);
    var endDate = moment(dateRange.split(' ~ ')[1]);
    if (getDayOfWeek(startDate) == "Invalid date") {

    } else {

        var customText = dateRange + " (" + getDayOfWeek(startDate) + " ~ " + getDayOfWeek(endDate) + ")";
        $('#' + resultId).attr('placeholder', customText);
    }
}

function getDayOfWeek(date) {
    // moment.js를 사용하여 요일 문자열 가져오기
    return date.format('dddd');
}

function toggleApplyButton(selector, isEnabled) {

    const applyButton = $(selector).find('.daterangepicker .applyBtn');
    if (isEnabled) {
        applyButton.removeAttr('disabled');
    } else {
        applyButton.attr('disabled', 'disabled');
    }
}

$(function () {
    // 한국어 locale 사용
    moment.locale('ko');

    // 첫 번째 DateRangePicker
    $('#dateRangePicker').daterangepicker({
        "maxSpan": {
            "days": 10
        },
        minDate: moment(),
        startDate: moment().startOf('hour'),
        endDate: moment().startOf('hour').add(32, 'hour'),
        opens: 'center',
        autoUpdateInput: false,
        isInvalidDate: function () {

            if (this.endDate != null) {
                if (this.startDate.format('YYYY-MM-DD') == this.endDate.format('YYYY-MM-DD')) {
                    console.log(dd);
                }
            }
            return false;
        },
        locale: {
            format: 'YYYY-MM-DD',
            applyLabel: '적용',
            cancelLabel: '취소',
            fromLabel: '시작일',
            toLabel: '종료일',
            customRangeLabel: '사용자 정의 범위'
        }

    }, function (start, end, label) {

        StayDate = moment(end.format('YYYY-MM-DD')).diff(moment(start.format('YYYY-MM-DD')), 'days');
        var dateRange = start.format('YYYY-MM-DD') + ' ~ ' + end.format('YYYY-MM-DD');
        updateCustomText(dateRange, 'dateRangePicker');
        updatehotelReserveStay(start.format('YYYY-MM-DD'), end.format('YYYY-MM-DD'));

    });
    toggleApplyButton('#dateRangePicker', false);
    // 초기화면에도 적용하기 위해 한 번 호출
    var initialDateRange = $('#dateRangePicker').val();
    updateCustomText(initialDateRange, 'result1');

    // 두 번째 DateRangePicker
    $('#secondDateRangePicker').daterangepicker({
        minDate: moment(),
        startDate: moment().startOf('hour'),
        endDate: moment().startOf('hour').add(32, 'hour'),
        opens: 'left',
        autoUpdateInput: false,
        locale: {
            format: 'YYYY-MM-DD',
            applyLabel: '적용',
            cancelLabel: '취소',
            fromLabel: '시작일',
            toLabel: '종료일',
            customRangeLabel: '사용자 정의 범위'
        }
    });

});