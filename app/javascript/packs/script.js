var valueCount;

document.querySelector(".plus-btn").addEventListener("click", function(){
  valueCount = document.getElementById("line_item_quantity").value;
  valueCount++;
  document.getElementById("line_item_quantity").value = valueCount;
})

document.querySelector(".minus-btn").addEventListener("click", function(){
  valueCount = document.getElementById("line_item_quantity").value;
  valueCount--;
  document.getElementById("line_item_quantity").value = valueCount;
  if (valueCount == 0) {
    document.querySelector(".minus-btn").setAttribute("disabled", "disabled");
  }
})
