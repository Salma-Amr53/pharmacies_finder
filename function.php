<?php
$con= mysqli_connect("localhost","root","","pharmacy",3307);
$isma_con= mysqli_connect("localhost","root","","ismailia-branch",3307);
$nasr_con= mysqli_connect("localhost","root","","nasr-city_branch",3307);
$dokki_con= mysqli_connect("localhost","root","","dokki-branch",3307);



function check_login(){
if(empty($_SESSION['user'])){
    header("location:login.php");
    exit;
}


}


function display($var){


 echo "<pre>";
// print_r($_POST);
 print_r($var);
 echo "</pre>";

}

function get_branch_database($branch)
{
    global $isma_con, $nasr_con, $dokki_con;

    if($branch == "Ismailia")
    {
        return $isma_con;
    }
    elseif($branch == "Nasr City")
    {
        return $nasr_con;
    }
    elseif($branch == "Dokki")
    {
        return $dokki_con;
    }

    return null;
}
