function toggleMenu(btnNumber) {
    const ulMenu = document.getElementById(`ul-menu${btnNumber}`);

    if (ulMenu.style.opacity === '0' || ulMenu.style.opacity === '') {
        ulMenu.style.opacity = '1';
        ulMenu.style.maxHeight = '150px'; // 적절한 크기로 변경
    } else {
        ulMenu.style.opacity = '0';
        ulMenu.style.maxHeight = '0';
    }
}

document.getElementById('menu-Btn1').addEventListener('click', () => toggleMenu(1));
document.getElementById('menu-Btn2').addEventListener('click', () => toggleMenu(2));
document.getElementById('menu-Btn3').addEventListener('click', () => toggleMenu(3));
document.getElementById('menu-Btn4').addEventListener('click', () => toggleMenu(4));
