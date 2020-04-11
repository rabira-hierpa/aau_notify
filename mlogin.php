<?php
  require 'db_files/dbcon.php';
  $uname = $_POST['usrname'];
  $pwd = $_POST['passkey'];
  $sql = "SELECT * FROM user WHERE usrname='$uname' AND passkey='$pwd';";
  $result = $conn->query($sql);
  if (mysqli_query($conn,$sql)) {
    # code...
  }else{

  }
  // if (mysqli_num_rows($result) > 0) {
  //   if ($row = $result->fetch_assoc()) {
  //     echo "You are registered!";
  //   }
  // }else {
  //   echo "You are not registered!";
  // }

 ?>
