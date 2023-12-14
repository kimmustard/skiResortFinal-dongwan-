



<script type="text/javascript">
  document.addEventListener("DOMContentLoaded", function () {

    let pointList = document.querySelectorAll(".dev-notice-point-td");
  console.log(pointList);
  for (let pnvo of pointList) {
    console.log(pnvo);
  let Point = pnvo.dataset.noticepoint;
  console.log(Point);
  // 체크박스 요소 가져오기
  let noticePointCheckbox = document.getElementById('flexSwitchCheckChecked');
  // noticePoint 값이 'Y'이면 체크, 'N'이면 해제
  if (noticePointCheckbox) {
    noticePointCheckbox.checked = Point === 'Y';
  // 체크박스 상태가 변경될 때 이벤트 리스너 등록
  noticePointCheckbox.addEventListener('change', function () {
    // 체크박스가 체크되어 있으면 'Y', 그렇지 않으면 'N' 설정
    Point = noticePointCheckbox.checked ? 'Y' : 'N';
  console.log(Point);
			      })
		    }
	  }
  
	  document.addEventListener('click',(e)=>{
		  if(e.target.classList.contains('notice-point-input')){
		    	const checkBox = document.getElementById('flexSwitchCheckChecked');
  console.log(checkBox);
  const checkBoxHidden = document.getElementById('notice-point-hidden');

  if (checkBox.checked) {
    checkBoxHidden.disabled = true;
  console.log(checkBoxHidden);
				    } else {
    checkBoxHidden.disabled = false;
  console.log(checkBoxHidden);
				    }
		  }

	  })
	});
</script>