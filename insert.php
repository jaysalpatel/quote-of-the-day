<?php
$servername = "[RDS ENDPOINT]";
$username   = "[username]";
$password   = "[password]";
$dbname     = "quote"

// create the connection
$conn  = new mysqli($servername, $username, $password, $dbname);

$Quote = $_POST['quote'];

$sql   = "INSERT INTO quotes (id, quote) VALUES (null, '$Quote')";

if (mysqli_query($conn, $mysql)) {
    echo "the quote is inserted";
}
else {
    echo 'It is not inserted';
}

header("refresh:2, url=index.php");

$conn->close();
?>