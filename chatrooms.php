<?php
  date_default_timezone_set('Africa/Addis_Ababa');
  include 'db_files/dbcon.php';
  include 'php/chatRoomManager.php';
  include 'php/logout.php';
  session_start();
?>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Chat Rooms</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link rel="stylesheet" href="css/master.css">
  <style>
    /* Remove the navbar's default margin-bottom and rounded borders */
    .navbar {
      margin-bottom: 0;
      border-radius: 0;
    }

    /* Set height of the grid so .sidenav can be 100% (adjust as needed) */
    .row.content {height: 450px}

    /* Set gray background color and 100% height */
    .sidenav {

      padding-top: 20px;
      background-color: #f1f1f1;
      height: 100%;
    }

    /* Set black background color, white text and some padding */
    footer {
      background-color: #222;
      color: white;
      padding: 15px;
    }

    /* On small screens, set height to 'auto' for sidenav and grid */
    @media screen and (max-width: 767px) {
      .sidenav {
        height: auto;
        padding: 15px;
      }
      .row.content {height:auto;}
    }
    .Active{
      border-right: 5px #1d89e2 solid;
    }

    .alert {
    padding: 20px;
    background-color: #f44336;
    color: white;
    opacity: 1;
    transition: opacity 0.6s;
    margin-bottom: 15px;
}

.alert.success {background-color: #4CAF50;}
.alert.info {background-color: #2196F3;}
.alert.warning {background-color: #ff9800;}

.closebtn {
    margin-left: 15px;
    color: white;
    font-weight: bold;
    float: right;
    font-size: 22px;
    line-height: 20px;
    cursor: pointer;
    transition: 0.3s;
}

.closebtn:hover {
    color: black;
}
  </style>
</head>
<body id="mainBody">
  <nav class="navbar navbar-inverse">
    <div class="container-fluid">
      <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <!-- When the window is resized  -->
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
        <a class="navbar-brand" href="index.php" >AAU Notify</a>
      </div>
      <div class="collapse navbar-collapse" id="myNavbar">
        <ul class="nav navbar-nav">
          <li><a href="index.php" >Notifications</a></li>
        </ul>
        <ul class="nav navbar-nav">
          <li class='active'><a href="chatrooms.php" >Chat Rooms</a></li>
        </ul>
        <ul class="nav navbar-nav navbar-right">
           <li class="dropdown">
          <?php
          if (isset($_SESSION['uid'])) {
            echo "<a class='dropdown-toggle' data-toggle='dropdown' href='#'>
            <span class='glyphicon glyphicon-user'></span>";
            echo $_SESSION['usrname'];
          }else {
              header("Location: login.php");
            }
          ?></a>
           <ul class="dropdown-menu">
             <li><a href="#">Change Password</a></li>
             <li>
               <?php
               echo "<form action='".userLogout($conn)."' method='POST'>
               <button type='submit' name='logoutSubmit' class='btn-block'>Logout</button>
             </form>";?></li>
           </ul>
         </li>
        </ul>
      </div>
    </div>
  </nav>
<div class="container-fluid text-center">
  <div class="row content">
    <div class="col-sm-2 sidenav">
    <header>
      <h3 class="header">All Chat Rooms</h3>
    </header>
      <ul class="nav nav-pills text-left">
        <ul class="list-group">
          <li class="list-group-item Active"><a href="#">1st Year</a></li>
          <li class="list-group-item "><a href="#">2nd Year</a></li>
          <li class="list-group-item "><a href="#">3rd Year</a></li>
          <li class="list-group-item "><a href="#">4th Year</a></li>
        </ul>
      </ul>
    </div>
    <div class="col-sm-8">
      <div class="row">
        <div class="col-sm-12">
          <div class="panel panel-success text-left">
            <div class="panel-body">
              <div class="form-group">
                <?php
                if (isset($_SESSION['usrname'])) {
                  echo "
                  <form class='form-group' action='".setComments($conn)."' method='POST' >
                      <label for='comment'>Write Notifaction:</label>
                      <input type='hidden' name='uid' value='".$_SESSION['uid']."'>
                      <input type='hidden' name='date' value='".date('Y-m-d h:i:s')."'>
                      <div class='well-sm'>
                          <textarea name='message' class='form-control' rows='7' id='comment' required ></textarea>
                          <label class='radio-inline' required>
                             <input type='radio' name='year_list' value='first'><span class='label label-default '>1st Year</span>
                           </label>
                           <label class='radio-inline'>
                             <input type='radio' name='year_list' value='second'><span class='label label-primary'>2nd Year</span>
                           </label>
                           <label class='radio-inline'>
                             <input type='radio' name='year_list' value='third'><span class='label label-success'>3rd Year</span>
                           </label>
                           <label class='radio-inline'>
                             <input type='radio' name='year_list' value='fourth'><span class='label label-info'>4th Year</span>
                           </label>
                           <label class='radio-inline'>
                             <input type='radio' name='year_list' value='all'><span class='label label-warning'>All</span>
                           </label>
                          <button type='submit' name='commentSubmit' class='btn-primary btn-lg' style='width:100px; margin:10px; position:absolute; right:80px;'>Post</button>
                      </div>
                  </form>
                  ";
                }else {
                  echo "<div class='row'>
                          <div class='col-md-12'>
                            <div class='well'>Please login to access notification.</div>
                          </div>
                        </div>";
                }
                 ?>
              </div>
            </div>
          </div>
        </div>
      </div>
     <?php getComments($conn) ?>
    </div>
    <div class="col-sm-2 sidenav">
      <div class="well">
        <?php
          if (isset($_SESSION['uid'])) {
          echo "<div class='well'>
                  <p><a href='#'>";echo $_SESSION['flname']."</a></p>
                  <img src='img/user-19.png' class='img-circle' height='65' width='65' alt='Avatar'>
              </div>";
          }
         ?>
      </div>
      <div class="well">
        <p>Filter By Tags</p>
        <p>
            <a href='#first'><span class='label label-default'>1st Year</span></a>
            <a href='#second'><span class='label label-primary'>2nd Year</span></a>
            <a href='#third'><span class='label label-success'>3rd Year</span></a>
            <a href='#fourth'><span class='label label-info'>4th Year</span></a>
            <a href='#all'><span class='label label-warning'>All</span></a>
        </p>
      </div>
    </div>
  </div>
</div>

<footer class="container-fluid text-center footer">
  <p>AAU Notification</p>
  <p>Copyright (c) <?php echo date('Y') ?> AAU-Notify All Rights Reserved.</p>
</footer>
<script>

function notifyDelete(){
 swal({
  title:"success",
  text:"Message deleted successfully!",
  },function(){
   window.location.href='chatrooms.php';
    }
  });
}
</script>
<script>
function showTagErrorAlert(){
  var close = document.getElementsByClassName("closebtn");
  var i;

  for (i = 0; i < close.length; i++) {
    close[i].onclick = function(){
      var div = this.parentElement;
      div.style.opacity = "0";
      setTimeout(function(){ div.style.display = "none"; }, 600);
    }
  }
}
</script>
<script src="js/notify.js"></script>
<script src="js/sweetalert.js"></script>
<script src="js/removePost.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>
