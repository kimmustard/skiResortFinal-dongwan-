window.onload = function(){
	
	setTimeout(()=> document.getElementById("hide").style.opacity=0,5000)
	setTimeout(()=> document.getElementById("navbar").style.opacity=0.5,5000)
	
}

document.getElementById("navbar").addEventListener("mouseover",()=>{
    document.getElementById("navbar").style.height="96px"
   
})
document.getElementById("navbar").addEventListener("mouseout",()=>{
    document.getElementById("navbar").style.height="0px"
   
   
 

})