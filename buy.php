<?php
session_start();
require_once("function.php");
check_login();

if($_POST)
{
    $medicine_name = $_POST['medicine_name'];
    $branch = $_POST['branch'];
    $price = $_POST['price'];
    $quantity = $_POST['quantity'];
    $image = $_POST['image'];
    $user_id = $_SESSION['user']['id'];
    $date = date("Y-m-d H:i:s");

    $query = "INSERT INTO purchases (`user_id`,`medicine_name`,`branch`,`price`,`quantity`,`image`,`purchase_date`)
              VALUES ('$user_id','$medicine_name','$branch','$price','$quantity','$image','$date')";

    $result = mysqli_query($con, $query);
}

header("Location: search.php");
exit;
?>