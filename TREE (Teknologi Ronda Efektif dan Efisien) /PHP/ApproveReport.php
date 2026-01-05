<?php
include "../PHP/Config.php";
$id = $_POST['id'];
$sql = "UPDATE reports SET status='Diterima' WHERE reportId=$id";
$conn->query($sql);
echo "ok";
?>
