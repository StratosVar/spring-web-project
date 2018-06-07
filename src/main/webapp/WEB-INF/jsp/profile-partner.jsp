<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 

<c:import url="header.jsp">
</c:import>

<style>

@import url(//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css);


/****** Style Star Rating Widget *****/

.rating { 
  border: none;
  float: left;
}

.rating > input { display: none; } 
.rating > label:before { 
  margin: 5px;
  font-size: 1.25em;
  font-family: FontAwesome;
  display: inline-block;
  content: "\f005";
}

.rating > .half:before { 
  content: "\f089";
  position: absolute;
}

.rating > label { 
  color: #ddd; 
 float: right; 
}

/***** CSS Magic to Highlight Stars on Hover *****/

.rating > input:checked ~ label, /* show gold star when clicked */
.rating:not(:checked) > label:hover, /* hover current star */
.rating:not(:checked) > label:hover ~ label { color: #FFD700;  } /* hover previous stars in list */

.rating > input:checked + label:hover, /* hover current star when changing rating */
.rating > input:checked ~ label:hover,
.rating > label:hover ~ input:checked ~ label, /* lighten current selection */
.rating > input:checked ~ label:hover ~ label { color: #FFED85;  } 
</style>


<div class="container">

    <div class="row">
    </div>
</div>
<div class="container jumbotron" style="width: 100%">
    <div class="col-md-5">
        <div class="col-md-12 ">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h4>
                        User Profile
                    </h4>
                </div>
                <div class="panel-body">
					<div class="box box-info">
						<div class="box-body">
							<div class="col-sm-6">
								<div align="center">
									<img alt="User Pic" class="img-circle img-responsive"
									
										src="${pageContext.request.contextPath}${partner.profileimage}" id="profile-image1" class="img-circle img-responsive" onError="this.onerror=null;this.src='${pageContext.request.contextPath}/images/defaultprofile.png';">
									
								</div>
							
							</div>
							<div class="col-sm-6">
								
								<p>
									<h4 style="color: #00b1b1;"> Username: ${partner.username}</h4>
								</p>
							</div>
							<div class="clearfix"></div>
							<hr style="margin: 5px 0 5px 0;">
							<div class="col-sm-5 col-xs-6 tital ">First Name:</div>
							<div class="col-sm-7 col-xs-6 ">${partner.firstName}</div>
							<div class="clearfix"></div>
							<div class="bot-border"></div>
							<div class="col-sm-5 col-xs-6 tital ">Last Name:</div>
							<div class="col-sm-7">${partner.lastName}</div>
							<div class="clearfix"></div>
							<div class="bot-border"></div>
							<div class="col-sm-5 col-xs-6 tital ">Category:</div>
							<div class="col-sm-7">${partner.category.category}</div>
							<div class="clearfix"></div>
							<div class="bot-border"></div>
							<div class="col-sm-5 col-xs-6 tital ">Bio:</div>
							<div class="col-sm-12">${partner.description}</div>
							<!-- BUTTON -->
							<!--  modal -->
							
							<button type="button" class="btn btn-info btn-lg"
									data-target="#squarespaceModal" data-toggle="modal">
									Start a conversation</button>
							<div aria-hidden="true" aria-labelledby="modalLabel"
								class="modal fade" id="squarespaceModal" role="dialog"
								tabindex="-1">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<button class="close" data-dismiss="modal" type="button">
												<span aria-hidden="true"> × </span> <span class="sr-only">
													Close </span>
											</button>
											<h3 class="modal-title" id="idmodaltitle" style="color:black">Send your first message !</h3>
										</div>
										<div class="modal-body">
											
											<form action="/partner/profile/start/${partner.id}">
												<div class="form-group">
													<label for="conversationTitle"> Title </label> <input
														class="form-control" id="conversationTitleinput"
														name="title" placeholder="Title" type="text">
												
												</div>
												<div class="form-group">
													<label for="messagemodal"> Message </label>
													<textarea class="form-control" cols="50" name="text"
														rows="4" placeholder="message..."></textarea>
												</div>
												<div class="form-group">
																									</div>
												
												<button class="btn btn.lg btn-success" type="submit">Send</button>
											</form>
										</div>
									</div>
								</div>
							</div>
							<!-- END OF BUTTON MODAL FOR REVIEW -->
							<!-- BUTTON -->
							<!--  modal -->
							<!-- <div class="container">  </div>-->
								
								<!-- Trigger the modal with a button -->
							<span style="display: inline;">	<button type="button" class="btn btn-info btn-lg"
									data-toggle="modal" data-target="#reviewmodal">Leave a review</button></span>

								<!-- Modal -->
								<div class="modal fade" id="reviewmodal" role="dialog">
									<div class="modal-dialog">

										<!-- Modal content-->
									<div class="modal-body" style="background-color:white">
										<form action="/partner/review/${partner.id}">
												<div class="form-group">
													<label for="reviewTitle"> Title </label> <input
														class="form-control" id="reviewTitleinput"
														name="title" placeholder="Title" type="text">
												
												</div>
												<div class="form-group">
													<label for="reviewmodal"> Review </label>
													<textarea class="form-control" cols="50" name="review"
														rows="4" placeholder="Leave a review"></textarea>
												</div>
												<div class="form-group">
												<label for="ratingreview"> Rating </label> 
														<fieldset class="rating">
														    <input type="radio" id="star5" name="rating" value="5" /><label class = "full" for="star5" ></label>
														    <input type="radio" id="star4half" name="rating" value="4.5" /><label class="half" for="star4half" ></label>
														    <input type="radio" id="star4" name="rating" value="4" /><label class = "full" for="star4" ></label>
														    <input type="radio" id="star3half" name="rating" value="3.5" /><label class="half" for="star3half" ></label>
														    <input type="radio" id="star3" name="rating" value="3" /><label class = "full" for="star3"></label>
														    <input type="radio" id="star2half" name="rating" value="2.5" /><label class="half" for="star2half"></label>
														    <input type="radio" id="star2" name="rating" value="2" /><label class = "full" for="star2" ></label>
														    <input type="radio" id="star1half" name="rating" value="1.5" /><label class="half" for="star1half"></label>
														    <input type="radio" id="star1" name="rating" value="1" /><label class = "full" for="star1" ></label>
														    <input type="radio" id="starhalf" name="rating" value="0.5" /><label class="half" for="starhalf" ></label>
														</fieldset>
												</div>
												
													<div>
														
														<button class="btn btn.lg btn-success" type="submit">Send</button>
													</div>
													
											</form>
										</div>
									</div>
								</div>

							


							<!-- END OF BUTTON MODAL FOR REVIEW -->


						</div>

					</div>
				</div>
            </div>
        </div>
    </div>
    <div class="col-md-7 ">
        <c:if test="${empty reviews}">
        
        <div class="row col-md-6">
            <h6>No reviews yet</h6>
        </div>
        </c:if>
      <c:forEach var="review" items="${reviews}">
        <!-- REVIEW -->
        <div class="one-review">
            
               
                <div class="col-md-6 text-success">
                    
                </div>
           
            <div class="text-success">
                <div class="col-md-12">${review.reviewer.username}
                 	
                 	
                    <i class="fa fa-star"></i>${review.points}
                    <small> Date:</small>
                  <fmt:formatDate pattern="EEE, d MMM yyyy HH:mm" value="${review.dateTime}" />
                </div>
            </div>
            <div class="row pt-2">
                <div class="col-md-12" style="padding-left: 32px;">
                    <h6>
                        ${review.title}
                        
                    </h6>
                    <p class="commenttextsize" style="font-size: 15px;">
                    ${review.review}
                       
                    </p>
                </div>
            </div>
            <div class="row pt-2">
                
            </div>
        </div>
        <!-- end of review -->
      </c:forEach>
        <hr>
        
    </div>
    <!-- DEUTERI KOLONA TELOS -->
</div>
<c:import url="footer.jsp">
</c:import>
