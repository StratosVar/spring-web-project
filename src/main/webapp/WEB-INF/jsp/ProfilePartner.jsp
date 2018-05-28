<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<c:import url="header.jsp"></c:import>  

<div class="container">


	<!-- 		
		<form action="/action_page.php" id="carform">
  Firstname:<input type="text" name="fname">
  <input type="submit">
</form> -->

<div class="row">
		
		</div> 

	</div>




	<div class="container jumbotron" style="width:100%">


		<div class="col-md-5"> 	
		
	
        
        
       <div class="col-md-12 ">

<div class="panel panel-default">
  <div class="panel-heading">  <h4 >User Profile</h4></div>
   <div class="panel-body">
       
    <div class="box box-info">
        
            <div class="box-body">
                     <div class="col-sm-6">
                     <div  align="center"> <img alt="User Pic" src="https://x1.xingassets.com/assets/frontend_minified/img/users/nobody_m.original.jpg" id="profile-image1" class="img-circle img-responsive"> 
                
                     </div>
              
              <br>
    
              <!-- /input-group -->a
            </div>
            <div class="col-sm-6">
            <h4 style="color:#00b1b1;">${partner.username} </h4></span>
              <span><p>${partner.username}</p></span>            
            </div>
            <div class="clearfix"></div>
            <hr style="margin:5px 0 5px 0;">
    
              
<div class="col-sm-5 col-xs-6 tital " >First Name:</div><div class="col-sm-7 col-xs-6 ">${partner.username}</div>
     <div class="clearfix"></div>
<div class="bot-border"></div>

<div class="col-sm-5 col-xs-6 tital " >Middle Name:</div><div class="col-sm-7"> Shankar</div>
  <div class="clearfix"></div>
<div class="bot-border"></div>

<div class="col-sm-5 col-xs-6 tital " >Last Name:</div><div class="col-sm-7"> Huddedar</div>
  <div class="clearfix"></div>
<div class="bot-border"></div>

<div class="col-sm-5 col-xs-6 tital " >Date Of Joining:</div><div class="col-sm-7">15 Jun 2016</div>

  <div class="clearfix"></div>
<div class="bot-border"></div>

<div class="col-sm-5 col-xs-6 tital " >Date Of Birth:</div><div class="col-sm-7">11 Jun 1998</div>

  <div class="clearfix"></div>
<div class="bot-border"></div>

<div class="col-sm-5 col-xs-6 tital " >Place Of Birth:</div><div class="col-sm-7">Shirdi</div>

 <div class="clearfix"></div>
<div class="bot-border"></div>

<div class="col-sm-5 col-xs-6 tital " >Nationality:</div><div class="col-sm-7">Indian</div>

 <div class="clearfix"></div>
<div class="bot-border"></div>


<div class="col-sm-5 col-xs-6 tital " >BIOGRAPHY:</div><div class="col-sm-12">I think I started out at under $3 per month 5 or 6 years ago. 
The price has steadily increased and my latest renewal offer was $16.99 per month. Additionally last year my wife started having spam problems and it seems 
like someone gained access to all her email correspondence. The only place that we could pin it down to was the justhost SMTP server. Support was very evasive when 
I tried to explain what I thought happened.  ${partner.description}</div>


<!-- BUTTON -->
<!--  modal -->

<div class="center"><button data-toggle="modal" data-target="#squarespaceModal" class="btn btn-primary center-block">Start a conversation</button></div>
<div class="modal fade" id="squarespaceModal" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
  <div class="modal-dialog">
	<div class="modal-content">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
			<h3 class="modal-title" id="lineModalLabel">My Modal</h3>
		</div>
		<div class="modal-body">
			
            <!-- content goes here -->
			<form>
              <div class="form-group">
                <label for="conversationTitle">Title</label>
                <input type="text" class="form-control" id="conversationTitleinput" placeholder="Enter Title">
              </div>
              <div class="form-group">
                <label for="exampleInputPassword1">Password</label>
                <textarea class="form-control" rows="4" cols="50" name="text" >Enter your first message here</textarea>
              </div>
              <div class="form-group">
               
                <p class="help-block">Example block-level help text here.</p>
              </div>
              <div class="checkbox">
                <label>
                  <input type="checkbox"> Check me out
                </label>
              </div>
              <button type="submit" class="btn btn.lg btn-success">Send</button>
            </form>

		</div>
		
	</div>
  </div>
</div>

<!-- END OF BUTTON MODAL FOR REVIEW -->


<!-- BUTTON -->
<!--  modal -->
<div class="center"><button data-toggle="modal" data-target="#squarespaceModal" class="btn btn-primary center-block">Leave a Review</button></div>
<div class="modal fade" id="squarespaceModal" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
  <div class="modal-dialog">
	<div class="modal-content">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
			<h3 class="modal-title" id="lineModalLabel">My Modal</h3>
		</div>
		<div class="modal-body">
			
            <!-- content goes here -->
			<form>
              <div class="form-group">
                <label for="conversationTitle">Title</label>
                <input type="text" class="form-control" id="conversationTitleinput" placeholder="Enter Title">
              </div>
              <div class="form-group">
                <label for="exampleInputPassword1">Password</label>
                <textarea class="form-control" rows="4" cols="50" name="text" >Enter your first message here</textarea>
              </div>
              <div class="form-group">
               
                <p class="help-block">Example block-level help text here.</p>
              </div>
              <div class="checkbox">
                <label>
                  <input type="checkbox"> Check me out
                </label>
              </div>
              <button type="submit" class="btn btn.lg btn-success">Send</button>
            </form>

		</div>
		
	</div>
  </div>
</div>

<!-- END OF BUTTON MODAL FOR REVIEW -->




            <!-- /.box-body -->
          </div>
          <!-- /.box -->

        </div>
       
            
    </div> 
    </div>
</div>  
		
		
		
		
		
		
		
		
		
		</div>
		
		
		
		<div class="col-md-7 "><!-- DEUTERI KOLONA -->



		<div class="row col-md-6">





			<div class="col-md-8">
				<h5>Popular Swift Dzire Reviews</h5>
			</div>

		</div>
		<div class="one-review">
			<div class="row">
				<div class="col-md-6">
					<p>Rahul Roy</p>
				</div>
				<div class="col-md-6 text-success">
					<small>30th Jan</small>
				</div>
			</div>
			<div class="row text-success">
				<div class="col-md-12">
					<i class="fa fa-star"></i><i class="fa fa-star"></i><i
						class="fa fa-star"></i><i class="fa fa-star"></i><i
						class="fa fa-star"></i>
				</div>
			</div>
			<div class="row pt-2">
				<div class="col-md-12">
					<h6>Worse web hosting company</h6>
					<p class="commenttextsize" style="font-size: 15px;">I think I
						started out at under $3 per month 5 or 6 years ago. The price has
						steadily increased and my latest renewal offer was $16.99 per
						month. Additionally last year my wife started having spam problems
						and it seems like someone gained access to all her email
						correspondence. The only place that we could pin it down to was
						the justhost SMTP server. Support was very evasive when I tried to
						explain what I thought happened.</p>
				</div>
			</div>
			<div class="row pt-2">
				<div class="col-md-8">
					<button type="button" class="btn btn-primary">
						<i class="fa fa-share-alt"></i> Share
					</button>

				</div>

			</div>
		</div>
		<hr>




	</div><!-- DEUTERI KOLONA TELOS -->
			
			
			
			
			
			
		</div>











		<c:import url="footer.jsp"></c:import>  
