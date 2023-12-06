
// Marquee 커스텀 함수 : 파라미터는 (선택자, 속도, 방향전환 여부)
function Marquee(selector, speed, reverse) {
  const parentSelector = document.querySelector(selector); // 클래스명을 인자로 받은 매개변수
  const clone = parentSelector.innerHTML; // 해당 클래스 엘리먼트의 html 값을 clone으로 선언
  const firstElement = parentSelector.firstElementChild;
  let i = 0;
  // console.log(firstElement);
  parentSelector.insertAdjacentHTML('beforeend', clone);
  parentSelector.insertAdjacentHTML('beforeend', clone);
  
  if (reverse) parentSelector.classList.add('reverse');

  setInterval(function () {
    if (reverse) {
      firstElement.style.marginRight = `-${i}px`;
    } else {
      firstElement.style.marginLeft = `-${i}px`;
    }
    if (i > firstElement.clientWidth) {
      i = 0;
    }
    i += speed;
  }, 0);
}

// 윈도우 로드되면 해당 함수 실행
window.addEventListener('load', function(){
  Marquee('.marquee1', 1, false);
  Marquee('.marquee2', 1, true);
});




function toggleMenu(btnNumber) {
    const ulMenu = document.getElementById(`ul-menu${btnNumber}`);

    if (ulMenu.style.opacity === '0' || ulMenu.style.opacity === '') {
        ulMenu.style.opacity = '1';
        ulMenu.style.maxHeight = '150px'; // 적절한 크기로 변경
    } else {
        ulMenu.style.opacity = '0';
        ulMenu.style.maxHeight = '0';
    }
}

document.getElementById('menu-Btn1').addEventListener('click', () => toggleMenu(1));
document.getElementById('menu-Btn2').addEventListener('click', () => toggleMenu(2));
document.getElementById('menu-Btn3').addEventListener('click', () => toggleMenu(3));
document.getElementById('menu-Btn4').addEventListener('click', () => toggleMenu(4));



// ↑ 버튼 클릭 이벤트 처리
document.querySelectorAll('.role_up').forEach(function (button) {
    button.addEventListener('click', function () {
        // 현재 버튼이 속한 <tr> 요소 찾기
        let row = this.closest('tr');

        // 두 번째 <th> 노드 값 가져오기 (예시로 두 번째 노드를 선택)
        let id = row.querySelector('th:nth-child(2)').textContent;

        roleUpToServer(id).then(location.reload());
    });
});

// ↓ 버튼 클릭 이벤트 처리
document.querySelectorAll('.role_down').forEach(function (button) {
    button.addEventListener('click', function () {
        // 현재 버튼이 속한 <tr> 요소 찾기
        let row = this.closest('tr');

        // 두 번째 <th> 노드 값 가져오기 (예시로 두 번째 노드를 선택)
        let id = row.querySelector('th:nth-child(2)').textContent;

        roleDownToServer(id).then(location.reload());
    });
});

async function roleUpToServer(id) {
    try {
        const url = "/developer/authUp/" + id;
        const config = {
            method: 'get'
        };
        const resp = await fetch(url, config);
        const result = await resp.text();
        return result;
    } catch (error) {
        console.log(error);
    }

}
async function roleDownToServer(id){
    try {
        const url = "/developer/authDown/" + id;
        const config = {
            method: 'get'
        };
        const resp = await fetch(url, config);
        const result = await resp.text();
        return result;
    } catch (error) {
        console.log(error);
    }
}