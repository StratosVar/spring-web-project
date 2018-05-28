<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<c:import url="header.jsp"></c:import>


<div class="container">
	<div class="col-md-3"></div>
		<div class="col-md-6">
			<!-- startpoint 1 -->
			<form action="/partner/registration/submit" method="post" id="fileForm" role="form" accept-charset="ISO-8859-1">
				<fieldset>
					
				
						<!-- startpoint 2 -->
				<div class="container jumbotron" style="width:600px;">
						<div>
							<br>
							<div class="row">
								<div class="col-sm-2">
									<label>Type</label>:<br>
								</div>
								<div class="col-sm-3">
									<input type="radio" name="type" class="hideable" required value="user"	checked="checked"> Simple User
								</div>
								<div class="col-sm-3">
									<input type="radio" name="type" value="partner" class="showable" required>
									Pro
								</div>
								<div class="col-sm-4"></div>
							</div>
						</div>


						<div class="form-group kati" style="display: none">
							<label class="col-md-4 control-label" for="where">Field of expertise</label>
							<select id="where" name="category" class="form-control">
								<option value="1">Option one</option>
								<option value="2">Option two</option>
							</select>
						</div>



						<div class="form-group kati" style="display: none">
							<label class="col-md-4 control-label" for="where">Biography</label>
							<textarea class="form-control" name="bio" rows="10" cols="30">The cat was playing in the garden.</textarea>
						</div>


						<div class="form-group">
							<label for="firstname"><span class="req">* </span> First
								name: </label> <input class="form-control" type="text" name="firstname"
								id="txt" required />
							<div id="errFirst"></div>
						</div>


						<div class="form-group">
							<label for="lastname"><span class="req">* </span> Last
								name: </label> <input class="form-control" type="text" name="lastname"
								id="txt" placeholder="hyphen or single quote OK" required />
							<div id="errLast"></div>
						</div>


						<div class="form-group">
							<label for="email"><span class="req">* </span> Email
								Address: </label> <input class="form-control" required type="text"
								name="email" id="email" onchange="email_validate(this.value);" />
							<div class="status" id="status"></div>
						</div>


						<div class="form-group">
							<label for="username"><span class="req">* </span> User
								name: <small>This will be your login user name</small> </label> <input
								class="form-control" type="text" name="username" id="txt"
								placeholder="minimum 6 letters" required />

						</div>


						<div class="form-group">
							<label for="phonenumber"><span class="req">* </span>
								Phone Number: </label> <input required type="number" name="phone"
								id="phone" class="form-control phone" maxlength="28"
								onkeyup="validatephone(this);"
								placeholder="not used for marketing" />
						</div>

					<div class="form-group">
						<label for="password"><span class="req">* </span>
							Password: </label> <input required name="password" type="password"
							class="form-control inputpass" minlength="4" maxlength="16"
							id="password1" onkeyup="checkPassword(); return false;" /> <label
							for="password"><span class="req">* </span> Password
							Confirm: </label> <input required type="password"
							class="form-control inputpass" minlength="4" maxlength="16"
							placeholder="Enter again to validate" id="password2"
							onkeyup="checkPassword(); return false;" /> <span
							id="passwordConfirm" class="passwordConfirm"></span>
					</div>

					<div class="form-group">


							<input type="checkbox" required name="terms"
								onchange="this.setCustomValidity(validity.valueMissing ? 'Please indicate that you accept the Terms and Conditions' : '');"
								id="field_terms">   <label for="terms">I agree
								with the <a href="terms.php"
								title="You may read our terms and conditions by clicking on this link">terms
									and conditions</a> for Registration.
							</label><span class="req">* </span>
						</div>

						<div class="form-group">
							<input class="btn btn-success" type="submit" name="submit_reg"
								value="Register">
						</div>
				</fieldset>
			</form>

			<script type="text/javascript">
  document.getElementById("field_terms").setCustomValidity("Please indicate that you accept the Terms and Conditions");
</script>
</div>


			</div>
		<!-- endpoint 1 -->

	


<script>
  $(document).ready(function(){
    $(".hideable").click(function(){
      $(".kati").hide();
    });
    $(".showable").click(function(){
      $(".kati").show();
   
	});
	});
</script>



<c:import url="footer.jsp"></c:import>  