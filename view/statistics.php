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
?>
<html>
    <head>
        <title> MC536 SocialNET - Estat&iacute;sticas</title>
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
    </body>
</html>
