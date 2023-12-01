console.log("test!!");

document.getElementById('trigger').addEventListener('click', () => {
     document.getElementById('files').click();
})

const regExp = new RegExp("\.(exe|sh|bat|js|msi|dll)$");
const regExpImg = new RegExp("\.(jpg|jpeg|png|gif)$");
const maxSize = 1024 * 1024 * 20;

