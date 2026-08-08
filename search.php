<?php

session_start();
require_once("function.php");
check_login();

// Keep branch from URL or after submitting the form
$selectedBranch = $_POST['branch'] ?? ($_GET['branch'] ?? "All");

// Keep category after submitting the form
$selectedCategory = $_POST['category'] ?? "All";

// Keep search value
$searchValue = $_POST['searcher'] ?? "";

// Available databases
$allBranches = [
    "Ismailia" => $isma_con,
    "Nasr City" => $nasr_con,
    "Dokki" => $dokki_con
];

// Get categories from all databases
$categories = [];

foreach ($allBranches as $connection) {
    $categoryQuery = "SELECT DISTINCT category FROM medicines";
    $categoryResult = mysqli_query($connection, $categoryQuery);
    if($categoryResult)
    {
        while($row = mysqli_fetch_assoc($categoryResult))
        {
            $categories[] = $row['category'];
        }
    }
}

// Remove duplicate categories
$categories = array_unique($categories);

// Sort categories alphabetically
sort($categories);

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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
</head>
<body>
<?php include_once("header.php"); ?>
<main class="main-top wow jello">
<div class="search">
<form action="" method="POST" class="search-form">
<h3 class="wow flash">
    Looking for a specific medicine? Here you'll find all that you need!
</h3>
<br>
<div style="display:flex; gap:10px; align-items:center; flex-wrap:wrap;">
<input class="wow bounceInDown" type="search" name="searcher" placeholder="Search medicine..." value="<?= htmlspecialchars($searchValue) ?>">
<div filters class="filters">
<!-- Branch Filter -->
<select class="wow bounceInDown" name="branch">
<option value="All">All Branches</option>
<option value="Dokki" <?= $selectedBranch == "Dokki" ? "selected" : "" ?>>Dokki</option>
<option value="Ismailia" <?= $selectedBranch == "Ismailia" ? "selected" : "" ?>>Ismailia</option>
<option value="Nasr City"<?= $selectedBranch == "Nasr City" ? "selected" : "" ?>>Nasr City</option>
</select>
<!-- Category Filter -->
<select class="wow bounceInDown" name="category">
<option value="All">All Categories</option>
<?php foreach($categories as $category){ ?>
<option 
    value="<?= htmlspecialchars($category) ?>" <?= $selectedCategory == $category ? "selected" : "" ?>>
    <?= htmlspecialchars($category) ?>
</option>
<?php } ?>
</div>

</select>
<button class="wow bounceInDown" type="submit">Search</button>
</div>
</form>
<?php
if($_POST)
{
    $found = false;
    // Get selected filters
    $name = trim($_POST['searcher']);
    $selectedBranch = $_POST['branch'];
    $selectedCategory = $_POST['category'];
    /*
        Decide which databases to search
        If user chooses All -> search all branches
        Otherwise -> search only selected branch
    */

    if($selectedBranch == "All")
    {
        $branches = $allBranches;
    }
    else
    {
        $branches = [
            $selectedBranch => $allBranches[$selectedBranch]
        ];
    }
    foreach($branches as $branch => $connection)
    {
        /*
            Build query according to filters
        */
        $query = "SELECT * FROM medicines WHERE 1";
        // Medicine name filter
        if(!empty($name))
        {
            $query .= " AND name LIKE '%$name%'";
        }
        // Category filter
        if($selectedCategory != "All")
        {
            $query .= " AND category = '$selectedCategory'";
        }
        $result = mysqli_query($connection, $query);
        if($result && mysqli_num_rows($result) > 0)
        {
            $found = true;
            $products = mysqli_fetch_all($result, MYSQLI_ASSOC);
            foreach($products as $product)
            {

?>
<div class="display wow jello">
<img width="130" src="images/<?= $branch ?>/<?= htmlspecialchars($product['image']) ?>">
<div class="productdata wow jello">
<h3>
Name:
<?= htmlspecialchars($product['name']) ?>
</h3>
<h3>
Category:
<?= htmlspecialchars($product['category']) ?>
</h3>
<h3>
Description:
<?= htmlspecialchars($product['description']) ?>
</h3>
<h3>
Price:
<?= htmlspecialchars($product['price']) ?> EGP
</h3>

<h3>
Expiration date:
<?= htmlspecialchars($product['expiration_date']) ?>
</h3>
<h3 style="color:green;">
Available at:
<?= htmlspecialchars($branch) ?> Branch
</h3>
<form method="POST" action="buy.php">
<input type="hidden" name="medicine_name" value="<?= htmlspecialchars($product['name']) ?>">
<input type="hidden" name="branch" value="<?= htmlspecialchars($branch) ?>">
<input type="hidden" name="price" value="<?= htmlspecialchars($product['price']) ?>">
<input type="hidden" name="image" value="<?= htmlspecialchars($product['image']) ?>">
<button class="wow flipInX" type="submit">Buy</button>
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
if(isset($error))
{
echo "<div class='error'>".$error."</div>";
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

