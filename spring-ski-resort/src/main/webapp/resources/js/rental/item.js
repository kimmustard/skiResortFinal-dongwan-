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



