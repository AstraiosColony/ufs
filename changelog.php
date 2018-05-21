<?php
/*
* Copyright 2018 Orbital Group
*
*   Licensed under the Apache License, Version 2.0 (the "License");
*   you may not use this file except in compliance with the License.
*   You may obtain a copy of the License at
*
*       http://www.apache.org/licenses/LICENSE-2.0
*
*   Unless required by applicable law or agreed to in writing, software
*   distributed under the License is distributed on an "AS IS" BASIS,
*   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
*   See the License for the specific language governing permissions and
*   limitations under the License.
*
*
*/

$page_type = "standard";
$page_title = "Changelog";
require"includes/load.php";
/// And Away We Go


?>


		 <div id="page-wrapper" class="gray-bg dashbard-1">


<div class="content-main">
 
 	<!--banner-->	
		     <div class="banner">
		    	<h2>
				<a href="index.php">Home</a>
				<i class="fa fa-angle-right"></i>
				<span>Changelog</span>
				</h2>
		    </div>
		<!--//banner-->
 	 <!--faq-->
 	<div class="blank">
	
<style>


/* The actual timeline (the vertical ruler) */
.changelog-timeline {
    position: relative;
    max-width: 1200px;
    margin: 0 auto;
}

/* The actual timeline (the vertical ruler) */
.changelog-timeline::after {
    content: '';
    position: absolute;
    width: 6px;
    background-color: black;
    top: 0;
    bottom: 0;
    left: 50%;
    margin-left: -3px;
}

/* Container around content */
.changelog-container {
    padding: 10px 40px;
    position: relative;
    background-color: inherit;
    width: 50%;
}

/* The circles on the timeline */
.changelog-container::after {
    content: '';
    position: absolute;
    width: 25px;
    height: 25px;
    right: -17px;
    background-color: white;
    border: 4px solid #FF9F55;
    top: 15px;
    border-radius: 50%;
    z-index: 1;
}

/* Place the container to the left */
.changelog-left {
    left: 0;
}

/* Place the container to the right */
.changelog-right {
    left: 50%;
}

/* Add arrows to the left container (pointing right) */
.changelog-left::before {
    content: " ";
    height: 0;
    position: absolute;
    top: 22px;
    width: 0;
    z-index: 1;
    right: 30px;
    border: medium solid blue;
    border-width: 10px 0 10px 10px;
    border-color: transparent transparent transparent blue;
}

/* Add arrows to the right container (pointing left) */
.changelog-right::before {
    content: " ";
    height: 0;
    position: absolute;
    top: 22px;
    width: 0;
    z-index: 1;
    left: 30px;
    border: medium solid blue;
    border-width: 10px 10px 10px 0;
    border-color: transparent blue transparent transparent;
}

/* Fix the circle for containers on the right side */
.changelog-right::after {
    left: -16px;
}

/* The actual content */
.changelog-content {
    padding: 20px 30px;
    background-color: Tomato;
    position: relative;
    border-radius: 6px;
    color: White;
}
p.changelog-paragraph {
    color: white;
}

/* Media queries - Responsive timeline on screens less than 600px wide */
@media screen and (max-width: 600px) {
  /* Place the timelime to the left */
  .changelog-timeline::after {
    left: 31px;
  }
  
  /* Full-width containers */
  .changelog-container {
    width: 100%;
    padding-left: 70px;
    padding-right: 25px;
  }
  
  /* Make sure that all arrows are pointing leftwards */
  .changelog-container::before {
    left: 60px;
    border: medium solid blue;
    border-width: 10px 10px 10px 0;
    border-color: transparent blue transparent transparent;
  }

  /* Make sure all circles are at the same spot */
  .changelog-left::after, .right::after {
    left: 15px;
  }
  
  /* Make all right containers behave like the left ones */
  .changelog-right {
    left: 0%;
  }
}
</style>

			<div class="blank-page">
				

<div class="changelog-timeline">
  <div class="changelog-container changelog-left">
    <div class="changelog-content">
      <h2>May 2018</h2>
      <p class="changelog-paragraph">Beta Version 0.0.3, More Core Features Added</p>
    </div>
  </div>
  <div class="changelog-container changelog-right">
    <div class="changelog-content">
      <h2>April 2018</h2>
      <p class="changelog-paragraph">Beta Version 0.0.2, More Core Features Added</p>
    </div>
  </div>
</div>
	        </div>
	       </div>
	
	<!--//faq-->

	




<?php
include"includes/footer.php";
?>
