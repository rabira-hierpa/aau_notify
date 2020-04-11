<?php
/**
 * @param   $conn connection to the database
 */
require 'dbcon.php';
function edituserLogout($conn)
{
    if (isset($_POST['logoutSubmit'])){
      session_start();
      session_destroy();
      header("Location: ../slogin.php?logoutSuccess");
      exit();
    }
}function chatRoomLogout($conn)
{
    if (isset($_POST['logoutSubmit'])){
      session_start();
      session_destroy();
      header("Location: slogin.php?logoutSuccess");
      exit();
    }
}
?>
