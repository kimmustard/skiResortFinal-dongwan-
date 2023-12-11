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

let page = 0; // 현재 인덱스 번호
let imageWidth = 400; // 이미지 width

let value = 0;
let rigthWidth = 500;
let leftWidth = 500;

let nextBtn = document.getElementById('slideNextBtn'); // 다음 이미지로 넘어가는 버튼
let prevBtn = document.getElementById('slidePrevBtn'); // 다음 이미지로 넘어가는 버튼

function cloneAndAppend(container, className) {
     let slides = container.querySelectorAll(`.${className}`);
     let firstSlideClone = slides[0].cloneNode(true);
     container.appendChild(firstSlideClone);
}

let lowItemImage = document.getElementById('lowItemImageBox');
cloneAndAppend(lowItemImage, 'slide');

let midItemImage = document.getElementById('midItemImageBox');
cloneAndAppend(midItemImage, 'slide');

let premiumItemImage = document.getElementById('premiumItemImageBox');
cloneAndAppend(premiumItemImage, 'slide');

function next() {
     value -= rigthWidth;
     transitionSlides();
}

function prev() {
     value += leftWidth;
     transitionSlides();
}

function transitionSlides() {
     lowItemImage.style.transition = 'transform 0.5s ease';
     lowItemImage.style.transform = 'translateX(' + value + 'px)';

     midItemImage.style.transition = 'transform 0.5s ease';
     midItemImage.style.transform = 'translateX(' + value + 'px)';

     premiumItemImage.style.transition = 'transform 0.5s ease';
     premiumItemImage.style.transform = 'translateX(' + value + 'px)';

     if (value <= -5500) {
          setTimeout(function () {

               lowItemImage.style.transition = '0s';
               midItemImage.style.transition = '0s';
               premiumItemImage.style.transition = '0s';

               value = 0;
               lowItemImage.style.transform = 'translateX(' + value + 'px)';
               midItemImage.style.transform = 'translateX(' + value + 'px)';
               premiumItemImage.style.transform = 'translateX(' + value + 'px)';

          }, 0);
     }

     if (value >= 0) {
          setTimeout(function () {

               lowItemImage.style.transition = '0s';
               midItemImage.style.transition = '0s';
               premiumItemImage.style.transition = '0s';

               value = -5500;
               lowItemImage.style.transform = 'translateX(' + value + 'px)';
               midItemImage.style.transform = 'translateX(' + value + 'px)';
               premiumItemImage.style.transform = 'translateX(' + value + 'px)';

          }, 0);
     }
}

if (nextBtn) {
     nextBtn.addEventListener('click', function () {
          next();
     });
}
if (prevBtn) {
     prevBtn.addEventListener('click', function () {
          prev();
     });
}


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
