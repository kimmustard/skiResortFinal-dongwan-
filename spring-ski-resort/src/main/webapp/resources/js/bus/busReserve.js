console.log(memberEmail);

document.getElementById('busReserveBtn').addEventListener('click', () => {
     let busStartDate = document.getElementById('busStartDate').value;
     let busPeople = document.getElementById('busPeople').value;
     let busRegion = document.getElementById('busRegion').value;

     if (memberEmail === "") {
          alert('버스예약은 회원만 가능합니다.');
          location.href = '/member/login';
     } else if (busStartDate === "") {
          alert('날짜를 선택해주세요.');
     } else if (busPeople === "") {
          alert('인원수를 선택해주세요.');
     } else if (busRegion === "") {
          alert('탑승하실 지역을 선택해주세요.');
     } else if (busPeople === 5) {
          alert('버스예약은 최대 4명까지만 가능합니다.');
     }
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
               document.getElementById('busStartDate').value = selectedDate;

               // 동적으로 요일을 표시
               document.getElementById('dateRangePicker').value = `${selectedDate} (${selectedDayOfWeek})`;
          });

          // '적용' 버튼을 눌렀을 때 발생하는 이벤트
          $(dateRangePicker).on('apply.daterangepicker', function (ev, picker) {
               let selectedDate = picker.startDate.format('YYYY-MM-DD');
               let selectedDayOfWeek = moment(selectedDate).format('dddd');

               // 선택한 날짜로 "rentalReserveStart" 입력 필드 업데이트
               document.getElementById('busStartDate').value = selectedDate;

               // 동적으로 요일을 표시
               let displayValue = `${selectedDate} (${selectedDayOfWeek})`;
               console.log(displayValue);  // 디버깅용: 출력된 값 확인
               document.getElementById('dateRangePicker').value = displayValue;

               // 여기에 '적용' 버튼을 클릭했을 때의 추가 동작을 넣으세요.

          });
     }
});

document.getElementById("people").addEventListener('click', () => {

     document.getElementById('peopleList').style.display = "block";
})


//성인 버튼 조작
function addAudltCnt(int) {
     let cnt = parseInt(document.getElementById('adult-Count').innerText);
     if (cnt < 10) {
          cnt += int;
          if (cnt == 0) {
               cnt = 1;
          }
     }
     document.getElementById('adult-Count').innerText = cnt;
     AllPeopleCount();
}


/**인원수 세주는거 */
function AllPeopleCount() {
     if (document.getElementById('adult-Count').innerText != 0) {
          $('#people').attr('placeholder', `예약인원 ${document.getElementById('adult-Count').innerText}명`);
     }

     document.getElementById('busPeople').value = document.getElementById('adult-Count').innerText;
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


// 지역 선택
function updateRegion() {
     let selectRegion = document.getElementById('selectBusRegion').value;

     document.getElementById('busRegion').value = selectRegion;

     let busNum = updateBusNum(selectRegion);

     let imagePath = getImagePath(selectRegion);

     document.getElementById("regionImage").src = imagePath;

     document.getElementById('busNum').value = busNum;

     function updateBusNum(region) {
          switch (region) {
               case '강남선':
                    return 1001;
               case '광화문':
                    return 1002;
               case '분당선':
                    return 1003;
               case '수원선':
                    return 1004;
               case '잠실선':
                    return 1005;
               case '천안-평택선':
                    return 1006;
          }
     }
}

function getImagePath(region) {
     switch (region) {
          case '강남선':
               return "https://i.namu.wiki/i/KJmURamoD2t16saSVzLomUJOQ1hNjOicO06lwQIwdB5gHhgMF8uyRp9aCjkVJ9h01RLdn2Y8Q1tPykUumTiKDQ.webp";
          case '광화문':
               return "https://upload.wikimedia.org/wikipedia/commons/thumb/b/ba/2011%EB%85%84_11%EC%9B%94_%EB%8C%80%ED%95%9C%EB%AF%BC%EA%B5%AD_%EC%84%9C%EC%9A%B8%ED%8A%B9%EB%B3%84%EC%8B%9C_%EB%AA%85%EC%86%8C_%28Seoul_best_attractions%29_%EA%B4%91%ED%99%94%EB%AC%B8.JPG/1920px-2011%EB%85%84_11%EC%9B%94_%EB%8C%80%ED%95%9C%EB%AF%BC%EA%B5%AD_%EC%84%9C%EC%9A%B8%ED%8A%B9%EB%B3%84%EC%8B%9C_%EB%AA%85%EC%86%8C_%28Seoul_best_attractions%29_%EA%B4%91%ED%99%94%EB%AC%B8.JPG";
          case '분당선':
               return "https://upload.wikimedia.org/wikipedia/commons/thumb/b/ba/2011%EB%85%84_11%EC%9B%94_%EB%8C%80%ED%95%9C%EB%AF%BC%EA%B5%AD_%EC%84%9C%EC%9A%B8%ED%8A%B9%EB%B3%84%EC%8B%9C_%EB%AA%85%EC%86%8C_%28Seoul_best_attractions%29_%EA%B4%91%ED%99%94%EB%AC%B8.JPG/1920px-2011%EB%85%84_11%EC%9B%94_%EB%8C%80%ED%95%9C%EB%AF%BC%EA%B5%AD_%EC%84%9C%EC%9A%B8%ED%8A%B9%EB%B3%84%EC%8B%9C_%EB%AA%85%EC%86%8C_%28Seoul_best_attractions%29_%EA%B4%91%ED%99%94%EB%AC%B8.JPG";
          case '수원선':
               return "https://img.hani.co.kr/imgdb/resize/2013/0501/00468417301_20130501.JPG";
          case '잠실선':
               return "https://www.lottehotel.com/content/dam/lotte-hotel/global/common/company/seoul-signiel.jpg";
          case '천안-평택선':
               return "https://www.i815.or.kr/2017/images/tour/img_visu01.jpg";
     }
}