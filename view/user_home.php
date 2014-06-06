
<?php
	if(!isset($_SESSION['login']))
	{
		echo "<p><h2>You are not logged in!</h2></p>
			<p><h4><a href='./?page=home'>Home</a></h4></p>";
		exit();
	}
	
	$con = mysql_connect("localhost:3306","mc536user07", "euzaraef") or die(mysql_error());
	$selected = mysql_select_db("mc536db07", $con);
?>

<div class="row">
	
	<div class="col-md-9">
		<p class="lead"><h2> Recommended for You</h2></p>
		<p class="lead">
			<div class="row">
				<?php
					$sql = "SELECT * FROM MusicalArtist LIMIT 18";
					$result = mysql_query($sql,$con);
					while($row = mysql_fetch_array($result)) {
						$title = $row['artistic_name'];
						$image = $row['image_large'];
						echo
							"<div class='col-md-2 col-sm-4' style=\"margin:1px; background-image:url('".$image."');\">".
							"<a href='#' class='overflow-ellipsis'>".$title."</a>".
							"</div>";
					}
				?>
			</div>
		</p>
	</div>
	
	<div class="col-md-3">
	</div>
</div>