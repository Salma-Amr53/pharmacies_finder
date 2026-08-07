
<?php

session_start();
require_once("function.php");
check_login();



$branch = $_SESSION['branch'];

if($branch == "Ismailia")
{
    $db = $isma_con;
}
elseif($branch == "Nasr City")
{
    $db = $nasr_con;
}
else
{
    $db = $dokki_con;
}
?>

<?php 

if($_POST){


$name = $_POST['name'];
$category = $_POST['category'];
$description = $_POST['description'];
$price = $_POST['price'];
$quantity=$_POST['quantity'];
$date=$_POST['expiration_date'];
$image = $_FILES['Image']['name']; // Get the uploaded image name

//$_FILES is a superglobal variable in PHP used to collect data about files uploaded to the server via an HTML form.


    // Temporary location of uploaded image
    $tmp_name = $_FILES['Image']['tmp_name'];

    // Move image to  images folder
    move_uploaded_file($tmp_name, "images/$branch/" . $image);


// Query To Database 
$query = "INSERT INTO medicines (`name`, `category`, `description`, `price`, `quantity`,`expiration_date` ,`image`) values ('$name', '$category ','$description' ,'$price', '$quantity','$date' , '$image')";

/// Inset Into Database 

$result = mysqli_query($db, $query);

if($result){

   $_SESSION['success'] = "Medicine added successfully!";
   header("location:Addition.php?success=1");
    exit;

}

else{

echo "<script> alert('Error adding medicine!') ; </script>";

}
}

if(isset($_SESSION['success']))
{
    echo "<script>
            alert('{$_SESSION['success']}');
          </script>";

    unset($_SESSION['success']);
}

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign_up</title>
    <link rel="stylesheet" href="css/style.css"/>
     <!-- Font Awesome CDN -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
 <link rel="stylesheet" href="CSS/all.css">
    <link rel="stylesheet" href="css/libs/animate.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.3.0/css/all.min.css">

</head>


<body>
    

<?php include_once("header.php"); ?>

<?php


if (isset($error)){
        echo "<div>". $error. "</div>";

}
?>

<main>




<form action="" class="add" method="POST" enctype="multipart/form-data">  
<h2 class="text-center wow  bounceInLeft"><b> Add Medicine </b>   <i class="fa-solid fa-pills"></i></h2> <br> 
<div class="wow flash bounceInLeft">
    <input type="text" name="name" placeholder="Medicine Name" required/><br>
    <input type="text" name="category" placeholder="Category " required/><br>
    <input type="text" name="description" placeholder="Description"required/><br>
    <input type="number" name="price" placeholder="Cost"required /><br>
    <input type="number" name="quantity" placeholder="quantity" required/><br>
    <input type="date" name="expiration_date" placeholder="Expiration Date"required/><br>
    <input type="file" name="Image" accept="image/*"> <br>
</div>   
    <button class="wow rollIn"type="submit">Add</button>

</form>
</main>
<?php include_once("footer.php"); ?>
   <script src="js/wow.min.js"></script>
   <script> new WOW().init(); </script>

</body>
</html>