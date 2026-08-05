<?php

session_start();
require_once("function.php");
check_login();

?>



<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Search</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="CSS/all.css">
    <link rel="stylesheet" href="css/libs/animate.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.3.0/css/all.min.css">

    <!-- Font Awesome CDN -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<!-- Animate.css CDN (Required for WOW.js) -->
<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" /> -> -->
<!-- WOW.js Script CDN -->
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/wow/1.1.2/wow.min.js"></script> -->

</head>
<body>

<?php include_once("header.php"); ?>


<main class="main-top wow jello" >
    <div class="search">
       <form action="" method="POST" class="search-form ">
       <h3 class="wow flash"> Looking for a specific medicine? Here you'll find all  that you need! </h3> <br>
         <div   style="display:flex; gap:5px;">
         <input class="wow bounceInDown" type="search" name="searcher"  placeholder="Search..."> 
         <button class="wow bounceInDown" type="submit"> Search </button>
         </div>

        </form>
    

<?php
if($_POST){
    $name = $_POST['searcher'];
   $branches=["Ismailia"=>$isma_con, "Nasr City" => $nasr_con,"Dokki"=>$dokki_con ];

   
//bool to check if med was found
$found = false;

//foreach($arrayName as $key => $value)
foreach ($branches as $branch => $connection)
{

    $query = "SELECT * FROM medicines  WHERE name LIKE '%$name%'";
    $result = mysqli_query($connection, $query);

    if(mysqli_num_rows($result) > 0)
    {
        $found = true;
        $array = mysqli_fetch_all($result, MYSQLI_ASSOC);
        foreach($array as $product)
        {
            // display($array);
            ?>
            
            <div class="display wow jello">

                <img width="130" src="images/<?=$branch?>/<?=$product['image']?>">

                <div class="productdata wow jello">

                    <h3>Name: <?=$product['name']?></h3>
                    <h3>Category: <?=$product['category']?></h3>
                    <h3>Description: <?=$product['description']?></h3>
                    <h3>Price: <?=$product['price']?> EGP</h3>
                    <h3>Quantity: <?=$product['quantity']?></h3>
                    <h3>Expiration date: <?=$product['expiration_date']?> </h3>
                    <h3 style="color:green;"> Available at: <?=$branch?> Branch </h3>
                    
                     
                    <form method="POST" action="buy.php">
                        <input type="hidden" name="medicine_name" value="<?=$product['name']?>">
                        <input type="hidden" name="branch" value="<?=$branch?>">
                        <input type="hidden" name="price" value="<?=$product['price']?>">
                        <input type="hidden" name="image" value="<?=$product['image']?>">
                        <button class="wow flipInX" type="submit"> Buy </button>
                    </form>

                </div>

            </div>
            <?php
        }
    }
}

if(!$found)
{
     $error = "Sorry, Medicine not found";
}


}

if(isset($error)){
  echo "<div class='error'>". $error. "</div>";
}
?>
</div>
</main>




<?php include_once("footer.php"); ?>

 <script src="js/wow.min.js"></script>
              <script>
new WOW().init();


</script>

    
</body>
</html>