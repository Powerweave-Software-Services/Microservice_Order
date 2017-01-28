<?php
$servername = "mysql4.gear.host";
$username = "gitapi";
$password = "Lo96a!m0?8MM";
$dbname = "gitapi";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
} 
//$conn->query("INSERT INTO orders (orderdate,user,total,orderdateid) VALUES ('".date('Y-m-d h:i:s')."', '', '2','1')");

function createorder($item, $conn){
	$createddate = date('Y-m-d h:i:s');
	$createddateid = date('Ymdhis');
	$total=0;
	$itemsdata = explode("|", $item);
	foreach($itemsdata as $itemsda){
		$itemdetail = explode("_", $itemsda);
		$itemcost=$itemdetail[1]*$itemdetail[2];
		$total=$total+$itemcost;
		
	}
	//echo $total;
	//print_r($itemsdata);
	
	//echo "INSERT INTO orders (orderdate,user,total,orderdateid) VALUES ('".$createddate."', '', '".$total."','".$createddateid."')";
	$conn->query("INSERT INTO orders (orderdate,user,total,orderdateid) VALUES ('".$createddate."', '', '".$total."','".$createddateid."')");
	
	foreach($itemsdata as $itemsda){
		$itemdetail = explode("_", $itemsda);
		//echo "INSERT INTO orderitems (orderid, itemname,qty,price) VALUES ((select orders.id from orders where orderdateid = '$createddateid'), '$itemdetail[0]','$itemdetail[1]','$itemdetail[2]')";
		$conn->query("insert into orderitems (orderid, itemname,qty,price) VALUES ((select id from orders where orderdateid = '$createddateid'), '$itemdetail[0]','$itemdetail[1]','$itemdetail[2]')");
	}
	
	echo "Order added successfully <a href='Orders_api.php'>Click Here to view orders</a>";
	
}


function showorders($conn){
	$result=$conn->query('select * from orders');
	$orders="";
	$i=0;
	while($row = $result->fetch_assoc()){
		
		/*items*/
		$orderitems = "";
			$resulti=$conn->query('select * from orderitems where orderid="'.$row['id'].'"');
			while($rowi = $resulti->fetch_assoc()){
				$orderitems[] = array('Id'=>$rowi['itemid'], 'Name'=>$rowi['itemname'], 'Quantity'=>$rowi['qty'],'Price'=>$rowi['price']);
			}
		
		$orders[]=array('OrderId'=>$row['id'],'OrderDate'=>$row['orderdate'],'OrderTotal'=>$row['total'],'Items'=>$orderitems);
	}
	return json_encode($orders);
}

$item = "";
$addorder = isset($_REQUEST['order']) ? $_REQUEST['order']:"";
//echo $addorder;
if($addorder=='1'){
	$itemdata = isset($_REQUEST['item']) ? $_REQUEST['item']:"";
	if($itemdata!=''){
		$item = $_REQUEST['item'];
	}else{$item = "Product4_80_5|Product8_20_10";}
	//echo $item;
	createorder($item, $conn);
	exit;
}
print_r(showorders($conn));
?>
