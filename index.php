<?php 	
require_once('config/database.php');
$db = new database();
$param_category = $db->getRelation();
$getUser = $db->getUser();

?>
<!doctype html>
<html lang="en">

<head>
	<!-- Required meta tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
		integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

	<title>Hello, world!</title>
</head>

<body>
	<div class="container">
		<div class="jumbotron">
			<h1 class="display-4">Hello, world!</h1>
			<p class="lead">Belum dikasih validasi dan lain2, mohon diisi semua. :)</p>
		</div>
		<form class="form-horizontal" method="POST" action="save.php">
			<h1>PILIH USER DULU</h1>
			<?php
				foreach( $getUser as $item ){
					echo '<div class="radio">
							  <label><input type="radio" value="'.$item['id'].'" name="user"> '.$item['usr_name'].'</label>
							</div>';
				}
			?>
			<?php
				$same = '';
				foreach($param_category as $item){
				echo ($same != $item["name"]) ? '<hr><h1>'.$item["name"].'</h1>' : '';
			?>
				<div class="row form-group">
					<label class="control-label col-sm-2" for="email"><?php echo $item['quest_title'] ?></label>
					<div class="col-sm-10">
						<?php if($item['quest_type'] == "text"){ ?>
							<?php foreach( json_decode($item['quest_instrument']) as $val ){ ?>
								<div style="display: inline-flex;">
									<label class="col-sm-4"><?php echo $val->question; ?></label>
									<div class="col-sm-4"><input type="text" class="form-control" name="req[<?php echo $item['id']; ?>][<?php echo $val->name; ?>]"></div>
									<label class="col-sm-4"><?php echo $val->unit; ?></label>
								</div>
								<br>
							<?php } ?>

						<?php }elseif($item['quest_type'] == "radio"){ ?>
							<?php foreach( json_decode($item['quest_instrument'])->options as $val ){ ?>
								<div class="radio">
								  <label><input type="radio" value="<?php echo $val ?>" name="req[<?php echo $item['id']; ?>][<?php echo json_decode($item['quest_instrument'])->name ?>]"> <?php echo $val ?></label>
								</div>
							<?php } ?>

						<?php }elseif($item['quest_type'] == "checkbox"){ ?>
							<?php foreach( json_decode($item['quest_instrument'])->options as $val ){ ?>
							<div class="checkbox">
							  <label><input type="checkbox" value="<?php echo $val ?>" name="req[<?php echo $item['id']; ?>][<?php echo json_decode($item['quest_instrument'])->name ?>][]" value=""> <?php echo $val ?></label>
							</div>
							<?php } ?>

						<?php }elseif($item['quest_type'] == "table"){ ?>
							<table class="table">
								<thead>
									<tr>
									<?php foreach( json_decode($item['quest_instrument'])->header as $val ){ ?>
										<th><?php echo $val ?></th>
									<?php } ?>
									</tr>
								</thead>
								<tbody>
									<?php foreach( json_decode($item['quest_instrument'])->row as $val ){ ?>
									<tr>
										<?php foreach( $val as $v ){ ?>
										<?php 
											if($v === end($val)) {
												echo "<td><input type='text' class='form-control' name='req[".$item['id']."][".json_decode($item['quest_instrument'])->name."][]'></td>";
											}else{
												echo "<td>".$v."</td>";
											}
										?>
										<?php } ?>
									</tr>
									<?php } ?>
								</tbody>
							</table>
						<?php } ?>
					</div>
				</div>

			<?php 
			$same = $item['name'];
				} 
			?>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<button type="submit" class="btn btn-primary">Submit</button>
				</div>
			</div>
		</form>
	</div>

	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous">
	</script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
		integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous">
	</script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
		integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous">
	</script>
</body>

</html>
<!-- <table border="1">
		<tr>
			<th>No</th>
			<th>Name</th>
			<th>Brand</th>
			<th>Category</th>
			<th>Attribute</th>
			<th>Action</th>
		</tr>
		<?php 
		$no = 1;
		foreach($data as $item){
			?>
			<tr>
				<td><?php echo $no++; ?></td>
				<td><?php echo $item['name']; ?></td>
				<td><?php echo $item['brand_id']; ?></td>
				<td><?php echo $item['category_id']; ?></td>
				<td><?php echo $item['attributes']; ?></td>
				<td>
					<a href="edit.php?id=<?php echo $item['id']; ?>">Update</a>
					<a href="hapus.php?id=<?php echo $item['id']; ?>">Delete</a>
				</td>
			</tr>
			<?php 
		}
		?>
	</table>
</body> -->
<!-- 
// #PARAM_CATEGORY
        // ID  NAME        TYPE        STATUS
        // 1   MATA        CHECKBOX    TRUE
        // 2   TELINGA     CHECKBOX    TRUE

        // #QUESTION
        // ID  PARAM_CAT_ID     QUEST_TITLE    TYPE    INSRUMENT        STATUS
        // 1   1               TABLE                    TRUE
        // 2   
        // 3   
        // 4   
        // 5  

        $detail = [
            "header" => ["param","sub-param",'value'],
            "row" => [
                ['satu','sub-satu','0'],
                ['dua','sub-dua','0'],
                ['tiga','sub-tiga','0'],
                ['empat','sub-empat','0'],
                ['lima','sub-lima','0'],
            ]
        ]; -->