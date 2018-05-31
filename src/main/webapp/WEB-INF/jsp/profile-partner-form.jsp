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
				<form:form action="saveUser" modelAttribute="partner" method="POST">
					<table class="property_input">
						<col width="150">
						<tr>

							<form:hidden path="id" />

							<td><div class="property_input">First Name:</div></td>
							<td><form:input type="text" path="firstName" /></td>
						</tr>

						<tr>
							<td><div class="property_input">Last Name:</div></td>
							<td><form:input type="text" path="lastName" /></td>
						</tr>

						<tr>
							<td><div class="property_input">Username:</div></td>
							<td><form:input type="text" path="username" /></td>
						</tr>

						
						<tr>
							<td><div class="property_input">Email:</div></td>
							<td><form:input type="email" path="email" /></td>
						</tr>

						<tr>
							<td><div class="property_input">Bio:</div></td>
							<td><form:textarea type="textarea" rows="5" cols="18" path="description" /></td>
						</tr>

						<tr>
							<td><div class="property_input">Category:</div></td>
							<td><form:input type="text" path="category" disabled /></td>
						</tr>

						

						
						<tr>
							<td></td>
							<td><input class="submit" type="submit" value="Update"></td>
						</tr>
					</table>
				</form:form>
			</div >
		</div>
	</div>

</section>



<c:import url="footer.jsp"></c:import>  
