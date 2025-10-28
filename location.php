<?php
$ncin=$_POST['ncin'];
$eq=$_POST['eq'];
$d=$_POST['d'];

$con=mysqli_connect("localhost","root","","bdapp3");


$req1="select * from client where Ncin='$ncin'";
$res1=mysqli_query($con,$req1);

if(mysqli_num_rows($res1)==0){
    echo "Ncin inexistant";
}
else {
   
    $req2="select * from equipement where ref='$eq' and disponible='O'";
    $res2=mysqli_query($con,$req2);

    if(mysqli_num_rows($res2)==0){
        echo "Equipement non disponible";
    }
    else {
        
        $dateloc=date("Y-m-d H:i:s");
        $dateSec=strtotime($dateloc) + $d*3600;
        $dateRet=date("Y-m-d H:i:s",$dateSec);

        
        $req3="insert into location values('$ncin','$eq','$dateloc','$dateRet')";
        mysqli_query($con,$req3);

     
        $req4="update equipement set disponible='N' where ref='$eq'";
        mysqli_query($con,$req4);

        echo "Location faite avec succès";
    }
}
?>
