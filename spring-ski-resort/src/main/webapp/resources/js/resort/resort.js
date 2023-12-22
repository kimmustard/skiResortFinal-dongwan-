

function slopeMapAction(e) {
    console.log(e);
    let clickedElement = document.getElementById(`${e}`);

    // 모든 이미지 요소를 가져오기
    let allElements = document.querySelectorAll('.slope-map > img');

    // 모든 이미지에 'active' 클래스 제거
    allElements.forEach(element => {
        element.classList.remove('active');
    });

    // 클릭된 이미지에 'active' 클래스 추가
    clickedElement.classList.add('active');
}