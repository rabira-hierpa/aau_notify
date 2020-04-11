<?php
include 'db_files/dbcon.php';
include 'validateSLogin.php';
?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Login - AAU-Notify</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/master.css">
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-sm-6 col-md-4 col-md-offset-4">
            <h1 class="text-center login-title">Sign in to continue</h1>
            <div class="account-wall">
                <img class="profile-img" src="img/user.jpeg">
                <?php
                echo "
                    <form class='form-signin' action='" . getSLogin($conn) . "' method='POST'>
                        <input type='text' class='form-control' name='studentId' placeholder='ID' required autofocus>
                        <input type='password' class='form-control' name='passkey'placeholder='Password' required>
                        <button class='btn btn-lg btn-success btn-block' type='submit' name='loginSubmit'>Sign in</button>
                    </form>
                    ";
                ?>
            </div>
        </div>
    </div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>
