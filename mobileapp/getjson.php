<?php
require '../db_files/dbcon.php';
$sql = "SELECT date,message,tag FROM notifications;";
$result = mysqli_query($conn,$sql);
$response = array();
while ($row = mysqli_fetch_array($result)) {
  // "nid"=>$row[0],"uid"=>$row[1],
  array_push($response,array("date"=>$row[0],"message"=>$row[1],"tag"=>$row[2]));
}
echo json_encode(array("server_response"=>$response));
mysqli_close($conn);
?>
