<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);
session_start();
require_once("function.php");
// check_login();

$query = "SELECT reviews.*, users.username, users.profile_pic
          FROM reviews
          JOIN users
          ON reviews.user_id = users.id
          ORDER BY reviews.created_at DESC";

$result = mysqli_query($con, $query);
$reviews = mysqli_fetch_all($result, MYSQLI_ASSOC);
?>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Home | Pharmacies Finder</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/libs/animate.css">
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.3.0/css/all.min.css">
</head>
<body>
<?php include_once("header.php"); ?>
<main class="home-page wow fadeInDown">
<div class="home ">
    <div class="home-content wow slideInDown">
        <div class="home-text wow slideInLeft ">
            <h1 >Find Your Medicine with Ease</h1>
            <p>
                Search medicines across multiple pharmacy branches,
                compare availability, and save time before visiting a pharmacy.
            </p>
            <div class="home-buttons">
                <a href="search.php" class="btn-primary">
                    <i class="fa-solid fa-magnifying-glass"></i>
                    Search Medicine
                </a>
                <!-- <a href="#about" class="btn-secondary">
                    <i class="fa-solid fa-circle-info"></i>
                    Learn More
                </a> -->
            </div>
        </div>
        <div class="home-image">
            <img src="images/pharmacies.jpg" alt="Pharmacy">
        </div>
    </div>
</div>
<!-- ==========================
        Features
=========================== -->

<div class="features">
    <div class="section-content">
        <h2 class="wow rotateIn" >Why Choose Us?</h2>
        <div class="cards wow flash">
            <div class="card">
                <div class="icon">
                    <i class="fa-solid fa-bolt"></i>
                </div>
                <h3>Fast Search</h3>
                <p>
                    Find medicines within seconds using our optimized search system.
                </p>
            </div>
            <div class="card">
                <div class="icon">
                    <i class="fa-solid fa-pills"></i>
                </div>
                <h3>Medicine Availability</h3>
                <p>
                    Check medicine availability across different pharmacy branches.
                </p>
            </div>
            <div class="card">
                <div class="icon">
                    <i class="fa-solid fa-mobile-screen-button"></i>
                </div>
                <h3>Easy To Use</h3>
                <p>
                    A clean and user-friendly interface for all users.
                </p>
            </div>
            <div class="card">
                <div class="icon">
                    <i class="fa-solid fa-shield-heart"></i>
                </div>
                <h3>Reliable Information</h3>
                <p>
                    View trusted medicine availability from participating pharmacy branches.
                </p>
            </div>
        </div>
    </div>
</div>

<!-- ==========================
        Customer Reviews
=========================== -->

<div class="reviews">
    <div class="section-content wow bounce">
        <h2 class="wow slideInLeft"> Customer Reviews</h2>
        <?php foreach($reviews as $review){ ?>
        <div class="display">
            <?php if(!empty($review['profile_pic'])){ ?>
                <img src="uploads/<?=$review['profile_pic']?>">
            <?php } else { ?>
                <div class="profile-pic-placeholder">
                    <?= strtoupper(substr($review['username'],0,1)); ?>
                </div>
            <?php } ?>
            <div class="productdata">
                <h3><b><?=$review['username']?></b></h3>
                <p><?=$review['review']?></p>
                <small><?=$review['created_at']?></small>
            </div>
        </div>
        <?php } ?>
    </div>
</div>
<!-- ==========================
        FAQ
=========================== -->

<div class="faq">
    <div class="section-content wow flip">
        <h2 class="wow rotateInUpLeft">Frequently Asked Questions</h2>
        <div class="faq-item">
            <h3>
                <i class="fa-solid fa-circle-question"></i>
                How do I search for a medicine?
            </h3>
            <p>
                Go to the Search page, enter the medicine name, then click Search.
            </p>
        </div>
        <!-- <div class="faq-item">
            <h3>
                <i class="fa-solid fa-circle-question"></i>
                Do I need an account?
            </h3>
            <p>
                No. Anyone can search for medicines.
            </p>
        </div> -->
        <div class="faq-item">
            <h3>
                <i class="fa-solid fa-circle-question"></i>
                Can I use the website on my phone?
            </h3>
            <p>
                Yes. The website is fully responsive and works on all devices.
            </p>
        </div>
        <div class="faq-item">
            <h3>
                <i class="fa-solid fa-circle-question"></i>
                Is the medicine availability always updated?
            </h3>
            <p>
                Availability depends on the information provided by participating pharmacy branches.
            </p>
        </div>
    </div>
</div>

<!-- ==========================
        Call To Action
=========================== -->

<div class="cta">
    <div class="section-content wow fadeInUpBig ">
        <h2>Ready to Find Your Medicine?</h2>
        <p>
            Save time and check medicine availability before visiting a pharmacy.
        </p>
        <a href="search.php" class="btn-primary">
            <i class="fa-solid fa-arrow-right"></i>
            Search Now
        </a>
    </div>
</div>

</main>


<?php include_once("footer.php"); ?>
<script src="js/wow.min.js"></script>
<script> new WOW().init(); </script>

</body>
</html>