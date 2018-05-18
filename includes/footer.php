
<div class="copy">
            <p> &copy; 2018 Orbit Technologies. All Rights Reserved | Design by <a href="http://w3layouts.com/" target="_blank">W3layouts</a> </p>	    </div>
		</div>
		</div>
		<div class="clearfix"> </div>
       </div>

<?php
if($page_type == "home"){
include"includes/css/type.footer.home.php";
}
elseif($page_type == "profile"){
include"includes/css/type.footer.profile.php";
}
else{
include"includes/css/type.footer.standard.php";
}
?>
   


<?php 
if($_SESSION['level'] <= $dev_bar_level){
echo"<div class='dev-footer'>";
echo"<p>Developer Footer: Visible only to users with P-Level <=" . $dev_bar_level . "</p>";
echo"</div>";
}
?>
</body>
</html>



