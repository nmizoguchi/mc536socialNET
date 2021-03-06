<?php
	session_start("normal_user");
	
	$page = "home";	

	if(isset($_GET['page']))
		$page = $_GET['page'];

	if(isset($_GET['logout']) && $_GET['logout'] == true) {
		unset( $_SESSION['login'] );
		unset( $_SESSION['logout'] );
	}
	
	if($page == "home" && isset($_SESSION['login'])) {
		$page = "user_home";
	}
?>

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <script src="../../dist/js/bootstrap.min.js"></script>
    <script src="../../assets/js/docs.min.js"></script>
    
  </body>
</html>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="../../assets/ico/favicon.ico">

    <title>MusicNET</title>

    <!-- Bootstrap core CSS -->
    <link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet">
    

    <!-- Custom styles for this template -->
    <link href="starter_template.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy this line! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>

  <body>

    <div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="?page=home">MusicNET</a>
        </div>
        <div class="collapse navbar-collapse">
          <ul class="nav navbar-nav">
            <li class="active"><a href="?page=home">Home</a></li>
            <li><a href="?page=user_friends">Friends</a></li>
            <li><a href="?page=user_rated">My Ratings</a></li>
            <?php
            	if(isset($_SESSION['login']))
            		echo "<li><a href='?page=home&logout=true'>Logout</a></li>";
            ?>
            <?php
            	if(isset($_SESSION['login']))
            		echo "
            		<li>
            		<form class='form-horizontal' name='person_new' action='?page=artist_search' method='post' role='form'>
            		<div class='input-group'>
						<input type='text' class='form-control' name='search'>
						<span class='input-group-btn'>
						<button class='btn btn-default' type='submit'>Go!</button>
						</span>
					</div><!-- /input-group -->
					</form>
            		</li>";
            ?>
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </div>

    <div class="container-fluid">
      <div class="starter-template">
            <?php include $page.".php"; ?>
      </div>

    </div><!-- /.container -->


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <script src="../../dist/js/bootstrap.min.js"></script>
  </body>
</html>


