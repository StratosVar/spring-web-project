<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="header.jsp"></c:import>

<style>
.st {
	
  padding-top:20px;
  padding-bottom:14%;
}



</style>



<center>
	<div class="st">

		<div class="container well" align="center">
				<c:if test="${login eq true}"> 		
				<h6>You have already logged in, but you must login again for security purposes</h6>
				</c:if>
				<c:if test="${registerSuccess eq true}"> 		
				<h6>You have successfully registered! Please log in</h6>
				</c:if>
			<div class="row">
				<div class="col-sm-4"></div>
				<div class="col-sm-4">
					<h2>Login</h2>
					<form class="form-inline" action="validation" method="post">
						<div class="form-group">
							<label for="email">Usename:</label> <input type="username"	class="form-control" id="username" placeholder="Enter username" name="username" required>
						</div>
						<br>
						<div class="form-group">
							<label for="pwd">Password:</label> <input type="password"
								class="form-control" id="pwd" placeholder="Enter password"
								name="pwd" required>
						</div>
						<br> <br>

						<button type="submit" class="btn btn-default" align="center">Submit</button>
					</form>
				</div>
				<div class="col-sm-4"></div>
			</div>
		</div>

		<div>
			<a href="">Forgot your password?</a><br>
		</div>
		<c:if test="${errorUsername == true}"> 		
		<h6>That username is already taken</h6>
		</c:if>	
		<c:if test="${usernameError == true}"> 		
		<h6>That username does not exist</h6>
		</c:if>
		<c:if test="${passwordError == true}"> 		
		<h6>Wrong password</h6>
		</c:if>
</center>

<c:import url="footer.jsp"></c:import>  