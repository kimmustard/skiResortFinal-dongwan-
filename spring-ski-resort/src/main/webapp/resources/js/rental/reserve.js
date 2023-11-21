document.addEventListener("DOMContentLoaded", function() {
        let numberOfPeopleInput = document.getElementById("numberOfPeople");
        let incrementBtn = document.getElementById("incrementBtn");
        let decrementBtn = document.getElementById("decrementBtn");

        incrementBtn.addEventListener("click", function() {
            let currentNumberOfPeople = parseInt(numberOfPeopleInput.value, 10);
            numberOfPeopleInput.value = currentNumberOfPeople + 1;
        });

        decrementBtn.addEventListener("click", function() {
            let currentNumberOfPeople = parseInt(numberOfPeopleInput.value, 10);
            if (currentNumberOfPeople > 1) {
                numberOfPeopleInput.value = currentNumberOfPeople - 1;
            }
        });
   	});