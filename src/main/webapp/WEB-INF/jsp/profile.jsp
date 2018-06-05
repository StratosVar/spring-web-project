<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:import url="header.jsp"></c:import> 




<section class="jumbotron">
	<div class="container" >
		<div class="row input-parent ">


			<div class="col-sm-6 profile_box">
				<div class="image_input">

				<div align="center"> 
					<img  src="${pageContext.request.contextPath}${user.profileimage}" id="profile-image1" class="img-circle img-responsive" onError="this.onerror=null;this.src='${pageContext.request.contextPath}/images/defaultprofile.png';">

					
 
  
					<form id="profile-image-form" method="POST" action="uploadFile" enctype="multipart/form-data">
					<input id="profile-image-upload" name="file" class="hidden" type="file">
					<button type="submit" value="Submit">Submit</button>
					</form>
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
							<td><div class="form-group"><label for="lastName">Last Name:</label></div></td>
							<td><form:input type="text" path="lastName" class="form-control"/></td>
						</tr>

						<tr>
							<td><div class="form-group"><label for="username">Username:</label></div></td>
							<td><form:input type="text" path="username" class="form-control"/></td>
						</tr>

						
						<tr>
							<td><div class="form-group"><label for="email">Email:</label></div></td>
							<td><form:input type="email" path="email" class="form-control"/></td>
						</tr>

						<tr>
							<td><div class="form-group"><label for="password">Password:</label></div></td>
							<td><input type="text" name="password" minlength="3" class="form-control" placeholder="******"/></td>
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
