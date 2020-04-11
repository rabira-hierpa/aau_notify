<?php
  date_default_timezone_set('Africa/Addis_Ababa');
  include 'db_files/dbcon.php';
  include 'php/commentInsert.php';
  include 'php/logout.php';
  session_start();
?>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <title>AAU-Notifiy Portal</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!--  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">-->
        <link rel="stylesheet" href="bootstrap/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/master.css">
        <style>
            /* Set black background color, white text and some padding */
            
            footer {
                background-color: #222;
                color: white;
                padding: 15px;
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
                    <a class="navbar-brand" href="index.php">AAU Notify</a>
                </div>
                <div class="collapse navbar-collapse" id="myNavbar">
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="index.php">Notifications</a></li>
                    </ul>
                    <ul class="nav navbar-nav">
                        <li class=''><a href="chatrooms.php">Chat Rooms</a></li>
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
                                           </form>";
                                        ?>
                                    </li>
                                </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <?php
  if (isset($_SESSION['uid'])) {
    echo "<div class='container text-center'>
        <div class='row'>
        <div class='col-sm-3 well'>
        <div class='jumbotron'>
            <p><a href='#'>";echo $_SESSION['flname']."</a></p>
            <img src='img/user-19.png' class='img-circle' height='65' width='65' alt='Avatar'>
        </div>
        <div class='well'>
            <p>Filter By Tags</p>
            <p>
                <a href='#first'><span class='label label-default'>1st Year</span></a>
                <a href='#second'><span class='label label-primary'>2nd Year</span></a>
                <a href='#third'><span class='label label-success'>3rd Year</span></a>
                <a href='#fourth'><span class='label label-info'>4th Year</span></a>
                <a href='#all'><span class='label label-warning'>All</span></a>
            </p>
            </div>
        </div>";
  }
   ?>
            <!--IDEA: add a notification
        <div class="alert alert-success fade in">
        <a href="#" class="close" data-dismiss="alert" aria-label="close">×</a>
        <p><strong>Ey!</strong></p>
        People are looking at your profile. Find out who.
      </div> -->
            <div class="col-sm-7">
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
                                                    <textarea name='message' class='form-control' rows='7' id='comment' ></textarea>
                                                    <label class='radio-inline'>
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
            </div>
            </div>

            <footer class="container-fluid text-center">
                <p>AAU Notification</p>
                <p>Copyright (c)
                    <?php echo date('Y') ?> AAU-Notify All Rights Reserved.</p>
            </footer>
            <script src="js/notify.js"></script>
            <script src="js/sweetalert.js"></script>
            <script src="js/removePost.js"></script>
            <script src="jquery/dist/jquery.min.js"></script>
            <!--  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>-->
            <!--  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>-->
            <script src="bootstrap/dist/js/bootstrap.js"></script>
    </body>

    </html>
