<html>
<body>

<h1>Welcome to your quote of the day</h1>
<p>here is your randomly selected quote</p>

<?php include ('query.php'); ?>
<br />
<br />
<br />
</body>

    <form action="insert.php" method="POST">
     or input your own quote: <input type="text" name="quote">
     <br/>
     <input type="submit" value="insert">  
    </form>
</html>