<?php
$ncin=$_POST['ncin'];
$eq=$_POST['eq'];
$d=$_POST['d'];
$con=mysqli_connect("localhost","root","","bdapp3");
$req1="select * from client where Ncin='$ncin'";
$res1=mysqli_query($con,$req1);
$req2="select * from equipement where ref='$eq' and disponible='N'";
$res2=mysqli_query($con,$req2);
if(mysqli_num_rows($res1)==0)
echo "ncin inexistant";
elseif (mysqli_num_rows($res2)!=0) {
    echo "equipement non disponible";
}
else {
    $dateloc=date("Y-m-d H:i:s");
    $dateSec=(strtotime($dateloc)+$d*3600);
    $dateRet=date("Y-m-d H:i:s",$dateSec);
    $req3="insert into location values('$ncin','$eq','$dateloc','$dateRet')";
    mysqli_query($con,$req3); 
    if(mysqli_affected_rows($con)!=-1){
        $req4="update equipement set Disponible='N' where ref='$eq'";
        mysqli_query($con,$req4) and die("location fait     avec succé");
    }
}
?>