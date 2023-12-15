document.addEventListener("DOMContentLoaded", function () {

  let pointList = document.querySelectorAll(".dev-notice-point-td");
  //console.log(pointList);
  let numberBox = [];

  for (let pnvo of pointList) {
      console.log(pnvo);
      let Point = pnvo.dataset.noticepoint;
      let Number = pnvo.innerText;
      numberBox = [pnvo.length];
      numberBox = Number;
        console.log(numberBox);
    // 체크박스 요소 가져오기
    let noticePointCheckbox = document.getElementById(`noticepointinput${Number}`);
    console.log(noticePointCheckbox);
    // noticePoint 값이 'Y'이면 체크, 'N'이면 해제
    if (noticePointCheckbox) {
      console.log(noticePointCheckbox.checked);
        noticePointCheckbox.checked = Point === 'Y';
      // 체크박스 상태가 변경될 때 이벤트 리스너 등록
      noticePointCheckbox.addEventListener('change', function () {
        // 체크박스가 체크되어 있으면 'Y', 그렇지 않으면 'N' 설정
        Point = noticePointCheckbox.checked ? 'Y' : 'N';
        console.log(Number,Point);		  			 
    });
  }
  }


  document.addEventListener('click',(e)=>{
      for(let i=0; i<numberBox.length; i++){
        console.log(numberBox[i]);
        if(e.target.type==='checkbox' && e.target.name==='noticePoint'){
          let checkBox = document.getElementById(`noticepointinput${numberBox[i]}`);console.log(checkBox);
          let checkBoxHidden = document.getElementById(`notice-point-hidden${numberBox[i]}`);console.log(checkBoxHidden);
      
          if (checkBox.checked) {
            checkBoxHidden.disabled = true;
            console.log(checkBoxHidden);
                    } else {
            checkBoxHidden.disabled = false;
            console.log(checkBoxHidden);
                    }
        }
      }
    })

});






// document.addEventListener("DOMContentLoaded", function () {
//   let pointList = document.querySelectorAll(".dev-notice-point-td");
  
//   let checkBoxInfo = {}; // 객체로 변경

//   for (let pnvo of pointList) {
//       console.log(pnvo);
//       let Point = pnvo.dataset.noticepoint;
//       let Number = pnvo.innerText;

//       // 객체에 정보 저장
//       checkBoxInfo[Number] = {
//           Point: Point,
//           Checkbox: document.getElementById(`noticepointinput${Number}`)
//       };

//       console.log(checkBoxInfo[Number]);

//       // noticePoint 값이 'Y'이면 체크, 'N'이면 해제
//       if (checkBoxInfo[Number].Checkbox) {
//           console.log(checkBoxInfo[Number].Checkbox.checked);
//           checkBoxInfo[Number].Checkbox.checked = Point === 'Y';

//           // 체크박스 상태가 변경될 때 이벤트 리스너 등록
//           checkBoxInfo[Number].Checkbox.addEventListener('change', function () {
//               // 체크박스가 체크되어 있으면 'Y', 그렇지 않으면 'N' 설정
//               checkBoxInfo[Number].Point = checkBoxInfo[Number].Checkbox.checked ? 'Y' : 'N';
//               console.log(checkBoxInfo[Number]);
//           });
//       }
//   }

//   document.addEventListener('click', (e) => {
//       for (let number in checkBoxInfo) {
//         console.log(number);
//           //if (e.target.classList.contains(`notice-point-input${number}`)) {
//               let checkBox = document.getElementById(`noticepointinput${number}`);
//               let checkBoxHidden = document.getElementById(`notice-point-hidden${number }`);
  
//               if (checkBox.checked) {
//                   checkBoxHidden.disabled = true;
//                   console.log(checkBoxHidden);
//               } else {
//                   checkBoxHidden.disabled = false;
//                   console.log(checkBoxHidden);
//               }
//           //}
//       }
//   });
// });



