



//비밀글 체크박스 화면표시
document.addEventListener("DOMContentLoaded", function() {
    console.log(qnaSecret);
    if (qnaSecret === 'Y') {
        var qnaSecretCheckbox = document.getElementById('qna-secret');
        if (qnaSecretCheckbox) {
            qnaSecretCheckbox.checked = true;
        }
    }    
})


// document.addEventListener("DOMContentLoaded", function() {
//     console.log(qnaSecret);
//     const secret = qnaSecret;
//     // 체크박스 요소 가져오기
//     var qnaSecretCheckbox = document.getElementById('qna-secret');

//     // qnaSecret 값이 'Y'이면 체크, 'N'이면 해제
//     if (qnaSecretCheckbox) {
//         qnaSecretCheckbox.checked = secret === 'Y';

//         // 체크박스 상태가 변경될 때 이벤트 리스너 등록
//         qnaSecretCheckbox.addEventListener('change', function() {
//             // 체크박스가 체크되어 있으면 'Y', 그렇지 않으면 'N' 설정
//             secret = qnaSecretCheckbox.checked ? 'Y' : 'N';
//             console.log(secret);
//         });
//     }
// });



// document.getElementById('qna-secret').addEventListener('click',()=>{
//     if(qnaSecret==='Y'){
//         let div = document.getElementById('qna-secret');
//         div.innerHTML = `<input type="hidden" name="qnaSecret" value="Y" id="qna-secret">`;
//     }else if(qnaSecret==='N'){
//         div.innerHTML = `<input type="hidden" name="qnaSecret" value="N" id="qna-secret">`;
//     }
// })