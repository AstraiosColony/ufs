<?php
$page_title = "Personnel ";
$include = $_SERVER['DOCUMENT_ROOT'] . "/app";
require $include . "/includes/load.php";
?>

        <!-- Page Content -->
        <div id="page-wrapper">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header"><?php echo $page_title; ?></h1>
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
