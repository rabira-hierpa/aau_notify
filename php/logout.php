<?php
require 'dbcon.php';
function userLogout($conn)
{
    if (isset($_POST['logoutSubmit'])){
      session_start();
      session_destroy();
      header("Location: login.php?logoutSuccess");
      exit();
    }
}
function edituserLogout($conn)
{
    if (isset($_POST['logoutSubmit'])){
      session_start();
      session_destroy();
      header("Location: ../login.php?logoutSuccess");
      exit();
    }
}function chatRoomLogout($conn)
{
    if (isset($_POST['logoutSubmit'])){
      session_start();
      session_destroy();
      header("Location: ../login.php?logoutSuccess");
      exit();
    }
}
?>
