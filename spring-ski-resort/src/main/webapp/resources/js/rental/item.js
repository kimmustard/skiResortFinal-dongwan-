let lowItem = document.getElementById('lowItem');
let midItem = document.getElementById('midItem');
let premiumItem = document.getElementById('premiumItem');

lowItem.addEventListener('click', () => {
     document.getElementById('lowItemImageBox').style.display = 'flex';
     document.getElementById('midItemImageBox').style.display = 'none';
     document.getElementById('premiumItemImageBox').style.display = 'none';
})
midItem.addEventListener('click', () => {
     document.getElementById('lowItemImageBox').style.display = 'none';
     document.getElementById('midItemImageBox').style.display = 'flex';
     document.getElementById('premiumItemImageBox').style.display = 'none';
})
premiumItem.addEventListener('click', () => {
     document.getElementById('lowItemImageBox').style.display = 'none';
     document.getElementById('midItemImageBox').style.display = 'none';
     document.getElementById('premiumItemImageBox').style.display = 'flex';
})



/*     슬라이드 기능     */


let nextBtn = document.querySelector('.slideNextBtn'); // 다음 이미지로 넘어가는 버튼
let prevBtn = document.querySelector('.slidePrevBtn'); // 이전 이미지로 넘어가는 버튼
let slideList = document.querySelector('.itemImageBox');
let slideContent = document.querySelectorAll('.slide');
let slideLen = slideContent.length;

let slideWidth = 400;
let slideSpeed = 300;
let startNum = 0;

slideList.style.width = slideWidth * (slideLen + 2) + "px";

let firstChild = slideList.firstElementChild;
let lastChild = slideList.lastElementChild;
let firstClone = firstChild.cloneNode(true);
let lastClone = lastChild.cloneNode(true);

slideList.appendChild(firstClone);
slideList.insertBefore(lastClone, slideList.firstChild);

slideList.style.transform = "translate3d(-" + (slideWidth * (startNum + 1)) + "px, 0px, 0px)";

let curIndex = startNum;
let curSlide = slideContent[curIndex];
curSlide.classList.add('slide_active');

nextBtn.addEventListener('click', function () {
     if (curIndex < slideLen) {
          slideList.style.transition = slideSpeed + "ms";
          slideList.style.transform = "translate3d(-" + (slideWidth * (curIndex + 2)) + "px, 0px, 0px)";
     }
     if (curIndex === slideLen - 1) {
          setTimeout(function () {
               slideList.style.transition = "0ms";
               slideList.style.transform = "translate3d(-" + (slideWidth * slideLen + 1) + "px, 0px, 0px)";
          }, slideSpeed);
          curIndex = -1;
     }
     curSlide.classList.remove('slide_active');
     curSlide = slideContent[++curIndex];
     curSlide.classList.add('slide_active');
})

prevBtn.addEventListener('click', function () {
     if (curIndex >= 0) {
          slideList.style.transition = slideSpeed + "ms";
          slideList.style.transform = "translate3d(-" + (slideWidth * curIndex) + "px, 0px, 0px)";
     }
     if (curIndex === 0) {
          setTimeout(function () {
               slideList.style.transition = "0ms";
               slideList.style.transform = "translate3d(-" + (slideWidth * slideLen) + "px, 0px, 0px)";
          }, slideSpeed);
          curIndex = slideLen;
     }
     curSlide.classList.remove('slide_active');
     curSlide = slideContent[--curIndex];
     curSlide.classList.add('slide_active');
})



/*   장바구니 기능    */

function fnContains(str, substr) {
     return str.indexOf(substr) !== -1;
}

// 스키 아이템
document.addEventListener('DOMContentLoaded', function () {

     document.getElementById('skiItemList').addEventListener('click', (e) => {
          if (e.target.tagName === 'IMG') {
               let itemName = e.target.getAttribute('data-name');
               let itemAdultFee = e.target.getAttribute('data-adultFee');
               let itemKidFee = e.target.getAttribute('data-kidFee');

               if (fnContains(itemName, '주니어')) {
                    console.log(itemName, itemKidFee);
                    shoppingBasket(itemName, itemKidFee);
               } else {
                    console.log(itemName, itemAdultFee);
                    shoppingBasket(itemName, itemAdultFee);
               }

               document.getElementById('rentalItemName').value = itemName;

          }
     });

})

// 보드 아이템
document.addEventListener('DOMContentLoaded', function () {

     document.getElementById('boardItemList').addEventListener('click', (e) => {
          if (e.target.tagName === 'IMG') {
               let itemName = e.target.getAttribute('data-name');
               let itemAdultFee = e.target.getAttribute('data-adultFee');
               let itemKidFee = e.target.getAttribute('data-kidFee');

               if (fnContains(itemName, '주니어')) {
                    console.log(itemName, itemKidFee);
                    shoppingBasket(itemName, itemKidFee);
               } else {
                    console.log(itemName, itemAdultFee);
                    shoppingBasket(itemName, itemAdultFee);
               }

          }
     });

})

// 의류/보호장비 아이템
document.addEventListener('DOMContentLoaded', function () {

     document.getElementById('wearItemList').addEventListener('click', (e) => {
          if (e.target.tagName === 'IMG') {
               let itemName = e.target.getAttribute('data-name');
               let itemAdultFee = e.target.getAttribute('data-adultFee');
               console.log(itemName);
               shoppingBasket(itemName, itemAdultFee);
          }
     });

})

function shoppingBasket(name, price) {
     let shoppingBasketDiv = document.querySelector('.shoppingBasket');
     let itemSelectDiv = document.createElement('div');
     itemSelectDiv.innerHTML = `<p class="fs-5">${name}</p>`;
     itemSelectDiv.innerHTML += `<p class="fs-5">${price}원</p>`;
     shoppingBasketDiv.appendChild(itemSelectDiv);
}

let imageBox = document.querySelectorAll('.itemImageBox .slide img');
let shopContainer = document.querySelector('.shopContainer');

imageBox.forEach(function (image) {
     image.addEventListener('click', function () {
          shopContainer.style.display = 'block';
     })
})
