<?php
 
$method = $_GET['method'];
$name = $_GET['name'];
 
if ( isset ( $GLOBALS["HTTP_RAW_POST_DATA"] )) {
 
	// get bytearray
	$pdf = $GLOBALS["HTTP_RAW_POST_DATA"];
 
	// add headers for download dialog-box
	header('Content-Type: application/pdf');
	header('Content-Length: '.strlen($pdf));
	header('Content-disposition:'.$method.'; filename="'.$name.'"');
	echo $pdf;
 
}  else echo 'An error occured.';
 
?>