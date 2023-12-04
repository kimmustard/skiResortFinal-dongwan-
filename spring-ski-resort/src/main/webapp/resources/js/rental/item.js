let skiItem = document.getElementById('skiItem');
let boardItem = document.getElementById('boardItem');
let wearItem = document.getElementById('wearItem');

let lowItem = document.getElementById('lowItem');
let midItem = document.getElementById('midItem');
let premiumItem = document.getElementById('premiumItem');


skiItem.addEventListener('click', () => {
     document.getElementById('skiItemList').style.display = 'flex';
     document.getElementById('boardItemList').style.display = 'none';
     document.getElementById('wearItemList').style.display = 'none';








     lowItem.addEventListener('click', () => {
          document.getElementById('lowItemImageBox').style.display = 'flex';
          document.getElementById('midItemImageBox').style.display = 'none';
          document.getElementById('premiumItemImageBox').style.display = 'none';
          document.getElementById('lowItemTextBox').style.display = 'flex';
          document.getElementById('midItemTextBox').style.display = 'none';
          document.getElementById('premiumItemTextBox').style.display = 'none';
     })
     midItem.addEventListener('click', () => {
          document.getElementById('lowItemImageBox').style.display = 'none';
          document.getElementById('midItemImageBox').style.display = 'flex';
          document.getElementById('premiumItemImageBox').style.display = 'none';
          document.getElementById('lowItemTextBox').style.display = 'none';
          document.getElementById('midItemTextBox').style.display = 'flex';
          document.getElementById('premiumItemTextBox').style.display = 'none';
     })
     premiumItem.addEventListener('click', () => {
          document.getElementById('lowItemImageBox').style.display = 'none';
          document.getElementById('midItemImageBox').style.display = 'none';
          document.getElementById('premiumItemImageBox').style.display = 'flex';
          document.getElementById('lowItemTextBox').style.display = 'none';
          document.getElementById('midItemTextBox').style.display = 'none';
          document.getElementById('premiumItemTextBox').style.display = 'flex';
     })
});

boardItem.addEventListener('click', () => {
     document.getElementById('skiItemList').style.display = 'none';
     document.getElementById('boardItemList').style.display = 'flex';
     document.getElementById('wearItemList').style.display = 'none';
     lowItem.addEventListener('click', () => {
          document.getElementById('lowItemImageBox').style.display = 'flex';
          document.getElementById('midItemImageBox').style.display = 'none';
          document.getElementById('premiumItemImageBox').style.display = 'none';
          document.getElementById('lowItemTextBox').style.display = 'flex';
          document.getElementById('midItemTextBox').style.display = 'none';
          document.getElementById('premiumItemTextBox').style.display = 'none';
     })
     midItem.addEventListener('click', () => {
          document.getElementById('lowItemImageBox').style.display = 'none';
          document.getElementById('midItemImageBox').style.display = 'flex';
          document.getElementById('premiumItemImageBox').style.display = 'none';
          document.getElementById('lowItemTextBox').style.display = 'none';
          document.getElementById('midItemTextBox').style.display = 'flex';
          document.getElementById('premiumItemTextBox').style.display = 'none';
     })
     premiumItem.addEventListener('click', () => {
          document.getElementById('lowItemImageBox').style.display = 'none';
          document.getElementById('midItemImageBox').style.display = 'none';
          document.getElementById('premiumItemImageBox').style.display = 'flex';
          document.getElementById('lowItemTextBox').style.display = 'none';
          document.getElementById('midItemTextBox').style.display = 'none';
          document.getElementById('premiumItemTextBox').style.display = 'flex';
     })
});

wearItem.addEventListener('click', () => {
     document.getElementById('skiItemList').style.display = 'none';
     document.getElementById('boardItemList').style.display = 'none';
     document.getElementById('wearItemList').style.display = 'flex';
     lowItem.addEventListener('click', () => {
          document.getElementById('lowItemImageBox').style.display = 'flex';
          document.getElementById('midItemImageBox').style.display = 'none';
          document.getElementById('premiumItemImageBox').style.display = 'none';
          document.getElementById('lowItemTextBox').style.display = 'flex';
          document.getElementById('midItemTextBox').style.display = 'none';
          document.getElementById('premiumItemTextBox').style.display = 'none';
     })
     midItem.addEventListener('click', () => {
          document.getElementById('lowItemImageBox').style.display = 'none';
          document.getElementById('midItemImageBox').style.display = 'flex';
          document.getElementById('premiumItemImageBox').style.display = 'none';
          document.getElementById('lowItemTextBox').style.display = 'none';
          document.getElementById('midItemTextBox').style.display = 'flex';
          document.getElementById('premiumItemTextBox').style.display = 'none';
     })
     premiumItem.addEventListener('click', () => {
          document.getElementById('lowItemImageBox').style.display = 'none';
          document.getElementById('midItemImageBox').style.display = 'none';
          document.getElementById('premiumItemImageBox').style.display = 'flex';
          document.getElementById('lowItemTextBox').style.display = 'none';
          document.getElementById('midItemTextBox').style.display = 'none';
          document.getElementById('premiumItemTextBox').style.display = 'flex';
     })
});




