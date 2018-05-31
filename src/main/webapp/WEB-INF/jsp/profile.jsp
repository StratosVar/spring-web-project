<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:import url="header.jsp"></c:import>  

<section class="jumbotron">
	<div class="container" >
		<div class="row input-parent ">


			<div class="col-sm-6 profile_box">
				<div class="image_input">

				<div align="center"> 
					<img alt="User Pic" src="https://x1.xingassets.com/assets/frontend_minified/img/users/nobody_m.original.jpg" id="profile-image1" class="img-circle img-responsive"> 
				
					<input id="profile-image-upload" class="hidden" type="file">

						<script>
					$(function() {
						$('#profile-image1').on('click', function() {
							$('#profile-image-upload').click();
						});
					});       
				</script> 
				</div>
				</div>


			</div>
			<div class="col-sm-5">
				<form:form action="saveUser" modelAttribute="user" method="POST">
					<table class="property_input">
						<col width="130">
						<tr>

							<form:hidden path="id" />
							<form:hidden path="role" />


							<td><div class="form-group"><label for="firstName">First Name:</label></div></td>
							<td><form:input type="text" path="firstName" class="form-control"/></td>
						</tr>

						<tr>
							<td><div class="form-group"><label for="firstName">Last Name:</label></div></td>
							<td><form:input type="text" path="lastName" class="form-control"/></td>
						</tr>

						<tr>
							<td><div class="form-group"><label for="firstName">Username:</label></div></td>
							<td><form:input type="text" path="username" class="form-control"/></td>
						</tr>

						
						<tr>
							<td><div class="form-group"><label for="firstName">Email:</label></div></td>
							<td><form:input type="email" path="email" class="form-control"/></td>
						</tr>

						<tr>
							<td><div class="form-group"><label for="firstName">Password:</label></div></td>
							<td><form:input type="text" path="password" class="form-control"/></td>
						</tr>

						
						<tr>
							<td></td>
							<td><input class="btn btn-primary" type="submit" value="Update"></td>
						</tr>
					</table>
				</form:form>
			</div >
		</div>
	</div>

</section>



<c:import url="footer.jsp"></c:import>  
