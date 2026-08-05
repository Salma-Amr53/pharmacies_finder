<?php
session_start();
require_once("function.php");
check_login();

$db = null;

if(isset($_SESSION['branch']))
{
    $db = get_branch_database($_SESSION['branch']);
}

if(isset($_POST['delete_med']) && $db != null)
{
    $med = $_POST['med'];


    if(!empty($med)){
    $result3 = mysqli_query($db, "DELETE FROM medicines WHERE name='$med'");

    if($result3)
    {
      echo "<script>
            alert('Medicine deleted successfully!');
            window.location.href='profile.php';
          </script>";  
          
          }
    else
    {
 echo "<script>
            alert('Error deleting medicine!');
            window.location.href='profile.php';
          </script>";
              }

      // Get the highest existing id
    $id = mysqli_query($db, "SELECT MAX(id) AS max_id FROM medicines");
    $row = mysqli_fetch_assoc($id);

    $next_id = $row['max_id'] + 1;

    // Reset auto increment
    mysqli_query($db, "ALTER TABLE medicines AUTO_INCREMENT = $next_id");
    }
}

$user = $_SESSION['user'];

$first_letter = strtoupper(substr($user['username'], 0, 1));

$user_id = $user['id'];
if(isset($_POST['post_review']))
{
    $review = trim($_POST['review']);

    if(!empty($review))
    {
        $query = "INSERT INTO reviews (user_id, review)
                  VALUES ('$user_id', '$review')";

        mysqli_query($con, $query);

        header("Location: profile.php");
        exit;
    }
}
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
    <link rel="stylesheet" href="css/libs/animate.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.3.0/css/all.min.css">
</head>
<body>

<?php include_once("header.php"); ?>

<main class="login">


    <div class="profile-box wow fadeInDown">

        <?php if (!empty($user['profile_pic'])): ?>
            <img src="uploads/<?php echo $user['profile_pic']; ?>" class="profile-pic">
        <?php else: ?>
            <div class="profile-pic-placeholder">
                <?php echo $first_letter; ?>
            </div>
        <?php endif; ?>

        <div class="profile-info wow flash">

            <p><span>Username:</span> <?php echo $user['username']; ?></p>

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


            <!-- ADMIN SPECIFIC FIELDS -->
            <?php if (!empty($user['role'])): ?>
                <p><span>Role:</span> <?php echo $user['role']; ?></p>
            <?php endif; ?>

            <?php if (!empty($user['salary'])): ?>
                <p><span>Salary:</span> <?php echo $user['salary']; ?> EGP</p>
            <?php endif; ?>

            <?php if (isset($_SESSION['branch'])): ?>
                <p><span>Assigned Branch:</span> <?php echo $_SESSION['branch']; ?></p>
            <?php endif; ?>



            <div class="profile-actions">
                <a href="edit_profile.php" class="edit-btn">Edit Profile</a>
                <a href="delete_profile.php" class="delete-btn">Delete Profile</a>
            </div>


             

        </div>

    </div>
    
    
     
     <?php if (!empty($user['role'])): ?>

                <div class="del wow bounceInRight">
                    <form method="POST">
<select name="med" id="med" onchange="showImage(this)">
<option value="">Select Medicine</option>

<?php
$query2 = "SELECT name,image FROM medicines";
$result2 = mysqli_query($db,$query2);

while($row=mysqli_fetch_assoc($result2))
{
   echo "
<option value='".$row['name']."' data-image='images/".$_SESSION['branch']."/".$row['image']."'>
    ".$row['name']."
</option>";
}


?>

<script>
function showImage(select)
{
    let img = select.options[select.selectedIndex].getAttribute("data-image");
    document.getElementById("medImage").src = img;
}
</script>

</select>
<button name="delete_med" type="submit"> Delete Medicine </button>      

</form>

<img id="medImage" width="130" margin:10px;>
                </div>

                     <img class="admin_image wow flipInX" src="images/Statistics/<?= $_SESSION['branch'] ?>.png" />


              

             <?php endif; ?>
     

    <?php if (!isset($_SESSION['branch']) && (empty($user['role']) || $user['role'] !== 'admin')): ?>

    <div class="profile-box profile-medicines wow flipInY">

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


<div class="profile-box review-box wow bounce">

    <form method="POST">

        <h2>Write Review</h2>

        <textarea name="review" placeholder="Write your review..." required></textarea>

        <button
            type="submit"
            name="post_review">
            Post
        </button>

    </form>

</div>

<?php endif; ?>

</main>

<?php include_once("footer.php"); ?>
 <script src="js/wow.min.js"></script>
 <script> new WOW().init(); </script>
</body>
</html>