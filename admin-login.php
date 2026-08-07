<?php
session_start();
require_once("function.php");

if ($_POST) {

    $email = trim($_POST['email']);
    $password = trim($_POST['password']);
    $branch=trim($_POST['branch']);

    if (!empty($email) && !empty($password)) {

//     if ($branch == "Ismailia") {
//     $db = $isma_con;
//      }

//     elseif ($branch == "Nasr City") {
//     $db = $nasr_con;
// }
// elseif ($branch == "Dokki") {
//     $db = $dokki_con;
// }
$db = get_branch_database($branch);
        $query = "SELECT * FROM employees WHERE email='$email' AND password='$password'";
        $result = mysqli_query($db, $query);

        if (mysqli_num_rows($result) > 0) {

            $row = mysqli_fetch_assoc($result);
            $_SESSION['user'] = $row;
            $_SESSION['branch'] = $branch;

            header("Location: Addition.php");
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
    <title>Admin</title>
    <link rel="stylesheet" href="css/style.css">
   <!-- Font Awesome CDN -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
 <link rel="stylesheet" href="CSS/all.css">
    <link rel="stylesheet" href="css/libs/animate.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.3.0/css/all.min.css">


</head>
<body>

<?php include_once("header.php"); ?>

<main class="login wow ">

  

    <form method="POST" class="login-form">

        <h2 class="wow bounceIn" >Admin</h2>
    <?php
        // Displaying error INSIDE the form box
        if (isset($error)) {
            echo "<div class='error'>$error</div>";
        }
        ?>
        <input class="wow bounceInLeft " type="email" name="email" placeholder="Email">

        <input class="wow bounceInLeft "type="password" name="password" placeholder="Password">

       <select class="wow bounceInLeft " name="branch">
    <option value="Ismailia">Ismailia</option>
    <option value="Nasr City">Nasr City</option>
    <option value="Dokki">Dokki</option>
</select>

        <button class="wow flipInX" type="submit">Login</button>

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