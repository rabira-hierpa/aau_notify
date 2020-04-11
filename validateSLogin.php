<?php
session_start();
include 'db_files/dbcon.php';
function getSLogin($conn)
  {
    if (isset($_POST['loginSubmit'])) {
      $sid = $_POST['studentId'];
      $pwd = $_POST['passkey'];

      $sql = "SELECT * FROM student WHERE studentId='$sid' AND passkey='$pwd'";
      $result = $conn->query($sql);
      if (mysqli_num_rows($result) > 0) {
        if ($row = $result->fetch_assoc()) {
          $_SESSION['sid']=$row['studentId'];
          $_SESSION['fullname'] = $row['fullName'];
          $_SESSION['year']= $row['year'];
          header("Location: studentChatroom.php");
          exit();
        }
      }else {
        header("Location: slogin.php?loginfailed");
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
