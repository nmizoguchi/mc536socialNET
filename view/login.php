<?php

	if (!($_SERVER['REQUEST_METHOD'] === 'POST')) {
		exit();
	}

	$login = $_POST["login"];
	$password = $_POST["password"];
	
	if($login == ""){
		echo "<p><b>Login</b> is required.<br></p>";
		return false;
	}
	
	if($password == ""){
		echo "<p><b>Password</b> is required.<br></p>";
		return false;
	} else { 
		$password = md5($password);
	}

	$con = mysql_connect("localhost:3306","mc536user07", "euzaraef") or die(mysql_error());
	$selected = mysql_select_db("mc536db07", $con);
	
	$sql = "SELECT login,password FROM Person WHERE login='".$login."'";
	$result = mysql_query($sql,$con);
	
	if(!$result) {
		echo $result;
		echo "Invalid login: ".$login;
		exit();
	}
	
	$row = mysql_fetch_array($result);
	$serverPassword = $row['password'];
	
	if($password==$serverPassword) {
		$_SESSION['login'] = $login;
		echo "<p><h3>Logged in!</h3></p>
				<p><h4><a href='./?page=user_home'>Start Navigating</a></h4></p>";
	}
	else {
		echo "Invalid login or password!";
	}
?>