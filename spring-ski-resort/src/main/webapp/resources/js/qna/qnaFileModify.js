async function removeFileToServer(uuid) {
  try {
    const url = '/qna/file/' + uuid;
    const config = {
      method: 'delete'
    };
    const resp = await fetch(url, config);
    const result = await resp.text();
    return result;
  } catch (err) {
    console.log(err);
  }
}


document.addEventListener('click', (e) => {
  if (e.target.classList.contains('file-x')) {
    let uuid = e.target.dataset.uuid;
    console.log(uuid);
    e.target.closest('li').remove();

    document.getElementById('regBtn').addEventListener('click', () => {
      console.log('>>> uuid >>> ' + uuid);
      removeFileToServer(uuid).then(result => {
        if (result == 1) {
          console.log("파일삭제 성공");
        } else {
          console.log("파일삭제 실패");
        }
      })
    });
  }
})