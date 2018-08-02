<html>


<?php include 'header.php';?>

<?php require 'db.php'; ?>

<?php


$id = $_POST["id"];

echo "<br>";


$sql = "SELECT * FROM pilgrim where id = " . $id;
$result = mysqli_query($conn, $sql);

if (mysqli_num_rows($result) > 0) {
    // output data of each row
    while($row = mysqli_fetch_assoc($result)) {
        echo "Name: " .  $row["name"];
    }
} else {
    echo "0 results";
}

echo "<br>";


$sql = "SELECT * FROM pilgrim_points where pilgrim_id = " . $id;
$result = mysqli_query($conn, $sql);

$points = 0;

if (mysqli_num_rows($result) > 0) {
    // output data of each row
    while($row = mysqli_fetch_assoc($result)) {
        $points = $points + $row["points"];
		
    }
}

echo "Points: " . $points;

 ?>

</div>


</body>
</html>