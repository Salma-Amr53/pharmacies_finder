<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);
session_start();
require_once("function.php");
check_login();

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

<main class="login">

    <!-- Hero -->

    <div class="search">
        <!-- <div class="home"> -->
        <div class="profile-medicines">
            <h2>Find Your Medicine with Ease</h2>
            <p>
                Search medicines across multiple pharmacy branches,
                compare availability, and save time before visiting a pharmacy.
            </p>
            <br>
            <img src="images/pharmacies.jpg"
                 alt="Pharmacy"
                 style="width:260px;max-width:100%;">

            <div class="profile-actions"
                 style="justify-content:center;margin-top:25px;">

                <a href="search.php" class="edit-btn">
                    <i class="fa-solid fa-magnifying-glass"></i>
                    Search Medicine
                </a>

                <a href="#about" class="delete-btn">
                    <i class="fa-solid fa-circle-info"></i>
                    Learn More
                </a>
            </div>
        </div>
    </div>


    <!-- About -->

    <div class="search" id="about">

        <div class="profile-medicines">

            <h2>About Pharmacies Finder</h2>

            <p>
                Pharmacies Finder helps users search for medicines across multiple
                pharmacy branches in one place.
                Instead of visiting several pharmacies,
                simply search once and instantly discover
                where your medicine is available.
            </p>
        </div>
    </div>

    <!-- How It Works -->

    <div class="search">

        <div class="profile-medicines">

            <h2>How It Works</h2>

            <div class="display">

                <div class="profile-pic-placeholder">
                    <i class="fa-solid fa-magnifying-glass"></i>
                </div>

                <div class="productdata">
                    <h3><b>Search</b></h3>
                    <p>Enter the medicine name you're looking for.</p>
                </div>

            </div>

            <div class="display">

                <div class="profile-pic-placeholder">
                    <i class="fa-solid fa-hospital"></i>
                </div>

                <div class="productdata">
                    <h3><b>Compare</b></h3>
                    <p>Compare pharmacies where your medicine is currently available.</p>
                </div>

            </div>

            <div class="display">

                <div class="profile-pic-placeholder">
                    <i class="fa-solid fa-location-dot"></i>
                </div>

                <div class="productdata">
                    <h3><b>Visit</b></h3>
                    <p>Visit the pharmacy that best suits your location and needs.</p>
                </div>

            </div>

        </div>

    </div>


    <!-- Features -->

    <div class="search">

        <div class="profile-medicines">

            <h2>Why Choose Us?</h2>

            <div class="display">

                <div class="profile-pic-placeholder">
                    <i class="fa-solid fa-bolt"></i>
                </div>

                <div class="productdata">
                    <h3><b>Fast Search</b></h3>
                    <p>Find medicines within seconds using our optimized search system.</p>
                </div>

            </div>

            <div class="display">

                <div class="profile-pic-placeholder">
                    <i class="fa-solid fa-pills"></i>
                </div>

                <div class="productdata">
                    <h3><b>Medicine Availability</b></h3>
                    <p>Check medicine availability across different pharmacy branches.</p>
                </div>

            </div>

            <div class="display">

                <div class="profile-pic-placeholder">
                    <i class="fa-solid fa-mobile-screen-button"></i>
                </div>

                <div class="productdata">
                    <h3><b>Easy To Use</b></h3>
                    <p>A clean and user-friendly interface for all users.</p>
                </div>

            </div>

            <div class="display">

                <div class="profile-pic-placeholder">
                    <i class="fa-solid fa-shield-heart"></i>
                </div>

                <div class="productdata">
                    <h3><b>Reliable Information</b></h3>
                    <p>View trusted medicine availability from participating pharmacy branches.</p>
                </div>

            </div>

        </div>

    </div>


    <!-- Customer Reviews -->

    <div class="search">

        <div class="profile-medicines">

            <h2>Customer Reviews</h2>

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
        <!-- FAQ -->

    <div class="search">

        <div class="profile-medicines">

            <h2>Frequently Asked Questions</h2>

            <div class="display">

                <div class="profile-pic-placeholder">
                    <i class="fa-solid fa-circle-question"></i>
                </div>

                <div class="productdata">
                    <h3><b>How do I search for a medicine?</b></h3>
                    <p>
                        Go to the Search page, enter the medicine name,
                        then click Search.
                    </p>
                </div>

            </div>

            <div class="display">

                <div class="profile-pic-placeholder">
                    <i class="fa-solid fa-user"></i>
                </div>

                <div class="productdata">
                    <h3><b>Do I need an account?</b></h3>
                    <p>No. Anyone can search for medicines.</p>
                </div>

            </div>

            <div class="display">

                <div class="profile-pic-placeholder">
                    <i class="fa-solid fa-mobile-screen"></i>
                </div>

                <div class="productdata">
                    <h3><b>Can I use the website on my phone?</b></h3>
                    <p>
                        Yes. The website is fully responsive and works on
                        all devices.
                    </p>
                </div>

            </div>

            <div class="display">

                <div class="profile-pic-placeholder">
                    <i class="fa-solid fa-shield-heart"></i>
                </div>

                <div class="productdata">
                    <h3><b>Is medicine availability always updated?</b></h3>
                    <p>
                        Availability depends on the information provided by
                        participating pharmacy branches.
                    </p>
                </div>

            </div>

        </div>

    </div>


    <!-- Call To Action -->

    <div class="search">

        <div class="profile-medicines">

            <h2>Ready to Find Your Medicine?</h2>

            <p>
                Save time and check medicine availability before
                visiting a pharmacy.
            </p>

            <div class="profile-actions"
                 style="justify-content:center; margin-top:25px;">

                <a href="search.php" class="edit-btn">
                    <i class="fa-solid fa-arrow-right"></i>
                    Search Now
                </a>

            </div>

        </div>

    </div>

</main>


<?php include_once("footer.php"); ?>
<script src="js/wow.min.js"></script>
<script> new WOW().init(); </script>

</body>
</html>