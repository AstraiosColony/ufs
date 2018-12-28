<?php
$include = $_SERVER['DOCUMENT_ROOT'] . "/app";
require $include . "/includes/load.php";
?>

        <!-- Page Content -->
        <div id="page-wrapper">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">Blank</h1>
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
<div class="row">
                    <div class="col-lg-12">
                        
<?php
mysqli_set_charset( $db,"utf8" );

?>
                                        <table class="outline">
                                                    <tr class="box">
                                                                <th>Rank Name</th>
                                                                <th>Rank Logo</th>
                                                                </tr>
                                                                <?php
                                                                header( 'Content-type: text/html; charset=utf-8' );

$query = "SELECT rname, RankLogo FROM `Rank`"; //You don't need a ; like you do in SQL
$result = mysqli_query( $db,$query );

//	echo "<table>"; // start a table tag in the HTML

while( $row = mysqli_fetch_array( $result ) )
{
    //Creates a loop to loop through results
    echo "<tr><td>" . $row['rname'] . "</td><td>" . $row['RankLogo'] . "</td></tr>";  //$row['index'] the index here is a field name
}

//	echo "</table>"; //Close the table in HTML

mysqli_close(); //Make sure to close out the database connection
?>
</tr>
</table>




                    </div>
                    <!-- /.col-lg-12 -->
                </div>

                <!-- /.row -->
            </div>
            <!-- /.container-fluid -->
        </div>
        <!-- /#page-wrapper -->


<?php
require $include . "/includes/footer.php";
?>
