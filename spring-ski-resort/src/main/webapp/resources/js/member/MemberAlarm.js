document.addEventListener('click', (e) => {
    const clickedElement = e.target;
    if (clickedElement.tagName == 'A') {
        // data-alarm-id 값을 가져옴
        const regAt = e.target.dataset.alarmregat;
        const num = e.target.dataset.membernum;

        checkData = {
            alarmRegAt: regAt,
            memberNum: num
        }


        memberAlarmCheckCount(checkData).then(result => {
            if (result == 1) {
                console.log('성공');
            } else {
                console.log('실패');
            }

        })
    }

});

async function memberAlarmCheckCount(checkData) {
    try {
        const url = "/alarm/alarmReadCheck";
        const config = {
            method: 'post',
            headers: {
                'Content-Type': 'application/json; charset=utf-8'
            },
            body: JSON.stringify(checkData)
        }
        const resp = await fetch(url, config);
        const result = await resp.text();
        return result;
    } catch (error) {
        console.log(error);
    }
}



//온오프 체크
document.getElementById('alarmSwitchCheckDefault').addEventListener('click', () => {
    let id = document.getElementById('alarmSwitchCheckDefault').value;
    let check = '';
    if (document.getElementById('alarmSwitchCheckDefault').checked == true) {
        check = 'Y';
    } else {
        check = 'N';
    }

    let checkData = {
        memberId: id,
        memberAlarmSystem: check
    }


    masChecker(checkData);
})


async function masChecker(checkData) {
    try {
        const url = '/alarm/systemOnOff';
        const config = {
            method: 'post',
            headers: {
                'Content-Type': 'application/json; charset=utf-8'
            },
            body: JSON.stringify(checkData)
        }
        await fetch(url, config);

    } catch (error) {
        console.log(error);
    }

}
