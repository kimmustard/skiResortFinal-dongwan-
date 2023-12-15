let slides = document.querySelector(".slides"),
  slide = document.querySelectorAll(".slides li"),
  currentIdx = 0,
  slideCount = slide.length,
  slideWidth = 1290,
  slideMargin = 30,
  prevBtn = document.querySelector(".prev"),
  nextBtn = document.querySelector(".next");

makeClone();
//연타방지
function clickdeilay(){
  nextBtn.style.pointerEvents = "none";
  prevBtn.style.pointerEvents = "none";
  setTimeout(function () {
    nextBtn.style.pointerEvents = "auto";
    prevBtn.style.pointerEvents = "auto";
  }, 600);
}

function makeClone() {
  for (let i = 0; i < slideCount; i++) {
    let cloneSlide = slide[i].cloneNode(true);
    cloneSlide.classList.add("clone");
    slides.appendChild(cloneSlide);
  }
  //index 번호 4번은 슬라이드 05임
  //  slideCount -1 초기값
  for (let i = slideCount - 1; i >= 0; i--) {
    let cloneSlide = slide[i].cloneNode(true);
    cloneSlide.classList.add("clone");
    // 원래 있던 내용 앞에 추가해야함(요소의 앞)
    slides.prepend(cloneSlide);
  }

  updateWidth();
  setinit();
  setTimeout(function () {
    slides.classList.add("animated");
  }, 100);
}

// 전체 너비를 구해서 ul의 너비를 지정하는 함수
function updateWidth() {
  let currentSlides = document.querySelectorAll(".slides li");
  let newSlideCount = currentSlides.length;

  let newWidth =
    (slideWidth + slideMargin) * newSlideCount - slideMargin + "px";
  slides.style.width = newWidth;
}

//초기 위치 잡는 함수
function setinit() {
  // 왼쪽으로 움직일거니까 ( - )붙임
  // 이동할 변수
  let TranslateValue = -(slideWidth + slideMargin) * slideCount;
  slides.style.transform = "translateX(" + TranslateValue + "px)";
}

nextBtn.addEventListener("click", function () {
  // 지금 보고있는 슬라이드 수 +1 로 이동
  clickdeilay();
  moveSlide(currentIdx + 1);
});
prevBtn.addEventListener("click", function () {
  // 지금 보고있는 슬라이드 수 +1 로 이동
  clickdeilay();
  moveSlide(currentIdx - 1);
});

// 숫자가 넘어와야 함수가 작동 하도럭
// next 누를수록 왼쪽으로 translate left 값이 거리만큼 이동해야함
// 전체가 슬라이드 너비+여백 만큼 이동해야지?
function moveSlide(num) {
  // 원래는 0이었는데 사용자가 이동하면 index가 1로 바뀌어있어야 함
  slides.style.left = -num * (slideWidth + slideMargin) + "px";
  //이동한 다음에는 currentIdx를 반드시 슬라이드가 최종적으로 보고있는 num 숫자만큼 바껴있어야 함.
  currentIdx = num;
  console.log(currentIdx, slideCount);
  // 마지막이면 1번으로 다시 돌리기

  if (currentIdx == slideCount || currentIdx == -slideCount) {
    setTimeout(function () {
      slides.classList.remove("animated");
      slides.style.left = "0px";
      currentIdx = 0;
    }, 500);

    setTimeout(function () {
      slides.classList.add("animated");
    }, 600);
  }
}