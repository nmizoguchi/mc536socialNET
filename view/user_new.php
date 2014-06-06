<?php
	$login = $_POST['login'];
	$name = $_POST['name'];
	$hometown = $_POST['hometown'];
	$password = $_POST['password'];

	function httpPost($login, $name, $hometown, $password) {
	
		$con = mysql_connect("localhost:3306","mc536user07", "euzaraef") or die(mysql_error());
		$selected = mysql_select_db("mc536db07", $con);
		
		if($login == ""){
			echo "<p><b>Login</b> is required.<br></p>";
			return false;
		}
		
		if($name == ""){
			echo "<p><b>Nome</b< is required.<br></p>";
			return false;
		}
		
		if($hometown == ""){
			echo "<p><b>Hometown</b> is required.<br></p>";
			return false;
		}
		
		if($password == ""){
			echo "<p><b>Senha</b> is required.<br></p>";
			return false;
		} else { 
			$password = md5($password);
		}
		
		// NOW INSERT CORRECTLY
		$sql = "INSERT INTO Person (login, name, hometown, password) VALUES('".$login."','".$name."', '".$hometown."', '".$password."')";
		$result = mysql_query($sql,$con);

		if($result)
			return true;
		return false;
	}
	
	if ($_SERVER['REQUEST_METHOD'] === 'POST') {
		if(!httpPost($login, $name, $hometown, $password)) {
			echo "<p>An error occured! Try again later.<br><a href='./?page=home'>Back</a></p>";
			exit();
		}
		else {
			$_SESSION['login']=$login;
			echo "<p><h3>Account created successfully.</h3></p>
					<p><h4><a href='./?page=user_home'>Start Navigating</a></h4></p>";
		}
	}
?>