<?php

session_start();
require_once("function.php");
check_login();

$branches = [
    [
        "name"    => "Dokki",
        "address" => "15 Tahrir Street, Dokki, Giza, Egypt",
        "phone"   => "0223456789",
        "image"   => "images/pharma1.jpg",
        "tint"    => "rgba(13,110,253,.75)",   // blue
    ],
    [
        "name"    => "Ismailia",
        "address" => "22 Mohamed Ali Street, Ismailia, Egypt",
        "phone"   => "0643456789",
        "image"   => "images/pharma2.jpg",
        "tint"    => "rgba(32,201,151,.75)",   // green
    ],
    [
        "name"    => "Nasr City",
        "address" => "9 Abbas El Akkad Street, Nasr City, Cairo, Egypt",
        "phone"   => "0224567890",
        "image"   => "images/pharma3.webp",
        "tint"    => "rgba(255,145,0,.75)",    // orange
    ],
];
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pharmacies</title>
    <link rel="stylesheet" href="css/style.css">
   <link rel="stylesheet" href="css/css/all.css">

    <style>
        .branches-hero{
            text-align:center;
            padding:45px 20px 10px;
        }
        .branches-hero h1{
            color:#0d6efd;
            margin-bottom:10px;
        }
        
        .branches-grid{
            display:grid;
            grid-template-columns:repeat(auto-fit,minmax(300px,1fr));
            gap:30px;
            padding:35px 40px 60px;
        }
        .branch-card{
            position:relative;
            min-height:280px;
            border-radius:16px;
            overflow:hidden;
            background-size:cover;
            background-position:center;
            box-shadow:0 8px 20px rgba(0,0,0,.15);
            transition:.3s;
        }
        .branch-card:hover{
            transform:translateY(-8px);
        }
        .branch-card-overlay{
            position:absolute;
            inset:0;
            display:flex;
            flex-direction:column;
            justify-content:flex-end;
            padding:25px;
            color:#fff;
        }
        .branch-card-overlay h2{
            font-size:26px;
            margin-bottom:12px;
        }
        .branch-card-overlay i{
            width:20px;
            margin-right:8px;
        }
        .branch-card-overlay .btn-primary{
            margin-top:15px;
            display:inline-block;
            width:fit-content;
        }
    </style>
</head>
<body>
<?php include_once('header.php'); ?>

<main class="main-top">

    <section class="branches-hero" style="width:100%;">
        <h1>Our Pharmacy Branches</h1> 
    </section>

    <div class="branches-grid" style="width:100%;">
        <?php foreach ($branches as $branch) { ?>
            <div class="branch-card" style="background-image:url('<?= $branch['image'] ?>');">
                <div class="branch-card-overlay" style="background:linear-gradient(180deg, rgba(0,0,0,0) 0%, <?= $branch['tint'] ?> 100%);">
                    <h2><?= htmlspecialchars($branch['name']) ?> Branch</h2>
                    <p><i class="fa-solid fa-location-dot"></i><?= htmlspecialchars($branch['address']) ?></p>
                    <p><i class="fa-solid fa-phone"></i><?= htmlspecialchars($branch['phone']) ?></p>
                    <a class="btn-primary" href="search.php">View Medicines</a>
                </div>
            </div>
        <?php } ?>
    </div>

</main>

<?php include_once('footer.php'); ?>
</body>
</html>
