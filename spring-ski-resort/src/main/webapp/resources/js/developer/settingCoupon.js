



document.getElementById('flexCheckDefault3').addEventListener('click', () => {
    const checkbox3 = document.getElementById('flexCheckDefault3');
    const hidden3 = document.getElementById('flexCheckDefault3_hidden');

    if (checkbox3.checked) {
        hidden3.disabled = true;
    } else {
        hidden3.disabled = false;
    }
});

document.getElementById('flexCheckDefault4').addEventListener('click', () => {
    const checkbox4 = document.getElementById('flexCheckDefault4');
    const hidden4 = document.getElementById('flexCheckDefault4_hidden');

    if (checkbox4.checked) {
        hidden4.disabled = true;
    } else {
        hidden4.disabled = false;
    }
});

document.getElementById('flexCheckDefault5').addEventListener('click', () => {
    const checkbox5 = document.getElementById('flexCheckDefault5');
    const hidden5 = document.getElementById('flexCheckDefault5_hidden');

    if (checkbox5.checked) {
        hidden5.disabled = true;
    } else {
        hidden5.disabled = false;
    }
});
