<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
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
			<div class="col-sm-6 profile_box">

				<table class="property_input">
					<col width="150">
					<tr>

						<td><div class="property_input">First Name:</div></td>
						<td><input type="text" name="firstName"></td>
					</tr>
					<tr>
						<td><div class="property_input">Last Name:</div></td>
						<td><input type="text" name="firstName"></td>
					</tr>
					<tr>
						<td><div class="property_input">Username:</div></td>
						<td><input type="text" name="firstName"></td>
					</tr>

					<tr>
						<td><div class="property_input">Password:</div></td>
						<td><input type="Password" name="firstName" min=5></td>
					</tr>
					<tr>
						<td><div class="property_input">Email:</div></td>
						<td><input type="text" name="firstName"></td>
					</tr>
					<tr>
						<td></td>
						<td><input class="submit" type="submit" value="Update"></td>
					</tr>
				</table>
			</div >
		</div>
	</div>

</section>



  
<!-- 

	Insert Page Here

 -->
 

<c:import url="footer.jsp"></c:import>  
