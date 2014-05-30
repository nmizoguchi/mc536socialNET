<?php
	$err = null;
	error_reporting(E_ALL);
	ini_set('display_errors', 1);
	
	$con = mysql_connect("localhost:3306","mc536user07", "euzaraef") or die(mysql_error());
	$selected = mysql_select_db("mc536db07", $con);

	$orderby = "id";
	if(isset($_GET['orderby']))
		$orderby = $_GET['orderby'];

   $sql = "SELECT * FROM MusicalArtist ORDER BY $orderby";
   $result = mysql_query($sql,$con);
?>
<html>
	<head>
		<title> MC536 SocialNET - Listagem de Artistas</title>
	</head>
	<body>
		<h1>Listar Artistas</h1>
		<table cellpadding="6">
		  <tr>
		    <td><a href="?orderby=id">Id</a></td>
		    <td><a href="?orderby=artistic_name">Name</a></td>
		    <td><a href="?orderby=creation_date">Creation Date</a></td>
		    <td><a href="?orderby=wiki_address">Wiki Address</a></td>
		  </tr>
		<?php
			
			while($row = mysql_fetch_array($result)) {
				echo "<tr>";
				echo "<td><a href='artist_update.php?id=".$row['id']."'>".$row['id']."</a></td>";
				echo "<td><a href='artist_update.php?id=".$row['id']."'>".$row['artistic_name']."</td>";
				echo "<td>".$row['creation_date']."</td>";
				echo "<td><a href='".$row['wiki_address']."'>".$row['wiki_address']."</a></td>";
				echo "</tr>";
			}
		?>
		</table>
	</body>
</html>
