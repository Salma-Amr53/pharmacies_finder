<?php
$con= mysqli_connect("localhost","root","","pharmacy");
$isma_con= mysqli_connect("localhost","root","","ismailia-branch");
$nasr_con= mysqli_connect("localhost","root","","nasr-city_branch");
$dokki_con= mysqli_connect("localhost","root","","dokki-branch");



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
