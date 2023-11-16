document.getElementById('flexCheckDefault').addEventListener('click', () => {

    if (document.getElementById('flexCheckDefault').checked == true) {
        for (let i = 1; i <= 3; i++) {
            document.getElementById(`flexCheckDefault-${i}`).checked = true;
            document.getElementById(`terms${i}`).disabled = true;
        }
    } else {
        for (let i = 1; i <= 3; i++) {
            document.getElementById(`flexCheckDefault-${i}`).checked = false;
            document.getElementById(`terms${i}`).disabled = false;
        }
    }
})

document.getElementById('flexCheckDefault-1').addEventListener('click', () => {
    if (document.getElementById('flexCheckDefault-1').checked == true) {
        document.getElementById(`terms1`).disabled = true;
    } else {
        document.getElementById(`terms1`).disabled = false;
    }
})
document.getElementById('flexCheckDefault-2').addEventListener('click', () => {
    if (document.getElementById('flexCheckDefault-2').checked == true) {
        document.getElementById(`terms2`).disabled = true;
    } else {
        document.getElementById(`terms2`).disabled = false;
    }
})
document.getElementById('flexCheckDefault-3').addEventListener('click', () => {
    if (document.getElementById('flexCheckDefault-3').checked == true) {
        document.getElementById(`terms3`).disabled = true;
    } else {
        document.getElementById(`terms3`).disabled = false;
    }
})