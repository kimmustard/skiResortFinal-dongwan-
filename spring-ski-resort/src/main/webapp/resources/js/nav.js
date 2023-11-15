window.onload = function(){
	
	setTimeout(()=> document.getElementById("hide").style.opacity=0,5000)
	setTimeout(()=> document.getElementById("ski-navbar").style.opacity=0.5,5000)
	if(!(document.getElementById('maintext1'))){
	
        document.getElementById("ski-blank").style.height="96px";
    }
}

document.getElementById("ski-navbar").addEventListener("mouseover",()=>{
    document.getElementById("ski-navbar").style.height="96px"
   
})
document.getElementById("ski-navbar").addEventListener("mouseout",()=>{
    document.getElementById("ski-navbar").style.height="0px"
   
   
 

})