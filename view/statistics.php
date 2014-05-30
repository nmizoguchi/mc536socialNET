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
    $sql_top5_genres_liked = "SELECT ArtistGenre.genre_id, MusicalGenre.genre_name count(*) as likes FROM LikesMusic, ArtistGenre, MusicalGenre WHERE ArtistGenre.artist_id = LikesMusic.artist_id and MusicalGenre.id = ArtistGenre.genre_id GROUP BY ArtistGenre.genre_id ORDER BY likes DESC LIMIT 5;";

    // TOP 10 KNOWN COUPLES THAT SHARE THE MOST NUMBER OF LIKED ARTISTS
    $sql_top10_known_shared_artists = "SELECT a1.id AS P1_id, a1.login AS P1_login, a2.id AS P2_id, a2.login AS P2_login, count(*) as CommonLikes FROM LikesMusic t1, LikesMusic t2, Knows, Person a1, Person a2 WHERE t1.artist_id = t2.artist_id and t1.person_id = Knows.person_id and t2.person_id = Knows.colleague_id and a1.id = t1.person_id and a2.id = t2.person_id GROUP BY Knows.person_id, Knows.colleague_id ORDER BY CommonLikes DESC limit 10;";

    // POPULARITY ASCENDING
    $pupular_asc = "SELECT count(*) AS likes from LikesMusic, MusicalArtist where LikesMusic.artist_id = MusicalArtist.id group by MusicalArtist.id order by likes asc;";

    $result = mysql_query($pupular_asc,$con);
    $i = 0;
    $popularity_points = "[";
    while($row = mysql_fetch_array($result)) {
        if($i != 0)
            $popularity_points = $popularity_points.",";
        $popularity_points = $popularity_points."[".$i.",".$row['likes']."]";
        $i++;
    }

    $popularity_points = $popularity_points."]";


    
    // NUMBER OF LIKES PER PERSON
    $sql_likes_per_person = "SELECT count(*) as likes FROM Person, LikesMusic WHERE LikesMusic.person_id = Person.id GROUP BY  Person.id ORDER BY likes DESC;";

    $result = mysql_query($sql_likes_per_person,$con);
    $i = 0;
    $max = 0;
    $people_likes_map = array();
    
    while($row = mysql_fetch_array($result)) {
        if($i == 0) {
            $max = intval($row['likes']);
            for($j = 0; $j <= $max; $j++)
                $people_likes_map[$j] = 0;
        }
            
        $people_likes_map[intval($row['likes'])]++;
        $i++;
    }
    
    $people_vs_artists_points = "[";
    for($j = 0; $j <= $max; $j++) {
        if($j != 0)
            $people_vs_artists_points = $people_vs_artists_points.",";
        $people_vs_artists_points = $people_vs_artists_points."[".$j.",".$people_likes_map[$j]."]";
    }
    $people_vs_artists_points = $people_vs_artists_points."]";
    
    

    // NUMBER OF LIKES PER ARTIST
    $sql_likes_per_artist = "SELECT count(*) as likes FROM MusicalArtist, LikesMusic WHERE LikesMusic.artist_id = MusicalArtist.id GROUP BY MusicalArtist.id ORDER BY likes DESC;";
    
    $result = mysql_query($sql_likes_per_artist,$con);
    $i = 0;
    $max = 0;
    $artists_likes_map = array();
    
    while($row = mysql_fetch_array($result)) {
        if($i == 0) {
            $max = intval($row['likes']);
            for($j = 0; $j <= $max; $j++)
                $artists_likes_map[$j] = 0;
        }
            
        $artists_likes_map[intval($row['likes'])]++;
        $i++;
    }
    
    $artists_vs_likes_points = "[";
    for($j = 0; $j <= $max; $j++) {
        if($j != 0)
            $artists_vs_likes_points = $artists_vs_likes_points.",";
        $artists_vs_likes_points = $artists_vs_likes_points."[".$j.",".$artists_likes_map[$j]."]";
    }
    $artists_vs_likes_points = $artists_vs_likes_points."]";

?>
<html>
    <head>
        <title> MC536 SocialNET - Estat&iacute;sticas</title>
        <script language="javascript" type="text/javascript" src="../flot/jquery.js"></script>
        <script language="javascript" type="text/javascript" src="../flot/jquery.flot.js"></script>
        <script type="text/javascript">

	$(function() {

		var d1 = <?php echo $popularity_points ?>;
        var d2 = <?php echo $people_vs_artists_points ?>;
        var d3 = <?php echo $artists_vs_likes_points ?>;


		$.plot("#artists_popularity", [{
			data: d1,
			lines: { show: true, fill: true }
		}]);
        
        $.plot("#peopleVSartists", [{
			data: d2,
			bars: { show: true, fill: true }
		}]);
        
        $.plot("#artistsVSlikes", [{
			data: d3,
			bars: { show: true, fill: true }
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
        
        
        <hr>
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
        
        
        <hr>
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
        
        
        <hr>
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
                        echo "<td>".$row['genre_id']."</td>";
                        echo "<td>".$row['genre_name']."</td>";
                        echo "<td>".$row['likes']."</td>";
                        echo "</tr>";
                    }
                ?>
        </table>
        
        
        <hr>
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
                        echo "<td>".$row['P1_login']."</td>";
                        echo "<td>".$row['P2_login']."</td>";
                        echo "<td>".$row['CommonLikes']."</td>";
                        echo "</tr>";
                    }
                ?>
        </table>
        
        
        <hr>
        <h2>Popularidade de Artistas</h2>
        <div id="artists_popularity" style="height:300px; width:400px"></div>
        
        
        <hr>
        <h2>N&uacute;mero de Pessoas que curtiram X artistas</h2>
        <div id="peopleVSartists" style="height:300px; width:400px"></div>
        
        
        <hr>
        <h2>N&uacute;mero de Artistas curtidos por exatamente X pessoas</h2>
        <div id="artistsVSlikes" style="height:300px; width:400px"></div>
        
    </body>
</html>
