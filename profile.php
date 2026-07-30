<?php
session_start();
require_once("function.php");
check_login();

$user = $_SESSION['user'];

$first_letter = strtoupper(substr($user['username'], 0, 1));

$user_id = $user['id'];
$query = "SELECT * FROM purchases WHERE user_id='$user_id' ORDER BY purchase_date DESC";
$result = mysqli_query($con, $query);

if($result)
{
    $purchases = mysqli_fetch_all($result, MYSQLI_ASSOC);
}
else
{
    $purchases = [];
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profile</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

<?php include_once("header.php"); ?>

<main class="login">
    <div class="profile-box">

        <?php if (!empty($user['profile_pic'])): ?>
            <img src="uploads/<?php echo $user['profile_pic']; ?>" class="profile-pic">
        <?php else: ?>
            <div class="profile-pic-placeholder">
                <?php echo $first_letter; ?>
            </div>
        <?php endif; ?>

        <div class="profile-info">

            <p><span>UserName:</span> <?php echo $user['username']; ?></p>

            <p><span>Email:</span> <?php echo $user['email']; ?></p>

            <?php if (!empty($user['phone'])): ?>
                <p><span>Phone :</span> <?php echo $user['phone']; ?></p>
            <?php endif; ?>

            <?php if (!empty($user['full_name'])): ?>
                <p><span>Full Name:</span> <?php echo $user['full_name']; ?></p>
            <?php endif; ?>

            <?php if (!empty($user['date_of_birth'])): ?>
                <p><span>Birthday:</span> <?php echo $user['date_of_birth']; ?></p>
            <?php endif; ?>

            <div class="profile-actions">
                <a href="edit_profile.php" class="edit-btn">Edit Profile</a>
                <a href="delete_profile.php" class="delete-btn">Delete Profile</a>
            </div>

        </div>

    </div>

    <div class="profile-box profile-medicines">

        <h2>Purchase History</h2>

        <?php
        if(count($purchases) == 0)
        {
            echo "<p>You have not bought any medicines yet.</p>";
        }
        else
        {
            foreach($purchases as $purchase)
            {
                ?>
                <div class="display">
                    <img src="images/<?=$purchase['branch']?>/<?=$purchase['image']?>">
                    <div class="productdata">
                        <h3>Medicine: <?=$purchase['medicine_name']?></h3>
                        <h3>Branch: <?=$purchase['branch']?></h3>
                        <h3>Price: <?=$purchase['price']?> EGP</h3>
                        <h3>Quantity: <?=$purchase['quantity']?></h3>
                        <h3>Purchased on: <?=$purchase['purchase_date']?></h3>
                    </div>
                </div>
                <?php
            }
        }
        ?>

    </div>

</main>

<?php include_once("footer.php"); ?>

</body>
</html>