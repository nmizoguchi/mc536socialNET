
<?php
	if(!isset($_SESSION['login']))
	{
		echo "<p><h2>You are not logged in!</h2></p>
			<p><h4><a href='./?page=home'>Home</a></h4></p>";
		exit();
	}
	
	$login = $_SESSION['login'];
	$search = $_POST['search'];
	
	$con = mysql_connect("localhost:3306","mc536user07", "euzaraef") or die(mysql_error());
	$selected = mysql_select_db("mc536db07", $con);
?>

<div class="row">
	
	<div class="col-md-12">
		<br>
		<p class="lead"><h2>Results</h2></p>
		<p class="lead">
			<div class="row">
				<?php
					$sql = "Select * FROM MusicalArtist WHERE artistic_name like '%$search%'";
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
<script>

resize_artist_cells = function () {
	var cw = $('.artist_cell').width()*1.2;
	$('.artist_cell').css({'height':cw+'px'});
}

resize_artist_cells();

$( window ).resize(resize_artist_cells);

</script>