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


let value = 0;
let slideWidth = 400;

let nextBtn = document.getElementById('slideNextBtn'); // 다음 이미지로 넘어가는 버튼
let prevBtn = document.getElementById('slidePrevBtn'); // 이전 이미지로 넘어가는 버튼

// 이미지 클론
function clone(container, className) {
     let slides = container.querySelectorAll(`.${className}`);
     let firstSlideClone = slides[0].cloneNode(true);
     let lastSlideClone = slides[slides.length - 1].cloneNode(true);
     container.appendChild(firstSlideClone);
     container.appendChild(lastSlideClone);

}

let lowItemImage = document.getElementById('lowItemImageBox');
clone(lowItemImage, 'slide');

let midItemImage = document.getElementById('midItemImageBox');
clone(midItemImage, 'slide');

let premiumItemImage = document.getElementById('premiumItemImageBox');
clone(premiumItemImage, 'slide');

function next() {
     value -= slideWidth;
     transitionSlides();
}

function prev() {
     value += slideWidth;
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

          }, 300);
     }

     if (value >= 0) {
          setTimeout(function () {

               lowItemImage.style.transition = '0.5s';
               midItemImage.style.transition = '0.5s';
               premiumItemImage.style.transition = '0.5s';

               value = -5500;
               lowItemImage.style.transform = 'translateX(' + value + 'px)';
               midItemImage.style.transform = 'translateX(' + value + 'px)';
               premiumItemImage.style.transform = 'translateX(' + value + 'px)';

          }, 300);
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


///


// 스키 아이템
document.addEventListener('DOMContentLoaded', function () {

     document.getElementById('skiItemList').addEventListener('click', (e) => {
          if (e.target.tagName === 'IMG') {
               let itemNum = e.target.getAttribute('data-num');
               let itemName = e.target.getAttribute('data-name');
               let itemAdultFee = e.target.getAttribute('data-adultFee');
               let itemKidFee = e.target.getAttribute('data-kidFee');

               if (fnContains(itemName, '주니어')) {
                    console.log(itemNum, itemName, itemKidFee);
                    shoppingBasket(itemNum, itemName, itemKidFee);
               } else {
                    console.log(itemName, itemAdultFee);
                    shoppingBasket(itemNum, itemName, itemAdultFee);
               }

          }
     });

})

// 보드 아이템
document.addEventListener('DOMContentLoaded', function () {

     document.getElementById('boardItemList').addEventListener('click', (e) => {
          if (e.target.tagName === 'IMG') {
               let itemNum = e.target.getAttribute('data-num');
               let itemName = e.target.getAttribute('data-name');
               let itemAdultFee = e.target.getAttribute('data-adultFee');
               let itemKidFee = e.target.getAttribute('data-kidFee');

               if (fnContains(itemName, '주니어')) {
                    console.log(itemNum, itemName, itemKidFee);
                    shoppingBasket(itemNum, itemName, itemKidFee);
               } else {
                    console.log(itemNum, itemName, itemAdultFee);
                    shoppingBasket(itemNum, itemName, itemAdultFee);
               }

          }
     });

})

// 의류/보호장비 아이템
document.addEventListener('DOMContentLoaded', function () {

     document.getElementById('wearItemList').addEventListener('click', (e) => {
          if (e.target.tagName === 'IMG') {
               let itemNum = e.target.getAttribute('data-num');
               let itemName = e.target.getAttribute('data-name');
               let itemAdultFee = e.target.getAttribute('data-adultFee');
               console.log(itemNum, itemName);
               shoppingBasket(itemNum, itemName, itemAdultFee);
          }
     });

})

let itemsArray = [];

// 이미지 클릭시 장바구니에 itemname, price 담기
function shoppingBasket(itemNum, itemName, price) {
     console.log(itemNum, itemName, price);

     let shoppingBasketDiv = document.querySelector('.shoppingBasket');

     let itemSelectDiv = document.getElementById('itemSelectDiv');

     if (itemsArray.length < 5) {

          // 선택된 아이템을 배열에 추가
          itemsConfig = {
               rentalItemNum: itemNum,
               rentalItemName: itemName,
               rentalItemPrice: price
          };

          itemsArray.push(itemsConfig);


          itemSelectDiv.innerHTML += `<p class="fs-5">${itemName}</p><br><p class="fs-5">요금 : ${price}원</p><br>`;
          itemSelectDiv.innerHTML += `<input type="hidden" name="ritvoList[${itemsArray.length - 1}].rentalItemNum" value="${itemNum}">`;
          itemSelectDiv.innerHTML += `<input type="hidden" name="ritvoList[${itemsArray.length - 1}].rentalItemName" value="${itemName}">`;
          itemSelectDiv.innerHTML += `<input type="hidden" name="ritvoList[${itemsArray.length - 1}].rentalItemPrice" value="${price}">`;


     } else {
          alert("최대 5개만 예약 가능합니다");
     }

}



async function ItemsBasketToServer() {
     try {
          const url = '/rental/itemsBasket';
          const config = {
               method: 'post',
               headers: {
                    'Content-Type': 'application/json; charset=UTF-8',
               },
               body: JSON.stringify(itemsArray)
          };

          console.log('ItemsBasketToServer :', JSON.stringify(itemsArray));

          let resp = await fetch(url, config);
          let result = await resp.text();
          return result;
     } catch (error) {
          console.log(error);
     }
}


document.getElementById('reserveBtn').addEventListener('click', () => {
     ItemsBasketToServer().then(result => {
          if (result > 0) {
               console.log('성공');
          }
     })
})



let imageBox = document.querySelectorAll('.itemImageBox .slide img');
let shopContainer = document.querySelector('.shopContainer');

//로그인된 유저가 리프트권이 있다면? true / false

if (true) {
     imageBox.forEach(function (image) {
          image.addEventListener('click', function () {
               shopContainer.style.display = 'block';
          })
     })
}
