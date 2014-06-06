
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
	
	$sql = "SELECT * FROM MusicalArtist WHERE id=$id LIMIT 1";

	$result = mysql_query($sql,$con);
	if(!$result)
		exit();
		
	$artist = mysql_fetch_array($result);
	
	$sql = "SELECT * FROM LikesMusic WHERE artist_id=$id and person_id=(SELECT id FROM Person WHERE login='$login')";
	$result = mysql_query($sql,$con);
	
	$likes = mysql_fetch_array($result);
?>

<div class="row">
	<p class="lead"><h2><?php echo $artist['artistic_name']; ?></h2></p>
	<div class="col-md-3 text-right">
		<img src="<?php $image = $artist['image_mega'];
						if($image == "") $image = "http://images3.alphacoders.com/739/73967.jpg";
						echo $image;?>"style='style='width=100%;'/>
		<div class="row">
			<?php
				$artist_id = $artist['id'];
				for($i = 1; $i <= 5; $i++) {
					if($likes['rating'] >= $i)
						echo "<div class='col-md-2'><a href='?page=user_home&artist_id=$artist_id&rating=$i'>
							<img src='http://upload.wikimedia.org/wikipedia/commons/thumb/0/09/Emblem-star.svg/48px-Emblem-star.svg.png' />
							</a></div>";
					else
						echo "<div class='col-md-2'><a href='?page=user_home&artist_id=$artist_id&rating=$i'>
							<img src='http://students.ic.unicamp.br/~ra103659/star_empty.png' />
							</a></div>";
				}
			?>
			<div class="col-md-2"></div>
		</div>
	</div>
	
	<div class="col-md-9">
		<?php $date = split('-',$artist[3]); ?>
		<p class="lead">Id: <?php echo $artist[0] ?></p>
<!-- 		<p class="lead">Hometown: <?php echo $artist[2] ?></p> -->
		<p class="lead">Creation Year: <?php echo $date[0]; ?></p>
		<p class="lead">Wikipedia: <?php echo $artist[4] ?></p>
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