<?php
$mysql_user = "dspam";
$mysql_pass = "blah";
$dspam_database = "dspam";

// Open MySQL database
mysql_connect( 'localhost', $mysql_user, $mysql_pass )
  or die('Could not connect: ' . mysql_error());
mysql_select_db( $dspam_database )
  or die('Could not select database');

$query_res = mysql_query( "SELECT * FROM dspam_virtual_uids");
$wyn=mysql_num_rows($query_res);
for ($i=0;$i<$wyn;$i++){
        $baza=mysql_fetch_row($query_res);
//        var_dump($baza);
				for ($j=0;$j<count($baza);$j++){
					echo "$baza[$j]" ." "; 
				}
				echo "<br>";
}
?>

