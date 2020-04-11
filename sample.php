<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>Test offset in Bootstrap</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link rel="stylesheet" href="/css/master.css">
</head>

<body>
  <div class="container">
    <div class="row">
      <div class="col-sm-6">
        <div class="well">
          <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute
            irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
        </div>
        <div class="col-sm-offset-6">
          <button type="button" name="button" class="btn btn-md btn-danger">Delete</button>&nbsp;<button type="button" name="edit" class="btn btn-md btn-warning">Edit</button>
        </div>
      </div>
    </div>
    <div class='row'>
      <div class='col-sm-12 col-md-6'>
        <div class='well'>
          <p>2017-06-17 14:33:23</p>
          <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute
            irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
          <span class='label label-primary'>tag</span>
          <form method='POST' action='#'>
            <input type='hidden' class='form-control' name='nid' value='".$row[' nid ']."'>
            <input type='hidden' class='form-control' name='date' value='".$row[' date ']."'>
            <input type='hidden' class='form-control' name='message' value='".$row[' message ']."'>
            <input type='hidden' class='form-control' name='tag' value='".$row[' tag ']."'>
            <div class='col-sm-offset-6 col-md-offset-9'>
              <button class='btn btn-warning btn-md' data-toggle='modal' data-target='#myModal'>Edit<button>
              <button class='btn btn-warning btn-md'>Edit<button>
            </div>
           </form>
      </div>
    </div>
  </div>





  <!-- Modal -->
    <div class="modal fade" id="myModal" role="dialog">
      <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <h4 class="modal-title">Modal Header</h4>
          </div>
          <div class="modal-body">
            <p>Some text in the modal.</p>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
          </div>
        </div>

      </div>
    </div>































  <form class='form-group' action='#' method='POST'>
  <label for='comment'>Post:</label>
  <input type='hidden' name='nid' value='anonymous'>
  <input type='hidden' name='date' value='2017-04-05"'>
  <div class='well-sm'>
    <textarea name='message' class='form-control' rows='5' id='comment' ></textarea>
    <button type='submit' name='commentSubmit' class='btn-primary btn-md' style='width:100px; margin:10px; position:absolute; right:80px;' onclick='notify_success()'>Post</button>
  </div>
  </form>
  </div>
</body>
<script type="text/javascript">
function notify_success() {
  swal({title: "Updated",
  text: "Notification was updated successfully",
  type: "success",
  closeOnConfirm:"true",
  allowOutsideClick:"true",
  allowEscapeKey:"true",
  closeOnConfirm: "false",
  animation:"true",
  confirmButtonText: "Close"});
}
</script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</html>
