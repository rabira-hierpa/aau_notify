<?php
/**
 * @param $conn
 */
function setSComments($conn)
  {
        if (isset($_POST['questionSubmit'])) {
          $sid = $_POST['sid'];
          $date = $_POST['date'];
          $message = $_POST['message'];
          $year = $_POST['year'];
          if (!empty($message)) {
            $checkRegistration="SELECT courseCode,courseRegistredID,studentId FROM courseRegistred WHERE studentId=$sid";
            $regStudent = $conn->query($checkRegistration);
            $row = $regStudent->fetch_assoc();
            if (mysqli_num_rows($regStudent) == 1){
                $id = $row['studentId'];
                $courseCode = $row['courseCode'];
                $courseRegistredID = $row['courseRegistredID'];
                if ($sid == $id){
                    $setMessage = "INSERT INTO courseChat(courseRegistredID,year,message,courseCode,date) VALUES ('$courseRegistredID',$year,'$message','$courseCode',$year,'$date')";
                    $result = $conn->query($setMessage);
                }
            }else{
                echo '<script type="text/javascript">';
                echo 'setTimeout(function () { swal("Not Registered","You are not registered in any course","error");';
                echo '}, 1000);</script>';
            }
          }
        }
  }
function getComments($conn)
{
 $year=$_POST['year'];
 if (isset($_SESSION['sid'])) {
     $checkRegistration="SELECT courseCode,courseRegistredID,studentId FROM courseRegistred WHERE studentId=$sid";
     $regStudent = $conn->query($checkRegistration);

  $sql = "SELECT * FROM courseChat WHERE year=$year ORDER BY TIMESTAMP(date) DESC ";
  $result = $conn->query($sql);
  echo " <div class='row' id='commentBox'>";
  while ($row = $result->fetch_assoc()) {
    // Check which notifaction belongs to which user
    $id = $row['uid'];
    $sql2 = "SELECT * FROM user WHERE id='$id'";
    $result2 = $conn->query($sql2);
                  echo "<div class = 'col-sm-12'>";
                  echo "<div class='well'>";
                  if ($row2 = $result2->fetch_assoc()) {
                      echo "
                          <p><img src='img/user-19.png' class='img-circle' height='55' width='55' alt='Avatar'></p>
                          <p>".$row2['usrname']."</p>
                        ";
                  echo '<p>'.$row['date'].'</p>';
                  echo '<p>'.nl2br($row['message']).'</p>';// Use nl2br() for converting new lines to break tags

                      if ($row['tag'] == 'first') {
                      echo "<span class='label label-default' id='first'>1st Year</span>";
                  }elseif ($row['tag'] == 'second') {
                    echo "<span class='label label-primary' id='second'>2nd Year</span>";
                  }elseif ($row['tag']=='third') {
                    echo "<span class='label label-success'id='third'>3rd Year</span>";
                  }elseif ($row['tag'] == 'fourth') {
                    echo "<span class='label label-info' id='fourth'>4th Year</span>";
                  }elseif ($row['tag'] == 'all') {
                    echo "<span class='label label-warning' id='all'>All</span>";
                  }

                  echo "<p>";
                  if (isset($_SESSION['uid'])) {
                    if ($_SESSION['uid'] == $row2['id']) {
                      echo "
                      <form method='POST' action='php/editcomment.php' >
                          <input type='hidden' class='form-control' name='nid' value='".$row['nid']."'>
                          <input type='hidden' class='form-control' name='uid' value='".$row2['id']."'>
                          <input type='hidden' class='form-control' name='date' value='".$row['date']."'>
                          <input type='hidden' class='form-control' name='message' value='".$row['message']."'>
                          <input type='hidden' class='form-control' name='tag' value='".$row['tag']."'>
                          <button class='btn btn-warning btn-block'>Edit<button>
                      </form>
                      <form method='POST' action='".deleteComments($conn)."' >
                          <input type='hidden' class='form-control' name='nid' value='".$row['nid']."'>
                          <input type='hidden' class='form-control' name='uid' value='".$row2['id']."'>
                          <button type='submit' name='commentDelete' class='btn btn-danger btn-block' id='delPost'>Delete<button>
                      </form>
                      </p>";
                    }
                  }
              }
        echo "</div>
        </div>";
      }
    echo "</div>";
  }//End of session check
}

function editSComments($conn)
{
  if (isset($_POST['commentSubmit'])) {
    $nid = $_POST['nid'];
    $date = $_POST['date'];
    $message = $_POST['message'];
    $tag = $_POST['year_list'];
    $sql = "UPDATE notifications SET message='$message',tag='$tag' WHERE nid='$nid'";
    $result = $conn->query($sql);
    header("Location: ../index.php");
  }
}
function deleteSComments($conn)
{
  if (isset($_POST['commentDelete'])) {
    $nid = $_POST['nid'];
    $uid = $_POST['uid'];
    $sql = "DELETE FROM  notifications WHERE nid='$nid' AND uid='$uid'";
    $result = $conn->query($sql);
    echo "<script>window.location='studentChatroom.php'</script>";
  }
}
function getSComments($conn){
    if (isset($_SESSION['sid'])){
        $fullname=$_SESSION['fullname'];
        $checkRegistration="SELECT * FROM studentComment;";
        $regStudent = $conn->query($checkRegistration);
        while($row = $regStudent->fetch_assoc()){
            echo "<div class = 'col-sm-12'>";
            echo "<div class='well'>";
            echo "<p><img src='img/user.jpeg' class='img-circle' height='55' width='55' alt='Avatar'></p>
                     <p>".$row['fullname']."</p>";
            echo '<p>'.$row['date'].'</p>';
            echo '<p>'.nl2br($row['message']).'</p>';
            echo '<p>'.$row['courseTitle'].'</p>';
            echo "</div></div>";
        }
    }
}