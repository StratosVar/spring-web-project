<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html lang="en">
<head>
  <title>Messages</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>


<style>
  #bottom-right
{
right: 0;
bottom: 0;
position: absolute;
}

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


h1.c {
    font-style: oblique;
}


footer {
      background-color: #555;
      color: white;
      padding: 15px;
    }

</style>

<!--<style>
.box {
            display: flex;
            justify-content: flex-start;
          }

</style> -->

</head>
<body>

  <!--<div class="jumbotron text-center">
      <img src="f1.jpeg" class="img-rounded">

    <div id=”bottom-right”></div>

  <h1 class="c">User Profile</h1>

</div>-->
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="#">Home</a>
    </div>
    
      <form class="navbar-form navbar-right" role="search">
        <div class="form-group input-group">
          <input type="text" class="form-control" placeholder="Search..">
          <span class="input-group-btn">
            <button class="btn btn-default" type="button">
              <span class="glyphicon glyphicon-search"></span>
            </button>
          </span>        
        </div>
      </form>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#"><span class="glyphicon glyphicon-user"></span> My Account</a></li>
      </ul>
    </div>
  </div>
</nav>


   
<div class="row">
   <div class="col-sm-2 well">
    <div class="container">
      <div>
         <img src="ronaldo.jpg" class="img-circle" alt="Cinque Terre" width="100" height="100"> 
          <p>Christiano Ronaldo</p> 

      </div>
    </div>
   </div>
<div class="col-sm-8"></div>

   <div class="col-sm-2">
    <div class="btn-group" role="group">
      <button id="btnGroupDrop1" align="right" type="button" class="btn btn-secondary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
      Dropdown
      </button>
        <div class="dropdown-menu" aria-labelledby="btnGroupDrop1">
          <a class="dropdown-item" href="#">ropdown settings</a>
          <a class="dropdown-item" href="#">Dropdown logout</a>
        </div>
    
    </div>
   </div>
</div>



<div class="row ">
    <div class="col-sm-2">

  
        <div class="container">
              <div class="col-sm-2">

                  <a href="#">Contacts</a><br>
                   <a href="#">About</a><br>
                    <a href="#">User details </a>
        
        

                    
                </div>
              <div class="col-sm-10"></div>

         </div>
     </div>
</div>
	<div class="container">

		<div class="panel-group">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h4 class="panel-title">
						<a data-toggle="collapse" href="#collapse1"> Received
							Messages&ensp;&ensp;<span class="badge">5</span>
						</a>
					</h4>
				</div>

				<div id="collapse1" class="panel-collapse collapse">
					<div class="row">
						<div class="col-sm-2">
							<div class="panel-body">
								<div class="checkbox">
									<label><input type="checkbox" value=""></label>
								</div>
							</div class="col-sm-10">
							Bill
						</div>
					</div>
					<table class="table">
						<thead>
							<tr>
								<th scope="col">#</th>
								<th scope="col">First</th>
								<th scope="col">Last</th>
								<th scope="col">Handle</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${list}" var="item">

								<tr>
									<th scope="row">1</th>
									<td>${item.id} </td>
									<td>${item.title}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<div class="container">

		<div class="panel-group">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h4 class="panel-title">
						<a data-toggle="collapse" href="#collapse2">Sent
							Messages&ensp;&ensp;<span class="badge">10</span>
						</a>
					</h4>
				</div>
				<div id="collapse2" class="panel-collapse collapse">
					<div class="panel-body">Alex</div>
					<div class="panel-footer">George</div>
				</div>
			</div>
		</div>
	</div>
	<div class="panel-footer navbar-inverse navbar-fixed-bottom">
<footer class="container-fluid bg-4 text-center">
  <p>Site Made By <a href="https://www.teamA.com">www.teamA.com</a></p> 
</footer>
</div>




</body>
</html>



