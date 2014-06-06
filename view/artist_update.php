<?php
	$err = null;
	error_reporting(E_ALL);
	ini_set('display_errors', 1);
	
	$id = $_GET['id'];
	if($id==null) {
		echo "<h1>Opera&ccedil;&atilde;o Inv&aacute;lida!</h1>";
		die();
	}
	
	$con = mysql_connect("localhost:3306","mc536user07", "euzaraef") or die(mysql_error());
	$selected = mysql_select_db("mc536db07", $con);

	function httpPost($id, $con) {
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
		
		$name = $_POST['name'];
		$hometown = $_POST['hometown'];
		
		if($name == ""){
			echo "Nome &eacute; necess&aacute;rio.";
			return false;
		}
		
		if($hometown == ""){
			echo "Hometown &eacute; necess&aacute;rio.";
			return false;
		}
		
		// NOW INSERT CORRECTLY
		$sql = "UPDATE Person SET name='".$name."', hometown='".$hometown."' WHERE id=".$id;
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
		if(httpPost($id, $con)) {
			echo "USUARIO ATUALIZADO COM SUCESSO!<br><a href='./person_list.php'>Voltar</a>";
			exit();
		}
	}
	
   $sql = "SELECT * FROM Person WHERE id=$id";
   $result = mysql_query($sql,$con);

   $row = mysql_fetch_array($result);
   $login = $row['login'];
   $name = $row['name'];
   $hometown = $row['hometown'];
?>
		<?php if($err)
			echo $err
		?>
		<h1>Editar Usu&aacute;rio</h1>
		<form name="input" action="person_update.php?id=<?php echo $id ?>" method="post">
		<table cellpadding="6">
		  <tr>
		    <td>Id</td>
		    <td><?php echo $id; ?></td>
		  </tr>
		  <td>Login</td>
		    <td><?php echo $login; ?></td>
		  </tr>
		<tr>
		<td>Name:</td>
		<td><input type="text" name="name" value="<?php echo $name ?>"></td>
		</tr>
		<tr>
		<td>Hometown:</td>
		<td><input type="text" name="hometown" value="<?php echo $hometown ?>"></td>
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
