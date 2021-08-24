function myFunction() {
    console.log('lago')
    var menu_hamburger = document.getElementById("myLinks");
    if (menu_hamburger.style.display === "block") {
        menu_hamburger.style.display = "none";
    } else {
        menu_hamburger.style.display = "block";
    }
}

const menuIcon = document.querySelector('#icon-menu');
menuIcon.addEventListener("click", myFunction);
