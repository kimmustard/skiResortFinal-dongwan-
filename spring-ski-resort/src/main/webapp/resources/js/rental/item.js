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


// 이미지 클릭시 장바구니에 itemname, price 담기
function shoppingBasket(itemName, price) {
     console.log(itemName, price);
     let shoppingBasketDiv = document.querySelector('.shoppingBasket');

     if (shoppingBasketDiv.children.length < 8) {
          let itemSelectDiv = document.createElement('div');
          itemSelectDiv.innerHTML = `<p class="fs-5">${itemName}</p><br><p class="fs-5">요금 : ${price}원</p><br>`;
          shoppingBasketDiv.appendChild(itemSelectDiv);
     } else {
          alert("최대 5개만 예약 가능합니다");
     }

}


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

function sendShoppingBasketData() {
     // 장바구니에서 데이터 수집
     let rentalItemName = document.getElementById('showItemName').value;
     let adultFee = document.getElementById('showAdultFee').value;
     let kidFee = document.getElementById('showKidFee').value;

     // JSON으로 보낼 객체 생성
     let requestData = {
          rentalItemName: rentalItemName,
          adultFee: adultFee,
          kidFee: kidFee
     };

     // Ajax 요청 보내기
     $.ajax({
          type: 'POST',
          url: '/rental/item-reserve', // 올바른 엔드포인트로 업데이트
          contentType: 'application/json',
          data: JSON.stringify(requestData),
          success: function (response) {
               // 필요한 경우 응답 처리
               console.log(response);

               
          },
          error: function (error) {
               console.error('에러:', error);
          }
     });
}