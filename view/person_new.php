<?php
	function httpPost() {
	
		$con = mysql_connect("localhost:3306","mc536user07", "euzaraef") or die(mysql_error());
		$selected = mysql_select_db("mc536db07", $con);
		// CHECK DATA FIRST
		for($i = 0; $i < 10; $i++) {
			$knows[$i] = $_POST["knows$i"];
			if(isset($knows[$i]) && $knows[$i] != "") {
				$sql = "SELECT id FROM Person WHERE login='".$knows[$i]."'";
				$result = mysql_query($sql,$con);
				if($result) {
					$row = mysql_fetch_array($result);
					$knowsId[$i] = $row['id'];
				} else {
					echo "Nome de login do conhecido inv&aacute;lido: ".$knows[$i];
					return false;
				}
			}
		}
		
		$login = $_POST['login'];
		$name = $_POST['name'];
		$hometown = $_POST['hometown'];
		
		if($login == ""){
			echo "Login &eacute; obrigat&oacute;rio.";
			return false;
		}
		
		if($name == ""){
			echo "Nome &eacute; obrigat&oacute;rio.";
			return false;
		}
		
		if($hometown == ""){
			echo "Hometown &eacute; obrigat&oacute;rio.";
			return false;
		}
		
		// NOW INSERT CORRECTLY
		$sql = "INSERT INTO Person (login, name, hometown) VALUES('".$login."','".$name."', '".$hometown."')";
		$result = mysql_query($sql,$con);
		
		for($i = 0; $i < 10; $i++) {
			if(isset($knowsId[$i]) && $knowsId[$i]) {
				$sql = "INSERT INTO Knows (person_id, colleague_id) VALUES (".$id.", ".$knowsId[$i].")";
				$result = mysql_query($sql,$con);
			}
		}

		for($i = 0; $i < 10; $i++) {
			$likes[$i] = $_POST["likes$i"];
			if(isset($likes[$i]) && $likes[$i] != "") {
				$address = $likes[$i];
				$sql = "SELECT id FROM MusicalArtist WHERE wiki_address='".$address."'";
				$result = mysql_query($sql,$con);
				$row = mysql_fetch_array($result);
				$artistId = $row['id'];
				if(!isset($row['id']) || $artist == "") {
					$sql = "INSERT INTO MusicalArtist (wiki_address) VALUES ('".$address."')";
					$result = mysql_query($sql,$con);
					$sql = "SELECT id FROM MusicalArtist WHERE wiki_address='".$address."'";
					$result = mysql_query($sql,$con);
					$row = mysql_fetch_array($result);
					$artistId = $row['id'];
				}
				$sql = "INSERT INTO LikesMusic (person_id, artist_id) VALUES (".$id.", ".$artistId.")";
				$result = mysql_query($sql,$con);
			}
		}	
		return true;
	}
	
	if ($_SERVER['REQUEST_METHOD'] === 'POST') {
		if(httpPost()) {
			echo "USUARIO INSERIDO COM SUCESSO!<br><a href='./index.php'>Voltar</a>";
			exit();
		}
	}
?>
		<h1>Inserir Usu&aacute;rio</h1>
		<form name="input" action="person_new.php" method="post">
		<table cellpadding="6">
		  <td>Login</td>
		    <td><input type="text" name="login"></td>
		  </tr>
		<tr>
		<td>Name:</td>
		<td><input type="text" name="name"></td>
		</tr>
		<tr>
		<td>Hometown:</td>
		<td><input type="text" name="hometown"></td>
		</tr>
		</table>
		<h2>Novos Conhecidos</h2>
		<table cellpadding="6">
		<?php for($i = 0; $i < 10; $i++) {
			echo "<tr>
			<td>Nome:</td>
			<td><input type='text' name='knows$i'></td>
			</tr>";
		}
		?>
		</table>
		<h2>Novos Artistas Musicais</h2>
		<table cellpadding="6">
		<?php for($i = 0; $i < 10; $i++) {
			echo "<tr>
			<td>Nome:</td>
			<td><input type='text' name='likes$i'></td>
			</tr>";
		}
		?>
		</table>
		<input type="submit" value="Enviar">
		</form>
