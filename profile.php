<?php
$page_type = "profile";
$page_title = "Profile ";
require"includes/load.php";
$profile = new Profile;

?>


		 <div id="page-wrapper" class="gray-bg dashbard-1">


<div class="content-main">
 
 	<!--banner-->	
		     <div class="banner">
		    	<h2>
				<a href="index.php">Home</a>
				<i class="fa fa-angle-right"></i>
				<span>Profile</span>
				</h2>
		    </div>
		<!--//banner-->
 	 <!--faq-->
 	


<div class=" profile">

		<div class="profile-bottom">
			<h3><i class="fa fa-user"></i>Profile</h3>
			<div class="profile-bottom-top">
		<div class="col-md-4 profile-bottom-img">

				<img src="resources/uploads/default.png" alt="Profile Picture">

			</div>

			<div class="col-md-8 profile-text">
				<h6><?php echo $_SESSION['display_name']; ?></h6>
				<table>
				<tr>
      <td>Username</td>
      <td>:</td>
      <td><?php echo $_SESSION['username']; ?></td>
   </tr>
   <tr>
      <td>Division</td>
      <td>:</td>
      <td><?php GetUserDivision($_SESSION['div_id']); ?></td>
   </tr>
   <tr>
      <td>Rank</td>
      <td> :</td>
      <td><?php GetUserRank($_SESSION['rank_id']); ?></td>
   </tr>
   <tr>
      <td>Title</td>
      <td> : </td>
      <td><?php GetUserTitle($_SESSION['title_id']); ?></td>
      <td></td>
   </tr>
   <tr>
      <td>Email</td>
      <td> :</td>
      <td><?php echo $_SESSION['email']; ?></td>
   </tr>

				</table>
			</div>
			<div class="clearfix"></div>
			</div>
			<div class="profile-bottom-bottom">
			<div class="col-md-4 profile-fo">
				<h4></h4>
				<p>Followers</p>
				<a href="#" class="pro"><i class="fa fa-plus-circle"></i>Follow</a>
			</div>
			<div class="col-md-4 profile-fo">
				<h4>348</h4>
				<p>Following</p>
				<a href="#" class="pro1"><i class="fa fa-user"></i>View Profile</a>
			</div>
			<div class="col-md-4 profile-fo">
				<h4>23,5k</h4>
				<p>Snippets</p>
				<a href="#"><i class="fa fa-cog"></i>Options</a>
			</div>
			<div class="clearfix"></div>
			</div>
			<div class="profile-btn">

                <button type="button" href="#" class="btn bg-red">Save changes</button>
           <div class="clearfix"></div>
			</div>
			 
			
		</div>
	</div>
	<!--//gallery-->


<?php
include"includes/footer.php";
?>
