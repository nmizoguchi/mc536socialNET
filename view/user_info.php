
<?php
	if(!isset($_SESSION['login']))
	{
		echo "<p><h2>You are not logged in!</h2></p>
			<p><h4><a href='./?page=home'>Home</a></h4></p>";
		exit();
	}
	
	$login = $_SESSION['login'];
	
	if(!isset($_GET['id']))
		exit();
		
	$id = $_GET['id'];
	
	$con = mysql_connect("localhost:3306","mc536user07", "euzaraef") or die(mysql_error());
	$selected = mysql_select_db("mc536db07", $con);

	if(isset($_GET['add_friend'])) {
		if($_GET['add_friend'] == "true") {
			$sql = "INSERT IGNORE INTO Knows (person_id,colleague_id) VALUES ((SELECT id FROM Person WHERE login='$login'),$id)";
			$result = mysql_query($sql,$con);
		} else {
			$sql = "DELETE FROM Knows WHERE person_id = (SELECT id FROM Person WHERE login='$login') and colleague_id = $id";
			$result = mysql_query($sql,$con);
			
			$sql = "DELETE FROM Knows WHERE colleague_id = (SELECT id FROM Person WHERE login='$login') and person_id = $id";
			$result = mysql_query($sql,$con);
		}
	} 
	
	$sql = "SELECT * FROM Person WHERE id=$id LIMIT 1";

	$result = mysql_query($sql,$con);
	if(!$result)
		exit();
		
	$person = mysql_fetch_array($result);
	
	$sql = "SELECT * FROM Knows WHERE person_id=$id and colleague_id=(SELECT id FROM Person WHERE login='$login') LIMIT 1";
	$result = mysql_query($sql,$con);
	
	if($result) {
		$knows = mysql_fetch_array($result);
		if(!isset($knows) || $knows['id'] =="") {
			$sql = "SELECT * FROM Knows WHERE colleague_id=$id and person_id=(SELECT id FROM Person WHERE login='$login') LIMIT 1";
			$result = mysql_query($sql,$con);
			if($result) {
				$knows = mysql_fetch_array($result);
			}
		}
	}
?>

<div class="row">
	<div class="col-md-12">
		<p class="lead"><h2><?php echo $person['name']; ?></h2></p>
		<p class="lead">Id: <?php echo $person['id'] ?></p>
		<p class="lead">login: <?php echo $person['login'] ?></p>
		<p class="lead">Hometown: <?php echo $person['hometown']; ?></p>
		<p class="lead">
			<?php
			if(isset($knows) && isset($knows['id'])) {
				echo "<a href='?page=user_info&id=$id&add_friend=false'>Unfriend</a>";
			} else {
				echo "<a href='?page=user_info&id=$id&add_friend=true'>Add Friend</a>";
			}
			?>
		</p>
	</div>
</div>

<div class="row">
	
	<div class="col-md-12">
		<br>
		<p class="lead"><h2>Ratings</h2></p>
		<p class="lead">
			<div class="row">
				<?php
					$sql = "SELECT * FROM MusicalArtist, LikesMusic WHERE MusicalArtist.id = LikesMusic.artist_id and LikesMusic.person_id=$id  ORDER BY LikesMusic.rating DESC";
					$result = mysql_query($sql,$con);
					while($row = mysql_fetch_array($result)) {
						$title = $row['artistic_name'];
						$image = $row['image_mega'];
						if($image == "") $image = "http://images3.alphacoders.com/739/73967.jpg";
						$artist_id = $row['artist_id'];
						$rating = $row['rating'];
						echo
							"<div class='col-md-2 col-sm-4 artist_cell' style=\"margin:1px; background-image:url('".$image."');\">".
							"<a href='./?page=artist_info&id=".$artist_id."' class='artist_title overflow-ellipsis'>".$title." (".$rating.")</a>".
							"</div>";
					}
				?>
			</div>
		</p>
</div>
<script>

resize_artist_cells = function () {
	var cw = $('.artist_cell').width()*1.2;
	$('.artist_cell').css({'height':cw+'px'});
}

resize_artist_cells();

$( window ).resize(resize_artist_cells);

</script>