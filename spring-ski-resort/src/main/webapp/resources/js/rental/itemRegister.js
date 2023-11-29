let lowItem = document.getElementById('lowItem');
let midItem = document.getElementById('midItem');
let premiumItem = document.getElementById('premiumItem');
let wearItem = document.getElementById('wearItem');

lowItem.addEventListener('click', () => {
     document.getElementById('rowItemName').style.display = 'flex';
     document.getElementById('midItemName').style.display = 'none';
     document.getElementById('premiumItemName').style.display = 'none';
     document.getElementById('wearItemName').style.display = 'none';
     document.getElementById('itemExplain').style.display = 'flex';
});

midItem.addEventListener('click', () => {
     document.getElementById('rowItemName').style.display = 'none';
     document.getElementById('midItemName').style.display = 'flex';
     document.getElementById('premiumItemName').style.display = 'none';
     document.getElementById('wearItemName').style.display = 'none';
     document.getElementById('itemExplain').style.display = 'flex';
});

premiumItem.addEventListener('click', () => {
     document.getElementById('rowItemName').style.display = 'none';
     document.getElementById('midItemName').style.display = 'none';
     document.getElementById('premiumItemName').style.display = 'flex';
     document.getElementById('wearItemName').style.display = 'none';
     document.getElementById('itemExplain').style.display = 'flex';
});

wearItem.addEventListener('click', () => {
     document.getElementById('rowItemName').style.display = 'none';
     document.getElementById('midItemName').style.display = 'none';
     document.getElementById('premiumItemName').style.display = 'none';
     document.getElementById('wearItemName').style.display = 'flex';
     document.getElementById('itemExplain').style.display = 'flex';
})