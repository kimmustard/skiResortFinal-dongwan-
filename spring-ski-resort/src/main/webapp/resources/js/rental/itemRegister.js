let lowItem = document.getElementById('lowItem');
let midItem = document.getElementById('midItem');
let premiumItem = document.getElementById('premiumItem');

lowItem.addEventListener('click', () => {
     document.getElementById('itemNum').style.display = 'flex';
     document.getElementById('rowItemName').style.display = 'flex';
     document.getElementById('midItemName').style.display = 'none';
     document.getElementById('premiumItemName').style.display = 'none';
     document.getElementById('itemCount').style.display = 'flex';
});

midItem.addEventListener('click', () => {
     document.getElementById('itemNum').style.display = 'flex';
     document.getElementById('rowItemName').style.display = 'none';
     document.getElementById('midItemName').style.display = 'flex';
     document.getElementById('premiumItemName').style.display = 'none';
     document.getElementById('itemCount').style.display = 'flex';
});

premiumItem.addEventListener('click', () => {
     document.getElementById('itemNum').style.display = 'flex';
     document.getElementById('rowItemName').style.display = 'none';
     document.getElementById('midItemName').style.display = 'none';
     document.getElementById('premiumItemName').style.display = 'flex';
     document.getElementById('itemCount').style.display = 'flex';
});

