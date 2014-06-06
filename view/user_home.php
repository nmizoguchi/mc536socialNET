
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
	
	if(isset($_GET['rating']) && isset($_GET['artist_id'])) {
		$artist_id = $_GET['artist_id'];
		$rating = $_GET['rating'];
		$sql = "INSERT INTO LikesMusic (person_id,artist_id,rating) VALUES ((SELECT id FROM Person WHERE login='$login'), $artist_id, $rating)";

		$result = mysql_query($sql,$con);
		if(!$result) {
			$sql = "UPDATE LikesMusic SET rating=$rating WHERE person_id=(SELECT id FROM Person WHERE login='$login') and artist_id=$artist_id";
			$result = mysql_query($sql,$con);
		}
		
	}
?>

<div class="row">

	
	<div class="col-md-9">
		<br>
		<p class="lead"><h2>Recommended for You</h2></p>
		<p class="lead">
			<div class="row">
				<?php
					$user_id = mysql_query("SELECT id FROM person WHERE login = '$login'", $con);
					$find_all_genres_sql = "SELECT ArtistGenre.genre_id FROM LikesMusic, ArtistGenre WHERE LikesMusic.person_id = '$user_id' and 
											LikesMusic.artist_id = ArtistGenre.artist_id GROUP BY ArtistGenre.genre_id";
					$result_all_genres = mysql_query($find_all_genres_sql, $con);
				
					while($genre_id = mysql_fetch_array($result_all_genres)) {
						$most_liked_from_each_genre = "SELECT MusicalArtist.artistic_name, MusicalArtist.image_mega FROM LikesMusic, ArtistGenre, MusicalArtist
						 							   WHERE ArtistGenre.genre_id = 3 AND LikesMusic.artist_id = ArtistGenre.artist_id AND 
						 							   LikesMusic.artist_id = MusicalArtist.id GROUP BY LikesMusic.artist_id ORDER BY count(*) desc limit 5";
						$result_each_genre = mysql_query($most_liked_from_each_genre);
						while($row = mysql_fetch_array($result_each_genre)) {
							$title = $row['artistic_name'];
							$image = $row['image_mega'];
							if($image == "") $image = "http://images3.alphacoders.com/739/73967.jpg";
							$artist_id = $row['id'];
							echo
								"<div class='col-md-2 col-sm-4 artist_cell' style=\"margin:1px; background-image:url('".$image."');\">".
								"<a href='./?page=artist_info&id=".$artist_id."' class='artist_title overflow-ellipsis'>".$title."</a>".
								"</div>";
							}
					}
				?>
			</div>
		</p>
		
		<br>
		<p class="lead"><h2>Most Popular</h2></p>
		<p class="lead">
			<div class="row">
				<?php
					$sql = "SELECT * FROM MusicalArtist LIMIT 12";
					$result = mysql_query($sql,$con);
					while($row = mysql_fetch_array($result)) {
						$title = $row['artistic_name'];
						$image = $row['image_mega'];
						if($image == "") $image = "http://images3.alphacoders.com/739/73967.jpg";
						$artist_id = $row['id'];
						echo
							"<div class='col-md-2 col-sm-4 artist_cell' style=\"margin:1px; background-image:url('".$image."');\">".
							"<a href='./?page=artist_info&id=".$artist_id."' class='artist_title overflow-ellipsis'>".$title."</a>".
							"</div>";
					}
				?>
			</div>
		</p>
	</div>
	
	<div class="col-md-3">
		<br>
		<p class="lead"><h2>Users</h2></p>
			<?php
				$sql = "SELECT * FROM Person";
				$result = mysql_query($sql,$con);
				while($row = mysql_fetch_array($result)) {
						$title = $row['name'];
						$id = $row['id'];
						echo "<p><a href='?page=user_info&id=$id'>".$title."</a></p>";
					}
			?>
		</p>
	</div>
</div>
<script>

resize_artist_cells = function () {
	var cw = $('.artist_cell').width()*1.2;
	$('.artist_cell').css({'height':cw+'px'});
}

resize_artist_cells();

$( window ).resize(resize_artist_cells);

</script>