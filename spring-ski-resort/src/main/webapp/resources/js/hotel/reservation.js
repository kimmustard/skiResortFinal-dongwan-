document.getElementById("payBtn").addEventListener('click',()=>{
   
        document.getElementById("innerbox").style.display="block";
   
   
})
document.getElementById("closeBtn").addEventListener('click',()=>{
	
    	 document.getElementById("innerbox").style.display="none";
   
})
 
 	function updateCustomText(dateRange, resultId) {
  	  var startDate = moment(dateRange.split(' ~ ')[0]);
   	 var endDate = moment(dateRange.split(' ~ ')[1]);
     if( getDayOfWeek(startDate)=="Invalid date"){

     }else{
   	 var customText = "예약 날짜 : " + dateRange + " (" + getDayOfWeek(startDate) + " ~ " + getDayOfWeek(endDate) + ")";
          $('#' + resultId).attr('placeholder',customText);
     }
}

function getDayOfWeek(date) {
    // moment.js를 사용하여 요일 문자열 가져오기
    return date.format('dddd');
}

	function toggleApplyButton(selector, isEnabled) {
    const applyButton = $(selector).closest('.daterangepicker').find('.applyBtn');
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
            locale: {
                format: 'YYYY-MM-DD',
                applyLabel: '적용',
                cancelLabel: '취소',
                fromLabel: '시작일',
                toLabel: '종료일',
                customRangeLabel: '사용자 정의 범위'
            }
        }, function (start, end, label) {
            var dateRange = start.format('YYYY-MM-DD') + ' ~ ' + end.format('YYYY-MM-DD');
          if(start.format('YYYY-MM-DD')==end.format('YYYY-MM-DD')){
              toggleApplyButton('#dateRangePicker', false);
            }
            updateCustomText(dateRange, 'dateRangePicker');
          
        });
        
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
        } );

    });
    
    //성인 버튼 조작
    document.getElementById("adult+Btn").addEventListener('click',()=>{
       let cnt =  parseInt(document.getElementById('audlt-Count').innerText); 
       if(cnt<30){
        cnt += 1;
     }
   
       document.getElementById('audlt-Count').innerText =cnt;
       AllPeopleCount();
     })
     
      document.getElementById("adult-Btn").addEventListener('click',()=>{
       let cnt =  parseInt(document.getElementById('audlt-Count').innerText); 
      if(cnt>1){
       cnt -= 1;
    }
    document.getElementById('audlt-Count').innerText =cnt;
    AllPeopleCount();
     })
    
    
    //어린이 버튼 조작
    document.getElementById("child+Btn").addEventListener('click',()=>{
       let cnt =  parseInt(document.getElementById('child-Count').innerText); 
       if(cnt<10){
        cnt += 1;
     }
      
       document.getElementById('child-Count').innerText =cnt;
       AllPeopleCount();
       childAgeSelectCreater();
     })
     
      document.getElementById("child-Btn").addEventListener('click',()=>{
       let cnt =  parseInt(document.getElementById('child-Count').innerText); 
      if(cnt>0){
       cnt -= 1;
    }
        document.getElementById('child-Count').innerText =cnt;
     AllPeopleCount();
     childAgeSelectCreater();
     })
    
    function AllPeopleCount(){
        $('#people').attr('placeholder',`성인 : ${document.getElementById('audlt-Count').innerText}명 · 아동 ${document.getElementById('child-Count').innerText}명 ` );
    }
    function childAgeSelectCreater(){
       
        let select ="";
        for(let i = 1; i<=parseInt(document.getElementById('child-Count').innerText); i++){
            
            select+= `<select class="child-age-selecr">`;
            select+=`<option value="">나이(필수 입력)</option>`;
            for(let  i =0 ; i <17; i++){
                select+= `<option value="${i}">${i}</option>`;
            
        }
        select += `</select>`;   
         }
         console.log(select);
         document.getElementById('chile-age').innerHTML = select;
     
    }
document.getElementById('people').addEventListener('click',()=>{
    document.getElementById('peoplelist').style.display="block";s
})