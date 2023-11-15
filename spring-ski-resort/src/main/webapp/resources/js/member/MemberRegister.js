
document.getElementById('flexCheckDefault').addEventListener('click', () => {
    console.log("체크완료");
    const checkboxe1 = document.getElementById('flexCheckDefault-1');
    const checkboxe2 = document.getElementById('flexCheckDefault-2');
    const checkboxe3 = document.getElementById('flexCheckDefault-3');

    if (document.getElementById('flexCheckDefault').checked == true) {
        checkboxe1.checked = true;
        checkboxe2.checked = true;
        checkboxe3.checked = true;
    } else {
        checkboxe1.checked = false;
        checkboxe2.checked = false;
        checkboxe3.checked = false;
    }


})