// à developper
function verif() {
  ncin = document.getElementById("ncin").value;
  if (ncin.length != 8 || ncin[0] > "1") {
    alert("ncin non valide");
    return false;
  }
  eq = document.getElementById("eq").selectedIndex;
  d = document.getElementById("d").selectedIndex;
  if (eq == 0) {
    alert("svp selectionner un equipement");
    return false;
  }
  if (d == 0) {
    alert("svp selectionner un dureé");
    return false;
  }
}
