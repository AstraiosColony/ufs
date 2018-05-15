<?php
$page_type = "standard";
$page_title = "Blog";
include"includes/load.php";
$posts = mysqli_query($db, "SELECT * FROM posts ORDER BY posted ASC");
?>

		 <div id="page-wrapper" class="gray-bg dashbard-1">


<div class="content-main">
 
 	<!--banner-->	
		     <div class="banner">
		    	<h2>
				<a href="index.php">Home</a>
				<i class="fa fa-angle-right"></i>
				<span>Blog</span>
				</h2>
		    </div>
		<!--//banner-->
 	 <!--faq-->
<div class="asked">
	

						 		 
<?php

if ($posts->num_rows > 0 AND $posts->num_rows < 8) {
    while($row = $posts->fetch_assoc()) {
        

echo"<div class='questions'>";
echo"<h5>" . $row["title"] . "</h5>";
echo"<p>" . $row["text"] . "</p>";
echo"</div>";

    }
} else {
    echo "Error";
}
?>

</div>



 		       </div>
	
	<!--//faq-->

	




<?php
include"includes/footer.php";
?>

