
<?php
	if(!isset($_SESSION['login']))
	{
		echo "<p><h2>You are not logged in!</h2></p>
			<p><h4><a href='./?page=home'>Home</a></h4></p>";
		exit();
	}
	
	$login = $_SESSION['login'];
	
	$con = mysql_connect("localhost:3306","mc536user07", "euzaraef") or die(mysql_error());
	$selected = mysql_select_db("mc536db07", $con);
?>

<div class="row">
	
	<div class="col-md-12">
		<br>
		<p class="lead"><h2>Added Friends</h2></p>
		<p class="lead">
			<div class="row">
				<?php

					$sql = "SELECT P1.name AS name1, P2.name AS name2, P1.id AS id1, P2.id AS id2 FROM Person P1, Person P2, Knows WHERE P2.id=(SELECT id FROM Person WHERE login='$login') and P2.id=Knows.person_id and P1.id=Knows.colleague_id";
					$result = mysql_query($sql,$con);
					while($row = mysql_fetch_array($result)) {
						$title = $row['name1'];
						$id = $row['id1'];
						echo "<p><a href='?page=user_info&id=$id'>".$title."</a></p>";
					}
					
					$sql = "SELECT P1.name AS name1, P2.name AS name2, P1.id AS id1, P2.id AS id2 FROM Person P1, Person P2, Knows WHERE P1.id=(SELECT id FROM Person WHERE login='$login') and P2.id=Knows.person_id and P1.id=Knows.colleague_id";
					$result = mysql_query($sql,$con);
					while($row = mysql_fetch_array($result)) {
						$title = $row['name2'];
						$id = $row['id2'];
						echo "<p><a href='?page=user_info&id=$id'>".$title."</a></p>";
					}
				?>
			</div>
		</p>
</div>