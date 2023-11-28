let skiItem = document.getElementById('skiItem');
let boardItem = document.getElementById('boardItem');
let wearItem = document.getElementById('wearItem');

skiItem.addEventListener('click', () => {
     document.getElementById('skiItemList').style.display = 'flex';
     document.getElementById('boardItemList').style.display = 'none';
     document.getElementById('wearItemList').style.display = 'none';
});

boardItem.addEventListener('click', () => {
     document.getElementById('skiItemList').style.display = 'none';
     document.getElementById('boardItemList').style.display = 'flex';
     document.getElementById('wearItemList').style.display = 'none';
});

wearItem.addEventListener('click', () => {
     document.getElementById('skiItemList').style.display = 'none';
     document.getElementById('boardItemList').style.display = 'none';
     document.getElementById('wearItemList').style.display = 'flex';
})