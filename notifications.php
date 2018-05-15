<?php

if(isset($_POST["view"]))
{
 include("config.php");
 if($_POST["view"] != '')
 {
  $update_query = "UPDATE notifications SET notifications_status=1 WHERE notifications_status=0";
  mysqli_query($db, $update_query);
 }
 $query = "SELECT * FROM notifications ORDER BY notifications_id DESC LIMIT 5";
 $result = mysqli_query($db, $query);
 $output = '';
 
 if(mysqli_num_rows($result) > 0)
 {
  while($row = mysqli_fetch_array($result))
  {
  
     }
 }
 else
 {
  $output .= '<li><a href="#" class="text-bold text-italic">No Notification Found</a></li>';
 }
 
 $query_1 = "SELECT * FROM notifications WHERE notifications_status=0";
 $result_1 = mysqli_query($db, $query_1);
 $count = mysqli_num_rows($result_1);
 $data = array(
  'notification'   => $output,
  'unseen_notification' => $count
 );
 echo json_encode($data);
}
?>