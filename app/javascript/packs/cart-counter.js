var mapDiv;
var lineitem;
var valueCount;
mapDiv = document.querySelector(".line_items");
lineitem = mapDiv.dataset.lineitems;
lineitem = lineitem.split(", ");

for (let [m, j] of Object.entries(lineitem)) {
  document.getElementById(j + "-minus-btn").addEventListener("click", function(){
    valueCount = document.getElementById(j + "-quantity").value;
    valueCount--;
    document.getElementById(j + "-quantity").value = valueCount;
    if (valueCount == 0) {
      document.getElementById(j + "-minus-btn").setAttribute("disabled", "disabled");
    }
  })
  document.getElementById(j + "-plus-btn").addEventListener("click", function(){
    valueCount = document.getElementById(j + "-quantity").value;
    valueCount++;
    document.getElementById(j + "-quantity").value = valueCount;
  })
}
