<?php
$servername = "[localhost]";
$username = "[username]";
$password = "[password]";
$dbname = "[quote]";

$conn = new mysqli($servername, $username, $password, $dbname);
//Check connection
if($conn->connect_error) {
    die("connection failed: " . $conn->connect_error);

}

$sql = "SELECT quote FROM quotes ORDER BY rand() LIMIT 1";

foreach($conn->query($mysql) as $row) {
        print $row['quote'];
}

$conn->close();
?>
