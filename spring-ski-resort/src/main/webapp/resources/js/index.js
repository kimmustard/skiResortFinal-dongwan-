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
    
    document.addEventListener("DOMContentLoaded", function () {
    const bannerUl = document.querySelector(".bannerUl");
    const bannerLiList = document.querySelectorAll(".bannerLi");
    let currentIndex = 0;
    let startX;
    let isDragging = false;
  
    function showNextBanner() {
      currentIndex = (currentIndex + 1) % bannerLiList.length;
  
      bannerUl.style.transition = "transform 1s ease-in-out";
      bannerUl.style.transform = `translateX(-${currentIndex * 1460}px)`;
    }
  
    function showPreviousBanner() {
      currentIndex = (currentIndex - 1 + bannerLiList.length) % bannerLiList.length;
  
      bannerUl.style.transition = "transform 1s ease-in-out";
      bannerUl.style.transform = `translateX(-${currentIndex * 1460}px)`;
    }
  
    bannerUl.addEventListener("mousedown", (e) => {
      isDragging = true;
      startX = e.pageX;
    });
  
    bannerUl.addEventListener("mousemove", (e) => {
      if (!isDragging) return;
      e.preventDefault();
      const x = e.pageX;
      const deltaX = startX - x;
  
      if (deltaX > 500) {
        showNextBanner();
        isDragging = false;
      } else if (deltaX < -500) {
        showPreviousBanner();
        isDragging = false;
      }
    });
  
    bannerUl.addEventListener("mouseup", () => {
      isDragging = false;
    });
  
    bannerUl.addEventListener("mouseleave", () => {
      isDragging = false;
    });
  
    bannerUl.addEventListener("click", (e) => {
      if (isDragging) {
        e.preventDefault();
      }
    });
  
    setInterval(() => {
      if (!isDragging) {
        showNextBanner();
      }
    }, 5000); 
  });