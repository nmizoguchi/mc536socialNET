<?php
    $err = null;
    error_reporting(E_ALL);
    ini_set('display_errors', 1);

    $con = mysql_connect("localhost:3306","mc536user07", "euzaraef") or die(mysql_error());
    $selected = mysql_select_db("mc536db07", $con);

    $sql = "select avg(rating), stddev(rating) from LikesMusic";
    $result = mysql_query($sql,$con);
    $row = mysql_fetch_array($result);
    $rating_avg = $row['avg(rating)'];
    $rating_stddev = $row['stddev(rating)'];

    // TOP 20 RATING MEDIO
    $sql_top20_avg_rating = "select LikesMusic.artist_id,MusicalArtist.artistic_name ,avg(LikesMusic.rating) from LikesMusic, MusicalArtist where LikesMusic.artist_id = MusicalArtist.id group by MusicalArtist.id order by avg(LikesMusic.rating) desc limit 20";

    // TOP 10 MOST POPULAR
    $sql_top10_most_popular = "SELECT MusicalArtist.artistic_name, LikesMusic.artist_id, count(*) AS likes from LikesMusic, MusicalArtist where LikesMusic.artist_id = MusicalArtist.id group by MusicalArtist.id order by likes desc limit 10;";

    // TOP 10 WITH HIGHER STDDEV
    $sql_top10_higher_stddev = "SELECT LikesMusic.artist_id, MusicalArtist.artistic_name, stddev(LikesMusic.rating) as Deviation from LikesMusic, MusicalArtist where LikesMusic.artist_id = MusicalArtist.id group by MusicalArtist.id having count(*) > 1 order by Deviation desc limit 10;";

    // TOP 5 GENRES MOST LIKED
    $sql_top5_genres_liked = "SELECT ArtistGenre.genre_id, count(*) as likes FROM LikesMusic, ArtistGenre WHERE ArtistGenre.artist_id = LikesMusic.artist_id GROUP BY ArtistGenre.genre_id ORDER BY likes DESC LIMIT 5;";

    // TOP 10 KNOWN COUPLES THAT SHARE THE MOST NUMBER OF LIKED ARTISTS
    $sql_top10_known_shared_artists = "SELECT Knows.person_id, Knows.colleague_id, count(*) as CommonLikes FROM LikesMusic t1, LikesMusic t2, Knows WHERE t1.artist_id = t2.artist_id and t1.person_id = Knows.person_id and t2.person_id = Knows.colleague_id group by Knows.person_id, Knows.colleague_id order by CommonLikes DESC LIMIT 10;";

?>
<html>
    <head>
        <title> MC536 SocialNET - Estat&iacute;sticas</title>
        <script language="javascript" type="text/javascript" src="../flot/jquery.js"></script>
        <script language="javascript" type="text/javascript" src="../flot/jquery.flot.js"></script>
        <script type="text/javascript">

	$(function() {

		var d1 = [];
		for (var i = 0; i < 14; i += 0.5) {
			d1.push([i, Math.sin(i)]);
		}

		var d2 = [[0, 3], [4, 8], [8, 5], [9, 13]];

		var d3 = [];
		for (var i = 0; i < 14; i += 0.5) {
			d3.push([i, Math.cos(i)]);
		}

		var d4 = [];
		for (var i = 0; i < 14; i += 0.1) {
			d4.push([i, Math.sqrt(i * 10)]);
		}

		var d5 = [];
		for (var i = 0; i < 14; i += 0.5) {
			d5.push([i, Math.sqrt(i)]);
		}

		var d6 = [];
		for (var i = 0; i < 14; i += 0.5 + Math.random()) {
			d6.push([i, Math.sqrt(2*i + Math.sin(i) + 5)]);
		}

		$.plot("#chart", [{
			data: d1,
			lines: { show: true, fill: true }
		}]);
	});

	</script>
    </head>
    <body>
        <h1>Estat&iacute;sticas</h1>
        
        <h2>Ratings</h2>
        <table cellpadding="6">
            <tr>
                <td>M&eacute;dia</td>
                <td><?php echo $rating_avg ?></td>
            </tr>
            <tr>
                <td>Desvio padr&atilde;o</td>
                <td><?php echo $rating_stddev ?></td>
          </tr>
        </table>
        
        
        <h2>Top 20 Artistas com maior rating m&eacute;dio</h2>
        <table cellpadding="6">
            <tr>
                <td>Id</td>
                <td>Nome</td>
                <td>Rating m&eacute;dio</td>
            </tr>
                <?php
                    
                    $result = mysql_query($sql_top20_avg_rating,$con);
                    while($row = mysql_fetch_array($result)) {
                        echo "<tr>";
                        echo "<td>".$row['artist_id']."</td>";
                        echo "<td>".$row['artistic_name']."</td>";
                        echo "<td>".$row['avg(LikesMusic.rating)']."</td>";
                        echo "</tr>";
                    }
                ?>
        </table>
        

        <h2>Top 10 Artistas com maior rating m&eacute;dio</h2>
        <table cellpadding="6">
            <tr>
                <td>Id</td>
                <td>Nome</td>
                <td>N&uacute;mero de Likes</td>
            </tr>
                <?php
                    
                    $result = mysql_query($sql_top10_most_popular,$con);
                    while($row = mysql_fetch_array($result)) {
                        echo "<tr>";
                        echo "<td>".$row['artist_id']."</td>";
                        echo "<td>".$row['artistic_name']."</td>";
                        echo "<td>".$row['likes']."</td>";
                        echo "</tr>";
                    }
                ?>
        </table>
        
        
        <h2>Top 10 Artistas com maior variabilidade de ratings</h2>
        <table cellpadding="6">
            <tr>
                <td>Id</td>
                <td>Nome</td>
                <td>Desvio padr&atilde;o</td>
            </tr>
                <?php
                    
                    $result = mysql_query($sql_top10_higher_stddev,$con);
                    while($row = mysql_fetch_array($result)) {
                        echo "<tr>";
                        echo "<td>".$row['artist_id']."</td>";
                        echo "<td>".$row['artistic_name']."</td>";
                        echo "<td>".$row['Deviation']."</td>";
                        echo "</tr>";
                    }
                ?>
        </table>
        
        
        <h2>Top 5 G&ecirc;neros mais curtidos</h2>
        <table cellpadding="6">
            <tr>
                <td>Id</td>
                <td>Nome</td>
                <td>Likes</td>
            </tr>
                <?php
                    
                    $result = mysql_query($sql_top5_genres_liked,$con);
                    while($row = mysql_fetch_array($result)) {
                        echo "<tr>";
                        echo "<td>".$row['id']."</td>";
                        echo "<td>".$row['genre_name']."</td>";
                        echo "<td>".$row['Likes']."</td>";
                        echo "</tr>";
                    }
                ?>
        </table>
        
        <h2>Top 5 G&ecirc;neros mais curtidos</h2>
        <table cellpadding="6">
            <tr>
                <td>Id</td>
                <td>Nome</td>
                <td>Likes</td>
            </tr>
                <?php
                    
                    $result = mysql_query($sql_top5_genres_liked,$con);
                    while($row = mysql_fetch_array($result)) {
                        echo "<tr>";
                        echo "<td>".$row['id']."</td>";
                        echo "<td>".$row['genre_name']."</td>";
                        echo "<td>".$row['likes']."</td>";
                        echo "</tr>";
                    }
                ?>
        </table>
        
        
        <h2>Top 10 Conhecidos que compartilham o maior numero de artistas curtidos</h2>
        <table cellpadding="6">
            <tr>
                <td>Id Pessoa 1</td>
                <td>Id Pessoa 2</td>
                <td>Likes comuns</td>
            </tr>
                <?php
                    
                    $result = mysql_query($sql_top10_known_shared_artists,$con);
                    while($row = mysql_fetch_array($result)) {
                        echo "<tr>";
                        echo "<td>".$row['person_id']."</td>";
                        echo "<td>".$row['colleague_id']."</td>";
                        echo "<td>".$row['CommonLikes']."</td>";
                        echo "</tr>";
                    }
                ?>
        </table>
        
        
        <div id="chart" style="height:300px; width:400px"></div>
        
    </body>
</html>
