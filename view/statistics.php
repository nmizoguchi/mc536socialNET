<?php
    $err = null;
    error_reporting(E_ALL);
    ini_set('display_errors', 1);

    $con = mysql_connect("localhost:3306","mc536user07", "euzaraef") or die(mysql_error());
    $selected = mysql_select_db("mc536db07", $con);

    $sql = "select avg(rating), stddev(rating) from LikesMusic";
    $result = mysql_query($sql,$con);
    $rating_avg = mysql_fetch_array($result);
    $rating_avg = $rating_avg['avg(rating)'];
    $rating_stddev = mysql_fetch_array($result)['stddev(rating)'];

    $sql = "select LikesMusic.artist_id,MusicalArtist.artistic_name ,avg(LikesMusic.rating) from LikesMusic, MusicalArtist where LikesMusic.artist_id = MusicalArtist.id group by MusicalArtist.id order by avg(LikesMusic.rating) desc limit 20"    ;

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
                <td>M&eacute;dia</td>
                <td><?php echo $rating_stddev ?></td>
          </tr>
        </table>
    </body>
</html>
