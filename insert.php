<?php
$servername = "localhost;";
$username = "username"; 
$password = "password";
$dbname = "quote";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

$word = $_POST['quote'];

$sql = "INSERT INTO quotes (id, quote) VALUES (null, '$quote')";

