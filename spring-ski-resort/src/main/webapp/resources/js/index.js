//공지 두 개 받아오기
async function getTwoNotice(){
    try {
        const url = "/notice/getTwoNotice";
        const config = {
            method: 'get'
        };
        const resp = await fetch(url, config);
        const result = await resp.json();
        return result;
    } catch (error) {
        console.log(error);
    }
}
//이벤트 리스트 5개 받아오기
async function getFiveEvent(){
    try {
        const url = "/notice/getFiveEvent";
        const config = {
            method: 'get'
        };
        const resp = await fetch(url, config);
        const result = await resp.json();
        return result;
    } catch (error) {
        console.log(error);
    }
}
 //공지 두 개 받아오기
    getTwoNotice().then(notice =>{
        if(notice!=undefined){
        for(let i = 0; i<notice.length; i++){     
        document.getElementById('notice-box').innerHTML+= '<ul><li><span class="notice-reg">'+notice[i].noticeRegAt+'</span><a class="notice-title" href="/notice/detail?noticeNum='+notice[i].noticeNum+'">'+notice[i].noticeTitle+'</a></li></ul>'        
        }}
    });
   


  //슬라이드에 이미지와 내용 추가
     getFiveEvent().then(events => {
      for (let i = 0; i < events.length; i++) {
          let centralEventImageBoxes = document.querySelectorAll("#event-image-box" + (i + 1));
          
          centralEventImageBoxes.forEach(function (centralEventImageBox) {
              centralEventImageBox.style.backgroundImage = "url('" + events[i].noticeImageUrl + "')";
              centralEventImageBox.onclick = function () {
                moveEventSite(events[i].noticeNum);
            };
          });
          let centralEventContentBoxes = document.querySelectorAll("#event-content-box" + (i + 1));
          
          centralEventContentBoxes.forEach(function (centralEventContentBox) {
            centralEventContentBox.innerHTML =events[i].noticeContent;
          });
        }}).catch(error => {
      console.error("Error fetching events:", error);
  });
//이벤트 페이지 이동 이벤트
  function moveEventSite(num){
    location.href = "/notice/detail?noticeNum="+num;
 }
    

  document.addEventListener("DOMContentLoaded", function () {
        var ytLandscape = document.getElementById("ytLandscape");
        var wrapper = document.getElementById("wrapper");

        var initialWrapperPosition = window.innerHeight;

        wrapper.style.top = initialWrapperPosition + "px";

        function updateWrapperPosition() {
            var ytLandscapeRect = ytLandscape.getBoundingClientRect();

            if (ytLandscapeRect.bottom <= window.innerHeight) {
                wrapper.style.top = ytLandscapeRect.bottom + "px";
            } else {
                wrapper.style.top = initialWrapperPosition + "px";
            }
        }

        window.addEventListener("resize", updateWrapperPosition);
        window.addEventListener("scroll", updateWrapperPosition);
    });
    
//이벤트화면
let slides = document.querySelector(".slides"),
  slide = document.querySelectorAll(".slides li"),
  currentIdx = 0,
  slideCount = slide.length,
  slideWidth = 300,
  slideMargin = 30,
  prevBtn = document.querySelector(".prev"),
  nextBtn = document.querySelector(".next");

makeClone();

function makeClone() {
  for (let i = 0; i < slideCount; i++) {
    let cloneSlide = slide[i].cloneNode(true);
    cloneSlide.classList.add("clone");
    slides.appendChild(cloneSlide);
  }
  for (let i = slideCount - 1; i >= 0; i--) {
    let cloneSlide = slide[i].cloneNode(true);
    cloneSlide.classList.add("clone");
    slides.prepend(cloneSlide);
  }

  updateWidth();
  setinit();
  setTimeout(function () {
    slides.classList.add("animated");
  }, 100);
}

function updateWidth() {
  let currentSlides = document.querySelectorAll(".slides li");
  let newSlideCount = currentSlides.length;

  let newWidth =
    (slideWidth + slideMargin) * newSlideCount - slideMargin + "px";
  slides.style.width = newWidth;
  moveSlide(currentIdx - 1);
}

function setinit() {
  let TranslateValue = -(slideWidth + slideMargin) * slideCount;
  slides.style.transform = "translateX(" + TranslateValue + "px)";
}

function updateOpacity() {
  // 중앙에 있는 아이템의 인덱스 계산

  let centralItemIndex = ((currentIdx % slideCount + slideCount) % slideCount)+2;
  let allEventItemBoxes = document.querySelectorAll(".event-item-box");
  allEventItemBoxes.forEach(function (itemBox) {
    itemBox.style.opacity = "0.7";
  });
  // 중앙에 있는 아이템의 투명도를 1로 설정
  if(centralItemIndex==6){
    centralItemIndex= 1;
  }

  let centralEventItemBoxes = document.querySelectorAll("#event-item-box" + (centralItemIndex));

  centralEventItemBoxes.forEach(function (centralEventItemBox) {
  
      centralEventItemBox.style.opacity = "1";

  });
}


//연타방지
function clickdeilay(btn){
  btn.style.pointerEvents = "none";
  setTimeout(function () {
    btn.style.pointerEvents = "auto";;
  }, 600);
}

nextBtn.addEventListener("click", function () {
  clickdeilay(nextBtn);
  moveSlide(currentIdx + 1);
});

prevBtn.addEventListener("click", function () {
  clickdeilay(prevBtn);
  moveSlide(currentIdx - 1);

});

function moveSlide(num) {
  slides.style.left = -num * (slideWidth + slideMargin) + "px";
  currentIdx = num;
  
	 updateOpacity();
  if (currentIdx == slideCount || currentIdx == -slideCount) {
    setTimeout(function () {
      slides.classList.remove("animated");
      slides.style.left = "0px";
      currentIdx = 0;
      updateOpacity();
    }, 500);
    setTimeout(function () {
      slides.classList.add("animated");
    }, 600);
  }
}