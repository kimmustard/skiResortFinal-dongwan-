window.onload = function () {

    setTimeout(() => document.getElementById("hide").style.opacity = 0, 5000)
    setTimeout(() => document.getElementById("ski-navbar").style.opacity = 0.5, 5000)
    if (!(document.getElementById('maintext1'))) {

        document.getElementById("ski-blank").style.height = "96px";
        document.getElementById("hide").style.height = "0px";
        document.getElementById("ski-navbar").style.opacity = 0.5;
    }
    if ((document.getElementById('notice-container'))) {
        document.getElementById("ski-blank").style.height = "0px";
    }
    if ((document.getElementById('MemberIdCheck'))) {
        document.getElementById("ski-blank").style.height = "0px";
    }
    if ((document.getElementById('hotelReservePeople'))) {
        document.getElementById("ski-blank").style.height = "0px";
    }


    weatherSearch().then(result => {
        if (document.getElementById("innerItem2") == null) {
            return;
        }
        const obj = JSON.stringify(result.regionNum);
        console.log(obj.regionNum);
        document.getElementById("innerItem2").innerText = obj.regionNum;
    })



}

document.getElementById("ski-navbar").addEventListener("mouseover", () => {
    document.getElementById("ski-navbar").style.height = "96px"

})
document.getElementById("ski-navbar").addEventListener("mouseout", () => {
    document.getElementById("ski-navbar").style.height = "0px"




})

//날씨정보 불러오기
async function weatherSearch() {

    try {
        const url = "/weather/default";
        const config = {
            method: 'get'
        };
        const resp = await fetch(url, config);
        const result = await resp.json();
        return result;
    } catch (error) {
        console.log(error);
    }

}