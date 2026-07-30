<?php

require_once("function.php");

if ($_POST) {

    $username = trim($_POST['username']);
    $email = trim($_POST['email']);
    $userpass = trim($_POST['password']);
    $date = date("Y-m-d H:i:s");

    if (!empty($username) && !empty($email) && !empty($userpass)) {

        $query = "INSERT INTO users (`username`,`email`,`password`,`date`)
                  VALUES ('$username','$email','$userpass','$date')";

        $result = mysqli_query($con, $query);

        if ($result) {
            header("Location: login.php");
            exit;
        } else {
            $error = "Something went wrong.";
        }

    } else {
        $error = "Please fill in all fields.";
    }
}

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up</title>
    <link rel="stylesheet" href="css/style.css">
         <link rel="stylesheet" href="CSS/all.css">
    <link rel="stylesheet" href="css/libs/animate.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.3.0/css/all.min.css">
</head>
<body>

<?php include_once("header.php"); ?>

<main class="login">
    <form class="signup-form" method="POST">

        <h2>Sign Up</h2>

        <?php
        if (isset($error)) {
            echo "<p class='error'>$error</p>";
        }
        ?>

        <input type="text" name="username" placeholder="Username">
        <input type="email" name="email" placeholder="Email">
        <input type="password" name="password" placeholder="Password">

        <button type="submit">Sign Up</button>

        <p>
            Already have an account?
            <a href="login.php">Login</a>
        </p>

    </form>
</main>

<?php include_once("footer.php"); ?>
 <script src="js/wow.min.js"></script>
   <script> new WOW().init(); </script>

</body>
</html>