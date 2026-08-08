<?php
session_start();
require_once("function.php");

if ($_POST) {

    $email = trim($_POST['email']);
    $password = trim($_POST['password']);

    if (!empty($email) && !empty($password)) {

        $query = "SELECT * FROM users WHERE email='$email' AND password='$password'";
        $result = mysqli_query($con, $query);

        if (mysqli_num_rows($result) > 0) {

            $row = mysqli_fetch_assoc($result);
            $_SESSION['user'] = $row;

            header("Location: profile.php");
            exit;

        } else {
            $error = "Sorry, your email or password is incorrect.";
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
    <title>Login</title>
    <link rel="stylesheet" href="css/style.css">
     <link rel="stylesheet" href="CSS/all.css">
    <link rel="stylesheet" href="css/libs/animate.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.3.0/css/all.min.css">


</head>
<body>

<?php include_once("header.php"); ?>

<main class="login">

   

    <form method="POST" class="login-form">

        <h2 class="wow bounceIn" > Login</h2>

         <?php
              if (isset($error)) {
                echo "<div class='error'>$error</div>";
               }
         ?>

        <input class="wow bounceIn " type="email" name="email" placeholder="Email">

        <input class="wow bounceIn " type="password" name="password" placeholder="Password">

        <button  class="wow flipInX type="submit">Login</button>

        <p class="wow flash">
            Don't have an account?
            <a href="signup.php">Sign Up</a>
        </p>

    </form>

</main>

<?php include_once("footer.php"); ?>
          <script src="js/wow.min.js"></script>
   <script> new WOW().init(); </script>


</body>
</html>