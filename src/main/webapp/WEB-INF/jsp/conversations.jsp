
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>



<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>







<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<meta charset="utf-8">

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Conversations</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style type="text/css">
<
style>.bs-example {
	margin: 20px;
}

.bg-4 {
	background-color: #2f2f2f;
	color: #fff;
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
</style>

</head>
<body>
	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">Conves8</a>
			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav">
					<li><a href="#">Home</a></li>

					<li><a href="#">Profile</a></li>
					<li class="active"><a href="#">Conversations</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#"><span class="glyphicon glyphicon-log-in"></span>
							Logout</a></li>
				</ul>
			</div>
		</div>
	</nav>


















	<div class="container-fluid">
		<div class="col-sm-3 sidenav"></div>



		<div class="col-sm-9 sidenav">





			<div class="container-fluid" style="height: 450px">
				<div class="bs-example">
					<table class="table table-hover" id="myTable">
						<thead>
							<div class="container"></div>
							<tr>
								<th>Id</th>
								<th>Title</th>
								<th>Creator</th>
								<th>Interlocutor</th>
								<th></th>

							</tr>
						</thead>
						<tbody>


							<c:forEach var="conversation" items="${conversations}">

								<!-- construct an "update" link with customer id -->
								<c:url var="startConversation" value="/showConversation" >
									<c:param name="conversationId" value="${conversation.id}"  />
							
								</c:url>


								<tr>
									<td>${conversation.id}</td>
									<td>${conversation.title}</td>
									<td>${conversation.creator}</td>
									<td>${conversation.interlocutor}</td>
									<td><a href="${startConversation}">Conversation</a>
									<td>
								</tr>



							</c:forEach>

						</tbody>
					</table>
				</div>

			</div>










		</div>

	</div>






	<footer class="container-fluid bg-4 text-center">
		<p>
			Site Made By <a href="https://www.w3schools.com">www.A-team.com</a>
		</p>
	</footer>



</body>
</html>