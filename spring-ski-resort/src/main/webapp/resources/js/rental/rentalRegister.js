console.log("test!!");

document.getElementById('trigger').addEventListener('click', () => {
     document.getElementById('files').click();
})

const regExp = new RegExp("\.(exe|sh|bat|js|msi|dll)$");
const regExpImg = new RegExp("\.(jpg|jpeg|png|gif)$");
const maxSize = 1024 * 1024 * 20;

function fileValidation(fileName, fileSize) {
     if (!regExpImg.test(fileName)) {
          return 0;
     } else if (regExp.test(fileName)) {
          return 0;
     } else if (fileSize > maxSize) {
          return 0;
     } else {
          return 1;
     }
}

document.addEventListener('change', (e) => {
     if (e.target.id == 'files') {
          document.getElementById('regBtn').disabled = false;
          const fileObj = document.getElementById('files').files;
          let div = document.getElementById('fileZone');
          div.innerHTML = "";
          let isOk = 1;
          let ul = `<ul class="list-group list-group-flush">`;
          for (let file of fileObj) {
               let validResult = fileValidation(file.name, file.size);
               isOk *= validResult;
               ul += `<li class="list-group-item">`;
               ul += `<div class="mb-3">`;
               ul += `${validResult ? '<div class="mb-3 badge rounded-pill text-bg-success">업로드 가능</div>' : '<div class="mb-3 badge rounded-pill text-bg-danger">업로드 불가능</div>'}`;
               ul += `${file.name}</div>`;
               ul += `<span class="badge rounded-pill text-bg-${validResult ? 'success' : 'danger'}">${file.size}Byte</span></li>`;
          }
          ul += `</ul>`;
          div.innerHTML = ul;

          if (isOk == 0) {
               document.getElementById('regBtn').disabled = true;
          }
     }
})

