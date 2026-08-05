<?php
session_start();
require_once("function.php");

if (!isset($_SESSION['user'])) {
    header("Location: login.php");
    exit;
}

$user = $_SESSION['user'];

if ($_POST) {

    $username = trim($_POST['username']);
    $email = trim($_POST['email']);
    $phone = trim($_POST['phone']);
    $full_name = trim($_POST['full_name']);
    $address = trim($_POST['address']);
    $date_of_birth = trim($_POST['date_of_birth']);
    $password = trim($_POST['password']);

    // keep the old picture unless a new one was uploaded
    $profile_pic = $user['profile_pic'] ?? '';

    if (!empty($_FILES['profile_pic']['name'])) {
        $ext = pathinfo($_FILES['profile_pic']['name'], PATHINFO_EXTENSION);
        $new_name = "user_" . $user['id'] . "_" . time() . "." . $ext;
        move_uploaded_file($_FILES['profile_pic']['tmp_name'], "uploads/" . $new_name);
        $profile_pic = $new_name;
    }

    // date of birth needs to be NULL in the database if left empty
    if (empty($date_of_birth)) {
        $dob_value = "NULL";
    } else {
        $dob_value = "'$date_of_birth'";
    }

    // only update the password if they actually typed a new one
    if (!empty($password)) {
        $query = "UPDATE users SET
                    username='$username',
                    email='$email',
                    phone='$phone',
                    full_name='$full_name',
                    address='$address',
                    date_of_birth=$dob_value,
                    password='$password',
                    profile_pic='$profile_pic'
                  WHERE id='{$user['id']}'";
    } else {
        $query = "UPDATE users SET
                    username='$username',
                    email='$email',
                    phone='$phone',
                    full_name='$full_name',
                    address='$address',
                    date_of_birth=$dob_value,
                    profile_pic='$profile_pic'
                  WHERE id='{$user['id']}'";
    }

    $result = mysqli_query($con, $query);

    if ($result) {

        // refresh the session with the new data
        $query2 = "SELECT * FROM users WHERE id='{$user['id']}'";
        $result2 = mysqli_query($con, $query2);
        $_SESSION['user'] = mysqli_fetch_assoc($result2);

        header("Location: profile.php");
        exit;

    } else {
        $error = "Something went wrong.";
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Profile</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

<?php include_once("header.php"); ?>

<main class="login">
    <form class="signup-form" method="POST" enctype="multipart/form-data">

        <h2>Edit Profile</h2>

        <?php
        if (isset($error)) {
            echo "<p class='error'>$error</p>";
        }
        ?>

        <input type="text" name="username" placeholder="Username" value="<?php echo $user['username'] ?? ''; ?>">

        <input type="email" name="email" placeholder="Email" value="<?php echo $user['email'] ?? ''; ?>">

        <input type="text" name="phone" placeholder="Phone Number" value="<?php echo $user['phone'] ?? ''; ?>">

        <input type="text" name="full_name" placeholder="Full Name" value="<?php echo $user['full_name'] ?? ''; ?>">

        <input type="text" name="address" placeholder="Address" value="<?php echo $user['address'] ?? ''; ?>">

        <label class="file-label">Date of Birth</label>
        <input type="date" name="date_of_birth" value="<?php echo $user['date_of_birth'] ?? ''; ?>">

        <input type="password" name="password" placeholder="New Password (leave blank to keep current)">

        <label class="file-label">Profile Picture</label>
        <input type="file" name="profile_pic">

        <button type="submit">Save Changes</button>

        <p>
            <a href="profile.php">Cancel</a>
        </p>

    </form>
</main>

<?php include_once("footer.php"); ?>

</body>
</html>