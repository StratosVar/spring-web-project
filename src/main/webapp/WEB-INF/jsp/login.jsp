<!DOCTYPE html>
<html>
<head>
<title>Login</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>



<style>
  .navbar {
      padding-top: 15px;
      padding-bottom: 15px;
      border: 0;
      border-radius: 0;
      margin-bottom: 0;
      font-size: 12px;
      letter-spacing: 5px;
  }

  .navbar-nav  li a:hover {
      color: #1abc9c !important;
  }
</style>

</head>

<body>
	<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">Convers8</a>
    </div>
    <ul class="nav navbar-nav" align=right>
      <li class="active"><a href="#">Home</a></li>
      <li></li>
      <li><a href="#">Profile</a></li>
      <li><a href="#">Conversations</a></li>
      <li><a href="#">Logout</a></li>
    </ul>
  </div>
</nav>
  <center>
  <div class="container" align="center">
  <h2>Login</h2>
  <form class="form-inline" action="userCheck" method="POST">
    <div class="form-group">
      <label for="email">Usename:</label>
      <input type="username" class="form-control" id="username" placeholder="Enter username" name="username">
    </div>
    <br>
    <div class="form-group">
      <label for="pwd">Password:</label>
      <input type="password" class="form-control" id="pwd" placeholder="Enter password" name="pwd">
    </div>
    <br>
    
    
    <br>

    <button type="submit" class="btn btn-default" align="center">Submit</button>
  </form>
</div>
  </center>



</body>
</html>