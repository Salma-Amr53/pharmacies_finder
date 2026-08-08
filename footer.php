<footer>
    
   <p>&copy; <?php echo date("Y"); ?> Pharmacies Finder | NTI Full Stack PHP Project. All Rights Reserved.</p>


</footer>

<script>
const menuBtn = document.getElementById("menuBtn");
const navbar = document.getElementById("navbar");

if(menuBtn && navbar){

menuBtn.onclick = function(){

    navbar.classList.toggle("active");

    if(navbar.classList.contains("active")){
        menuBtn.innerHTML="✖";
    }
    else{
        menuBtn.innerHTML="☰";
    }

};


document.addEventListener("click",function(e){

    if(!navbar.contains(e.target) && !menuBtn.contains(e.target)){

        navbar.classList.remove("active");
        menuBtn.innerHTML="☰";

    }

});

}
</script>
</body>
</html>