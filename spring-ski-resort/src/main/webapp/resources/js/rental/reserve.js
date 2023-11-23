document.addEventListener('DOMContentLoaded', function () {
    let dateRangePicker = document.getElementById('dateRangePicker');
    let rentalReserveStart = document.getElementById('rentalReserveStart');

    if (dateRangePicker && rentalReserveStart) {
        dateRangePicker.addEventListener('input', function () {
            rentalReserveStart.value = this.value;
        });

        dateRangePicker.addEventListener('cancel.daterangepicker', function () {
            rentalReserveStart.value = '';
        });
    }
});

document.addEventListener("DOMContentLoaded", function () {
    let numberOfPeopleInput = document.getElementById("numberOfPeople");
    let incrementBtn = document.getElementById("incrementBtn");
    let decrementBtn = document.getElementById("decrementBtn");

    incrementBtn.addEventListener("click", function () {
        let currentNumberOfPeople = parseInt(numberOfPeopleInput.value, 10);
        numberOfPeopleInput.value = currentNumberOfPeople + 1;
    });

    decrementBtn.addEventListener("click", function () {
        let currentNumberOfPeople = parseInt(numberOfPeopleInput.value, 10);
        if (currentNumberOfPeople > 1) {
            numberOfPeopleInput.value = currentNumberOfPeople - 1;
        }
    });
});