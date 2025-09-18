<?php
$ncin=$_POST['ncin'];
$eq=$_POST['eq'];
$con=mysqli_connect("localhost","root","","bdapp3");
$req1="select * from location where ref='$eq' and nccinClient='$ncin'";
$res1=mysqli_query($con,$req1);
$req2="select * from equipement where ref='$eq' and disponible ='O'";
$res2=mysqli_query($con,$req2);
if(mysqli_num_rows($res1)==0)
{
    echo "pas de location pour ce client";
}
else if (mysqli_num_rows($res2)!=0) {
    echo "equipemnt deja retourné"

    }

else {
    $req="update equipement set disponible='O' where ref='$eq'";
    mysqli_query($con,$req) and die("equipement fait avec succée");
}



?>