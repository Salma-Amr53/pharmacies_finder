
<header>
    <ul>

        <?php if(!isset($_SESSION['user'])) { ?>

          

             <li><a href="index.php">Home</a></li>
             <li><a href="profile.php">Profile</a></li>
             <li><a href="login.php">Login</a></li>
             <li><a href="admin-login.php">Admin</a></li>
             <li><a href="signup.php">Sign Up</a></li>
            


               <?php } else { ?>

                <li><a href="index.php">Home</a></li>
                <li><a href="profile.php">Profile</a></li>

                  <?php if(isset($_SESSION['branch'])) { ?>
                      <li><a href="Addition.php">Add Medication</a></li>
                    <?php } ?>

             <li><a href="pharmacies.php">Pharmacies</a></li>

              <?php if(!isset($_SESSION['branch'])) { ?>
             <li><a href="search.php">Search</a></li>
                    <?php } ?>


            <li><a href="logout.php">Logout</a></li>

        <?php } ?>


        </ul>
</header>