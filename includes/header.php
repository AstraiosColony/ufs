<!DOCTYPE HTML>
<html>
<head>
<title><?php echo $page_title . " | " . $client_name . " | Orbital RP System"; ?></title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="Description" content="Orbital is a open-source roleplay system for United Federation Starfleet's use in Second Life and OpenSimulator">
<meta name="Keywords" content="Orbital, Second Life, Roleplay, United Federation, United Federation Starfleet, UFS, UF Starfleet, Star Trek">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="apple-touch-icon" sizes="57x57" href="/apple-icon-57x57.png">
<link rel="apple-touch-icon" sizes="60x60" href="resources/images/favicon/apple-icon-60x60.png">
<link rel="apple-touch-icon" sizes="72x72" href="resources/images/favicon/apple-icon-72x72.png">
<link rel="apple-touch-icon" sizes="76x76" href="resources/images/favicon/apple-icon-76x76.png">
<link rel="apple-touch-icon" sizes="114x114" href="resources/images/favicon/apple-icon-114x114.png">
<link rel="apple-touch-icon" sizes="120x120" href="resources/images/favicon/apple-icon-120x120.png">
<link rel="apple-touch-icon" sizes="144x144" href="resources/images/favicon/apple-icon-144x144.png">
<link rel="apple-touch-icon" sizes="152x152" href="resources/images/favicon/apple-icon-152x152.png">
<link rel="apple-touch-icon" sizes="180x180" href="resources/images/favicon/apple-icon-180x180.png">
<link rel="icon" type="image/png" sizes="192x192"  href="resources/images/favicon/android-icon-192x192.png">
<link rel="icon" type="image/png" sizes="32x32" href="resources/images/favicon/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="96x96" href="resources/images/favicon/favicon-96x96.png">
<link rel="icon" type="image/png" sizes="16x16" href="resources/images/favicon/favicon-16x16.png">
<link rel="manifest" href="resources/images/favicon/manifest.json">
<meta name="msapplication-TileColor" content="#ffffff">
<meta name="msapplication-TileImage" content="resources/images/favicon/ms-icon-144x144.png">
<meta name="theme-color" content="#ffffff">
<?php
if($page_type == "home"){
require"css/type.home.php";
}
elseif($page_type == "profile"){
require"css/type.profile.php";
}
else{
require"css/type.standard.php";
}
?>

<?php 
if($_SESSION['level'] <= $dev_bar_level){
echo"<link href='resources/css/dev-bar.css' rel='stylesheet' type='text/css' />";
}
?>
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
</head>
<body>
<div id="wrapper">
      <!----->
        <nav class="navbar-default navbar-static-top" role="navigation">
             <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
               <h1> <a class="navbar-brand" href="index">Orbital</a></h1>         
			   </div>
			 <div class=" border-bottom">
        	<div class="full-left">
        	  <section class="full-top">
				<button id="toggle"><i class="fa fa-arrows-alt"></i></button>	
			</section>
			<form class=" navbar-left-right">
              <input type="text"  value="Search..." onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Search...';}">
              <input type="submit" value="" class="fa fa-search">
            </form>
            <div class="clearfix"> </div>
           </div>
     
       
            <!-- Brand and toggle get grouped for better mobile display -->
		 
		   <!-- Collect the nav links, forms, and other content for toggling -->
		    <div class="drop-men" >
		        <ul class=" nav_1">
		           
		    		<li class="dropdown at-drop">
		              <a href="#" class="dropdown-toggle dropdown-at " data-toggle="dropdown"><i class="fa fa-globe"></i> <span class="number">5</span></a>
		              <ul class="dropdown-menu menu1 " role="menu">
		                <li><a href="#">
		               
		                	<div class="user-new">
		                	<p>New user registered</p>
		                	<span>40 seconds ago</span>
		                	</div>
		                	<div class="user-new-left">
		                
		                	<i class="fa fa-user-plus"></i>
		                	</div>
		                	<div class="clearfix"> </div>
		                	</a></li>
		                <li><a href="#">
		                	<div class="user-new">
		                	<p>Someone special liked this</p>
		                	<span>3 minutes ago</span>
		                	</div>
		                	<div class="user-new-left">
		                
		                	<i class="fa fa-heart"></i>
		                	</div>
		                	<div class="clearfix"> </div>
		                </a></li>
		                <li><a href="#">
		                	<div class="user-new">
		                	<p>John cancelled the event</p>
		                	<span>4 hours ago</span>
		                	</div>
		                	<div class="user-new-left">
		                
		                	<i class="fa fa-times"></i>
		                	</div>
		                	<div class="clearfix"> </div>
		                </a></li>
		                <li><a href="#">
		                	<div class="user-new">
		                	<p>The server is status is stable</p>
		                	<span>yesterday at 08:30am</span>
		                	</div>
		                	<div class="user-new-left">
		                
		                	<i class="fa fa-info"></i>
		                	</div>
		                	<div class="clearfix"> </div>
		                </a></li>
		                <li><a href="#">
		                	<div class="user-new">
		                	<p>New comments waiting approval</p>
		                	<span>Last Week</span>
		                	</div>
		                	<div class="user-new-left">
		                
		                	<i class="fa fa-rss"></i>
		                	</div>
		                	<div class="clearfix"> </div>
		                </a></li>
		                <li><a href="#" class="view">View all messages</a></li>
		              </ul>
		            </li>
					<li class="dropdown">
		              <a href="#" class="dropdown-toggle dropdown-at" data-toggle="dropdown"><span class=" name-caret"><?php echo $_SESSION['username']; ?><i class="caret"></i></span><img src="resources/images/wo.jpg"></a>
		              <ul class="dropdown-menu " role="menu">
		                <li><a href="profile"><i class="fa fa-user"></i>Edit Profile</a></li>
<li><a href="settings"><i class="fa fa-cogs"></i>Settings</a></li>

		                <li><a href="login?logout=true"><i class="fa fa-envelope"></i>Logout</a></li>
	
		                
		              </ul>
		            </li>
		           
		        </ul>
		     </div><!-- /.navbar-collapse -->
			<div class="clearfix">
       
     </div>