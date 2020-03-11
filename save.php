<?php
	require_once('config/database.php');
	$db = new database();

	$user = $_REQUEST['user'];
	$req = $_REQUEST['req'];


	$db->insertResult($user);
	$lastResult = $db->getLastResult();
	// $lastResult[0]['id'] // GET ID

	$temp = '';
	foreach( $req as $key => $item ){
		$temp .= "(null, ".$lastResult[0]['id'].", ".$key.",".json_encode(json_encode($item)).",current_timestamp()),";
	}
	$final = rtrim($temp,',');
	$result = $db->insertAssesment($final,$lastResult[0]['id']);
	

	print_r('<pre>');
	print_r($result);
	print_r('</pre>');

	// AKAN LEBIH MUDAH JIKA MENGGUNAKAN FRAMEWORK, MUNGKIN KODE BISA LEBIH DIRINGKAS LAGI :)
	// TERIMA KASIH, SAYA TUNGGU KABAR BAIKNYA :))

?>