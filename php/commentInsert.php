<?php
/**
 * @param $conn
 */
function setComments($conn)
  {
        if (isset($_POST['commentSubmit'])) {
          $uid = $_POST['uid'];
          $date = $_POST['date'];
          $message = $_POST['message'];
          $tag = $_POST['year_list'];
          if (!empty($_POST['year_list'] && $message)) {
            $sql = "INSERT INTO notifications (uid,date,message,tag) VALUES ('$uid','$date','$message','$tag')";
            $result = $conn->query($sql);
          }else {
            echo "<script>swal{ title:'Error', text:'Please select at least one tag!',type:'error'}</script>";
          }
        }
  }
function getComments($conn)
{
 if (isset($_SESSION['uid'])) {
  $sql = "SELECT * FROM notifications ORDER BY TIMESTAMP(date) DESC ";
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
                          <button name='commentSubmit' class='btn btn-warning btn-block'>Edit<button>
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

function editComments($conn)
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
function deleteComments($conn)
{
  if (isset($_POST['commentDelete'])) {
    $nid = $_POST['nid'];
    $uid = $_POST['uid'];
    $sql = "DELETE FROM  notifications WHERE nid='$nid' AND uid='$uid'";
    $result = $conn->query($sql);
    echo "<script>window.location='index.php'</script>";
  }
}
