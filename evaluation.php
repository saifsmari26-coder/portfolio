<?php
$nump=$_POST["nump"];
$idmodele=$_POST["idmodele"];
$sc=$_POST["sc"];
$co=$_POST["co"];
$conf=$_POST["conf"];
require("cnx.php");
$req1="select * from testeur where numPermis='$nump'";
$res1=mysqli_query($con,$req1) or die(mysqli_error($con));
$req2="select * from evaluation where numPermis='$nump' and idmodele='$idmodele'";
$res2=mysqli_query($con,$req2) or die(mysqli_error($con));
if(mysqli_num_rows($res1)==0)
{echo "testeur non inscrit ";}
elseif (mysqli_num_rows($res2)!=0) {
    echo "vous avez déja testé ce modéle  ";}
else {
    $dateTest=date("Y-m-d H:i:s");
    $req3="insert into questionnaire values('$nump','$idmodele','$dateTest','$sc','$co','$conf')"; 
    mysqli_query($con,$req3) and die("enregistrement fait avec succée");
}
?>