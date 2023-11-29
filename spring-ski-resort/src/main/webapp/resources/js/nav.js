window.onload = function () {
    getTwoNotice().then(notice =>{
        console.log(notice);
        for(let i = 0; i<=1; i++){
        document.getElementById('notice-box').innerHTML+= '<ul><li><span class="notice-reg">'+notice[i].noticeRegAt+'</span><a class="notice-title" href="/notice/detail?noticeNum='+notice[i].noticeNum+'">'+notice[i].noticeTitle+'</a></li></ul>'
        }
    });

    setTimeout(() => document.getElementById("ski-navbar").style.opacity = 0.5, 5000)
    if (!(document.getElementById('maintext1'))) {

        document.getElementById("ski-navbar").style.opacity = 0.5;
    }else{
        load();

    }  
    
    }





    const timer = ms => new Promise(res=>setTimeout(res,ms))
    async function load(){
    for(let i =0;;i++){
        if(i==10){
            i=0;
        }
        weatherListSearch().then(weatherInfo => {
            console.log(weatherInfo);
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
               0 홍천읍
               1 화촌면
               2 두촌면
               3 내촌면
               4 서석면
               5 영귀미면
               6 남면
               7 서면
               8 북방면
               9 내면
            */
                const weatherDate = weatherInfo[i].weatherDate.slice(0,4)+"년"+weatherInfo[i].weatherDate.slice(4,6)+"월"+weatherInfo[i].weatherDate.slice(6,8)+"일";
                var week_array = new Array('일', '월', '화', '수', '목', '금', '토');
                var region_grand_child = new Array('홍천읍', '화촌면', '두촌면', '내촌면', '서석면', '영귀미면', '남면','서면','북방면','내면');
                var today_num = new Date().getDay();
                const weatherTime = weatherInfo[i].weatherTime.slice(0,2)+":"+ weatherInfo[i].weatherTime.slice(2,4);
                let weatherStatus =  weatherInfo[i].weatherRainStatus;
                let Temp =  weatherInfo[i].weatherTemp;
    
                if(weatherStatus=="없음"){
                  weatherStatus=weatherInfo[i].weatherSkyStatus;
                }
                let weathericon = "";
                if(weatherStatus=="맑음"){
                    weathericon="brightness-high";
                }else if(weatherStatus=="구름조금"){
                    weathericon="cloud-sun";
                }else if(weatherStatus=="구름많음"){
                    weathericon="cloud";
                }else if(weatherStatus=="흐림"){
                    weathericon="cloud-haze";
                }else if(weatherStatus=="비"){
                    weathericon="cloud-drizzle";
                }else if(weatherStatus=="눈/비"){
                    weathericon ="cloud-sleet";
                }else if(weatherStatus=="소나기"){
                    weathericon ="cloud-rain-heavy";
                }else{
                    weathericon = "cloud-snow";
                }
    
    
                document.getElementById("innerItem2").innerHTML= "<span class='weather-area'>"+region_grand_child[i]+" 날씨</span><br><br>"+weatherDate+"["+week_array[today_num]+"]"+weatherTime+"갱신";
                document.getElementById("innerItem3").innerHTML= '<i class="weathericon bi bi-'+weathericon+'"></i><span class="weather-info">'+weatherStatus+Temp+'°C'+'</span>' ;
                document.getElementById("innerItem1");
                document.getElementById("innerItem4");
            
            });
         
        await timer(10000);
    }
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

//날씨리스트 불러오기
async function weatherListSearch() {

    try {
        const url = "/weather/list";
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
//공지 두개 받아오기
async function getTwoNotice(){
    try {
        const url = "/notice/getTwoNotice";
        const config = {
            method: 'get'
        };
        const resp = await fetch(url, config);
        const result = await resp.json();
        console.log(result);
        return result;
    } catch (error) {
        console.log(error);
    }
}



document.getElementById("ski-navbar-brand").addEventListener("mouseover", (e) => {
   e.target.querySelector("span").style.width = "100%";

})

document.getElementById("ski-navbar-brand").addEventListener("mouseout", (e) => {
   
	e.target.querySelector("span").style.width = "0px";
})
const navLinks = document.querySelectorAll(".ski-nav-link");

navLinks.forEach(link => {
    link.addEventListener("mouseover", (e) => {
        e.target.querySelector("span").style.width = "100%";
    });
    
    link.addEventListener("mouseout", (e) => {
        e.target.querySelector("span").style.width = "0%";
    });
      
});











