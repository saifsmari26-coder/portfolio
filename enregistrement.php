<?php
$nump=$_POST["nump"];
$nom=$_POST["nom"];
$pr=$_POST["pr"];
$g=$_POST["g"];
$idville=$_POST["idville"];
require("cnx.php");
$req="select * from testeur where numPermis='$nump'";
$res=mysqli_query($con,$req) or die(mysqli_error($con));
if(mysqli_num_rows($res)!=0)
{echo "testeur deja inscrit";}
else {
    $req="insert into testeur values('$nump','$nom','$pr','$g','$idville')";
    mysqli_query($con,$req) and die("enregistrement fait avec succée");
}






?>