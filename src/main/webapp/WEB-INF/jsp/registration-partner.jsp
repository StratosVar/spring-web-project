<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="header.jsp">
</c:import>
<style>
.buttonregister{
	width:20%;
	padding: 3%;
    background: #43D1AF;
    border-bottom: 2px solid #30C29E;
    border-top-style: none;
    border-right-style: none;
    border-left-style: none;
    color: #fff;
}
</style>
<div class="container">
	<div class="col-md-3"></div>
	<div class="col-md-6">
		<!-- startpoint 1 -->
				<c:if test="${usernameError eq true}"> 		
				<h6>That username already exists</h6>
				</c:if>
				<c:if test="${emailError eq true}"> 		
				<h6>That email already exists</h6>
				</c:if>
		<form accept-charset="ISO-8859-1" action="/registration/submit"
			id="fileForm" method="post" role="form">
			<fieldset>
				<!-- startpoint 2 -->
				<div class="container jumbotron" style="width: 600px;">
					<div>
						<br>
						<div class="row">
							<div class="col-sm-2">
								<label> Type</label> : <br>
							</div>
							<div class="col-sm-3">
								<input checked="checked" class="hideable" name="type"
									required="" type="radio" value="user">Simple User</input>
							</div>
							<div class="col-sm-3">
								<input class="showable" name="type" required="" type="radio"
									value="partner">Pro</input>
							</div>
							<div class="col-sm-4"></div>
						</div>
						</br>
					</div>
					<div class="form-group kati" style="display: none">
						<label class="col-md-4 control-label" for="where"> <span
							class="req">*</span> Category
						</label>

						<!-- Find categories from categories table -->

				<!--    <select class="form-control" id="where" name="category">
                            <option value="1">
                                Option one
                            </option>
                            <option value="2">
                                Option two
                            </option>
                        </select>		 -->

						<select class="form-control" id="where" name="category">
							<c:forEach items="${categories}" var="cat">
								<option value="${cat.id}">${cat.category}</option>
							</c:forEach>
						</select>



					</div>
					<div class="form-group kati" style="display: none">
						<label class="col-md-4 control-label" for="where"> <span
							class="req">*</span>Description
						</label>
						<textarea class="form-control" cols="30" name="description"
							rows="10" placeholder="Enter your bio here"></textarea>
					</div>
					<div class="form-group">
						<label for="firstname"> <span class="req">* </span>
							Firstname:
						</label> <input class="form-control" id="txt" name="firstname" required
							type="text" />
						<div id="errFirst"></div>
					</div>
					<div class="form-group">
						<label for="lastname"> <span class="req">*</span>Lastname:
						</label> <input class="form-control" id="txt" name="lastname" required
							type="text" />
						<div id="errLast"></div>
					</div>
					<div class="form-group">
						<label for="email"> <span class="req">*</span>Email	Address:</label> 
						<input class="form-control" id="email" name="email" type="email" onblur="email_validate(this.value);" required type="email"/>
							<span class="availabilityWarning" id="emailStat"></span>
							<span class="status" id="status"></span>
							</div>
						
					
					<div class="form-group">
					
						<label for="username"> <span class="req">*</span>Username:</label>
						<input class="form-control" id="username" name="username" required="" type="text" />
						<span class="availabilityWarning" id = "usernameStat"></span>
						
					</div>

					<div class="form-group">
						<label for="password"> <span class="req">*</span>Password:
						</label> <input class="form-control inputpass" id="password1"
							maxlength="16" minlength="4" name="password"
							onkeyup="checkPassword(); return false;" required=""
							type="password" /> <label for="password"> <span
							class="req">* </span>Password Confirm:
						</label> <input class="form-control inputpass" id="password2"
							maxlength="16" minlength="4"
							onkeyup="checkPassword(); return false;" required=""
							type="password" /> <span class="passwordConfirm"
							id="passwordConfirm"> </span>
					</div>
					<div class="form-group">
						<input id="field_terms" name="terms" required type="checkbox">
						<label for="terms"> I agree with the <a href="terms"
							title="Terms and conditions">terms and conditions</a>
						</label> <span class="req"> *</span> </input>
					</div>
					<div class="form-group">
						<input class="btn btn-success buttonregister" name="submit_reg" type="submit"
							value="Register"> </input>
					</div>
				</div>
			</fieldset>
		</form>

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

    
    var emailString = $('#email').val();
    var usernameString = $('#username').val();


$(document).ready(function(){
		$("#email").blur(function(){

			if ($('#email').val()===""){
				document.getElementById("status").innerHTML = "";
				document.getElementById("emailStat").innerHTML = "";
				
				}
			else{
			
			$.ajax({
				url:'checkEmail',
				data:{email: $('#email').val()},
				success: function(data){

					
				
					if (!data)
					{
						document.getElementById("status").innerHTML = "";
						document.getElementById("emailStat").innerHTML = "This email has been registered with another user";
						document.getElementById("emailStat").style.color = "red";

					}
					else{
						document.getElementById("emailStat").innerHTML = "";
						
					}
					
					
				}

				});
			}
				

			});

});

$(document).ready(function(){

	$("#username").blur(function(){

		if ($('#username').val()===""){
			
			document.getElementById("status").innerHTML = "";
			document.getElementById("emailStat").innerHTML = "";
			
			}
		else{
		
		$.ajax({
			url:'checkUsername',
			data:{username: $('#username').val()},
			
			success: function(data){

				if (data){
				
					document.getElementById("usernameStat").innerHTML = "Username OK";
					document.getElementById("usernameStat").style.color = "green";
					

					}

				else
					{

					document.getElementById("usernameStat").innerHTML = "Username already taken.";
					document.getElementById("usernameStat").style.color = "red";
					

					}
				

				}

		});
		}
	});
});

/*	If email field is empty show a reminder, or erase  */

/*	If username field is empty show a reminder, or erase  */

$(document).ready(function(){
	$("#username").focus(function(){

			
			document.getElementById("usernameStat").innerHTML = "";
		

	});
});
$(document).ready(function(){
	$("#email").focus(function(){

			
			document.getElementById("emailStat").innerHTML = "";
			document.getElementById("status").innerHTML = "";
		

	});
});


</script>
<c:import url="footer.jsp">
</c:import>
