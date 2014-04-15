<?php
	$err = null;
	error_reporting(E_ALL);
	ini_set('display_errors', 1);
	
	$con = mysql_connect("localhost:3306","mc536user07", "euzaraef") or die(mysql_error());
	$selected = mysql_select_db("mc536db07", $con);
	
   $sql = "SELECT * FROM Person";
   $result = mysql_query($sql,$con);
?>
<html>
	<head>
		<title> MC536 SocialNET - Listagem de usuarios</title>
	</head>
	<body>
		<h1>Editar Usu&aacute;rio</h1>
		<table cellpadding="6">
		  <tr>
		    <td>Id</td>
		    <td>Login</td>
		    <td>Name</td>
		    <td>Hometown</td>
		    <td>Op&ccedil;&otilde;es</td>
		  </tr>
		<?php
			
			while($row = mysql_fetch_array($result)) {
				echo "<tr>";
				echo "<td>".$row['id']."</td>";
				echo "<td>".$row['login']."</td>";
				echo "<td>".$row['name']."</td>";
				echo "<td>".$row['hometown']."</td>";
				echo "<td><a href='./person_update.php?id=".$row['id']."'>Editar</a></td>";
				echo "</tr>";
			}
		?>
		</table>
	</body>
</html>
