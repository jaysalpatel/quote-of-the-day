<html>
<body>
<h1 style="color:blue;">Welcome to the word of the day</h1>
<p style="color:green;" style="font:verdana;">Here is your word</p>

<?php include ('query.php'); ?>

<br/>
<br/>

</body>
    <form action="insert.php" method="POST">
    The other option is to type in your own word : <input type="text" name="word">
    <br/>
    <input type="submit" value="Insert">
    </form>

</html>