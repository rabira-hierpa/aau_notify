<?php
session_start();
include 'db_files/dbcon.php';
function getLogin($conn)
  {
    if (isset($_POST['loginSubmit'])) {
      $uid = $_POST['uname'];
      $pwd = $_POST['pwd'];

      $sql = "SELECT * FROM user WHERE usrname='$uid' AND passkey='$pwd'";
      $result = $conn->query($sql);
      if (mysqli_num_rows($result) > 0) {
        if ($row = $result->fetch_assoc()) {
          $_SESSION['usrname']=$row['usrname'];
          $_SESSION['uid']=$row['id'];
          $_SESSION['flname'] = $row['fullname'];
          header("Location: index.php?loginsuccess");
          exit();
        }
      }else {
        header("Location: login.php?loginfailed");
        exit();
      }
    }
  }
function test($conn)
  {
      if (isset($_POST['loginSubmit'])) {
          echo $_POST['uname'];
      }
  }
?>
