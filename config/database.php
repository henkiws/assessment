<?php
class database{
 
	var $host = "localhost";
	var $username = "root";
	var $password = "";
	var $database = "formulir";
   var $koneksi = "";
   
	function __construct(){
		$this->koneksi = mysqli_connect($this->host, $this->username, $this->password,$this->database);
		if (mysqli_connect_errno()){
			echo "Koneksi database gagal : " . mysqli_connect_error();
		}
	}
 
	function getDataAll($table)
	{
		$data = mysqli_query($this->koneksi,"SELECT * FROM ".$table);
		while($row = mysqli_fetch_array($data)){
			$hasil[] = $row;
		}
		return $hasil;
   }
   
   function getDataWhere($table,$column,$operator,$where)
   {
      $data = mysqli_query($this->koneksi,"SELECT * FROM ".$table." WHERE ".$column." ".$operator." ".$where);
		while($row = mysqli_fetch_array($data)){
			$hasil[] = $row;
		}
		return $hasil;
   }

   function getRelation()
	{
		$data = mysqli_query($this->koneksi,"SELECT * FROM param_category a, question b WHERE a.id = b.param_cat_id ORDER BY b.param_cat_id");
		while($row = mysqli_fetch_array($data)){
			$hasil[] = $row;
		}
		return $hasil;
   }

//    INSERT INTO `e_store`.`products`(
//       `name` ,
//       `brand_id` ,
//       `category_id` ,
//       `attributes`
//   )
//   VALUES(
//       'Dreamer' ,
//       '1' ,
//       '1' ,
//       '{"screen": "30 inch", "resolution": "1600 x 900 pixles", "ports": {"hdmi": 1, "usb": 1}, "speakers": {"left": "10 watt", "right": "10 watt"}}'
//   );
#KODE
// INSERT INTO `e_store`.`products`(
//    `name` ,
//    `brand_id` ,
//    `category_id` ,
//    `attributes`
// )
// VALUES(
//    'Desire' ,
//    '2' ,
//    '2' ,
//    JSON_OBJECT(
//        "network" ,
//        JSON_ARRAY("GSM" , "CDMA" , "HSPA" , "EVDO") ,
//        "body" ,
//        "5.11 x 2.59 x 0.46 inches" ,
//        "weight" ,
//        "143 grams" ,
//        "sim" ,
//        "Micro-SIM" ,
//        "display" ,
//        "4.5 inches" ,
//        "resolution" ,
//        "720 x 1280 pixels" ,
//        "os" ,
//        "Android Jellybean v4.3"
//    )
// );
#SAMPLE
// *HASIL
// {
// 	"os": "Android Jellybean v4.3",
// 	"sim": "Micro-SIM",
// 	"body": "5.11 x 2.59 x 0.46 inches",
// 	"weight": "143 grams",
// 	"display": "4.5 inches",
// 	"network": ["GSM", "CDMA", "HSPA", "EVDO"],
// 	"resolution": "720 x 1280 pixels"
// }
}

// #SEARCH IN JSON
// SELECT
//     *
// FROM
//     `products`
// WHERE
//     `category_id` = 1
// AND JSON_EXTRACT(`attributes` , '$.ports.usb') > 0
// AND JSON_EXTRACT(`attributes` , '$.ports.hdmi') > 0;

// #UPDATE
// UPDATE `products`
// SET `attributes` = JSON_INSERT(
//     `attributes` ,
//     '$.chipset' ,
//     'Qualcomm'
// )
// WHERE
//     `category_id` = 2;

// #REPLACE
// UPDATE `e_store`.`products`
// SET `attributes` = JSON_REPLACE(
//     `attributes` ,
//     '$.chipset' ,
//     'Qualcomm Snapdragon'
// )
// WHERE
//     `category_id` = 2;
// #SET
// UPDATE `e_store`.`products`
// SET `attributes` = JSON_SET(
//     `attributes` ,
//     '$.body_color' ,
//     'red'
// )
// WHERE
//     `category_id` = 1;

//     The JSON_INSERT function will only add the property to the object if it does not exists already.

// The JSON_REPLACE function substitutes the property only if it is found.

// The JSON_SET function will add the property if it is not found else replace it.


// #REMOVE
// UPDATE `e_store`.`products`
// SET `attributes` = JSON_REMOVE(`attributes` , '$.mount_type')
// WHERE
//     `category_id` = 3;
?>
