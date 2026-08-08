<?php
session_start();
require_once("function.php");

if(!isset($_SESSION['user']))
{
    header("Location: login.php");
    die;
}

$user = $_SESSION['user'];

if(isset($_POST['confirm']))
{
    $query = "delete from users where id='".$user['id']."'";
    mysqli_query($con, $query);

    session_destroy();
    header("Location: signup.php");
    die;
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delete Profile</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

<?php include_once("header.php"); ?>

<main class="login">
    <div class="profile-box profile-medicines">

        <h2>Delete Account</h2>

        <p>Are you sure you want to delete your account? This cannot be undone.</p>

        <form method="post">
            <button type="submit" name="confirm" class="delete-btn full-width">Yes, Delete My Account</button>
        </form>

        <p>
            <a href="profile.php">Cancel</a>
        </p>

    </div>
</main>

<?php include_once("footer.php"); ?>

</body>
</html>