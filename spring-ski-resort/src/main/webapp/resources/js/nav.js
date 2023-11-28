window.onload = function () {


    setTimeout(() => document.getElementById("ski-navbar").style.opacity = 0.5, 5000)
    if (!(document.getElementById('maintext1'))) {

        document.getElementById("ski-navbar").style.opacity = 0.5;
    }
  


    weatherSearch().then(weatherInfo => {
        if (document.getElementById("innerItem2") == null) {
            return;
        }
        /*
        regionNum; //지역번호
        weatherHighTemp; // 최고온도 (지원안함)
        weatherLowTemp; // 최저온도(지원안함)
        weatherTemp; // 현재기온
        weatherSkyStatus; // 하늘 상태 (1맑음 2구름조금 3구름많음 4흐림)
        weatherRainStatus; //강수형태 (0없음,1비,2눈/비,3눈,4소나기)
        weatherAmount; // 강수량
        weatherPer; //강수량
        weatherDate; // 마지막 갱신 날짜
        weatherTime;	// 마지막 갱신 시간
        */
        console.log(weatherInfo.regionNum); 
        const weatherDate = weatherInfo.weatherDate.slice(0,4)+"년"+weatherInfo.weatherDate.slice(4,6)+"월"+weatherInfo.weatherDate.slice(6,8)+"일";
        var week_array = new Array('일', '월', '화', '수', '목', '금', '토');
        var today_num = new Date().getDay();
        const weatherTime = weatherInfo.weatherTime.slice(0,2)+":"+ weatherInfo.weatherTime.slice(2,4);
        document.getElementById("innerItem1").innerText+=weatherDate+"["+week_array[today_num]+"]"+weatherTime+"갱신";
        document.getElementById("innerItem2");
        document.getElementById("innerItem2");
        document.getElementById("innerItem2");
      
     
    
    })



}

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

document.getElementById("ski-navbar").addEventListener("mouseover", () => {
    document.getElementById("ski-navbar").style.height = "96px"

})
document.getElementById("ski-navbar").addEventListener("mouseout", () => {
    document.getElementById("ski-navbar").style.height = "0px"

})
