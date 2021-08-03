document.querySelector(".minus-btn").setAttribute("disabled", "disabled");
var valueCount;
document.querySelector(".plus-btn").addEventListener("click", function(){
  valueCount = document.getElementById("quantity").value;
  valueCount++;
  document.getElementById("quantity").value = valueCount;
  if (valueCount > 1) {
    document.querySelector(".minus-btn").removeAttribute("disabled");
    document.querySelector(".minus-btn").classList.remove("disabled");
  }
})
document.querySelector(".minus-btn").addEventListener("click", function(){
  valueCount = document.getElementById("quantity").value;
  valueCount--;
  document.getElementById("quantity").value = valueCount;
  if (valueCount == 1) {
    document.querySelector(".minus-btn").setAttribute("disabled", "disabled");
  }
})
