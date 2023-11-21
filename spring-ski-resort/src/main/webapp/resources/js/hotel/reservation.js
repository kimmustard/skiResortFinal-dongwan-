document.getElementById("payBtn").addEventListener('click',()=>{
   

        document.getElementById("innerbox").style.display="block";
   
   
})
document.getElementById("closeBtn").addEventListener('click',()=>{
	
    	 document.getElementById("innerbox").style.display="none";
   
})
 
 	    function updateCustomText(dateRange, resultId) {
        var customText = "선택한 날짜 범위: " + dateRange;
        $('#' + resultId).text(customText);
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
            updateCustomText(dateRange, 'result1');
          
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
        }, function (start, end, label) {
            var dateRange = start.format('YYYY-MM-DD') + ' ~ ' + end.format('YYYY-MM-DD');
            updateCustomText(dateRange, 'result2');
        });

     	

    

    });
    
    