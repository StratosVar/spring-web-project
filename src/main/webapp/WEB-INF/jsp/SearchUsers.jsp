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





	<section class="containerUsers jumbotron">

		<!-- SEARCH FILTERS -->	
		<div class="col-md-3 sidenav">
			<form action="/usersResults" method="get" autocomplete="on">


				<div class="form-group">
					<label for="keyword">KEYWORD SEARCH</label> <input type="text" class="form-control" name="keyword" id="keyword">
				</div>


				<div class="form-group">
					<label for="keyword">Category</label>			
					<select name="category" class="form-control" >
						<option value="1">DOCOTOS</option>
						<option value="20">MASTORES</option>
						<option value="50">KATHIGITES</option>
					</select>
				</div>


				<div class="form-group">
					<label for="keyword">Result no</label>			
					<select name="size" class="form-control" >
						<option value="10">10</option>
						<option value="20">20</option>
						<option value="50">50</option>
					</select>
				</div>



		<!-- 	<div class="checkbox">
				<label><input type="checkbox"> Remember me</label>
			</div> -->


			<div class="form-group">
				<label for="keyword">Rating</label>
				
				<div class="stars">

					<input class="star star-5" id="star-5" type="radio" name="star" value="5"/>
					<label class="star star-5" for="star-5"></label>
					<input class="star star-4" id="star-4" type="radio" name="star" value="4"/>
					<label class="star star-4" for="star-4"></label>
					<input class="star star-3" id="star-3" type="radio" name="star" value="3"/>
					<label class="star star-3" for="star-3"></label>
					<input class="star star-2" id="star-2" type="radio" name="star" value="2"/>
					<label class="star star-2" for="star-2"></label>
					<input class="star star-1" id="star-1" type="radio" name="star" value="1"/>
					<label class="star star-1" for="star-1"></label>

				</div>

			</div>


			<button type="submit" class="btn btn-default">Submit</button>
		</form>
	</div>
	<!-- END OFSEARCH FILTERS -->	

	<div class="col-lg-8 text-left"> <!-- START OF CONTAINER 8 COLUMN -->

		<c:forEach var="partner" items="${list}">
		<figure class="col-sm-6">

			<div class="flex-container">		
				<div class="comment-avatar">
					<img src="http://i9.photobucket.com/albums/a88/creaticode/avatar_2_zps7de12f8b.jpg" alt="">
					
					<!-- BUTTONS HERE -->
					<button type="button" class="btn btn-default btn-xs center-block"><span class="glyphicon glyphicon-star" aria-hidden="true"></span> ${partner.totalPoints}</button>
					<a href="#" class="btn btn-info center-block" role="button">Link Button</a>

				</div>
				<!-- Contenedor del Comentario -->
				<div class="comment-box">
					<div class="comment-head">
						<h6 class="comment-name">
							<a href="http://creaticode.com/blog">Lorena Rojero</a>
						</h6>
						<h6>Category: ${partner.category.category }</h6>
					</div>
					<div class="comment-content">Lorem ipsum dolor sit amet,
						consectetur adipisicing elit. Velit omnis animi et iure laudantium
					vitae, praesentium optio, sapiente distinctio illo?</div>
				</div>
			</div>

		</figure>
	</c:forEach>

	<figure class="col-md-4">
		<div class="flex-container">		
			<div class="comment-avatar">
				<img src="http://i9.photobucket.com/albums/a88/creaticode/avatar_2_zps7de12f8b.jpg" alt="profile pic" >

			</div>
			<!-- Contenedor del Comentario -->
			<div class="comment-box">
				<div class="comment-head">
					<h6 class="comment-name">
						<a href="http://creaticode.com/blog">Lorena Rojero</a>
					</h6>
				</div>
				<div class="comment-content">Lorem ipsum dolor sit amet,
					consectetur adipisicing elit. Velit omnis animi et iure laudantium
				vitae, praesentium optio, sapiente distinctio illo?</div>
			</div>
		</div>
	</figure>



</figure>


<figure class="col-md-4">
	<div class="flex-container">		
		<div class="comment-avatar">
			<img src="http://i9.photobucket.com/albums/a88/creaticode/avatar_2_zps7de12f8b.jpg" alt="profile pic" >
			<!-- BUTTONS HERE -->
			<button type="button" class="btn btn-default btn-xs center-block"><span class="glyphicon glyphicon-star" aria-hidden="true"></span> Star</button>
			<a href="#" class="btn btn-info center-block" role="button">Link Button</a>
		</div>
		<!-- Contenedor del Comentario -->
		<div class="comment-box">
			<div class="comment-head">
				<h6 class="comment-name">
					<a href="http://creaticode.com/blog">Lorena Rojero</a>
				</h6>
			</div>
			<div class="comment-content">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Velit omnis animi et iure laudantium vitae, praesentium optio, sapiente distinctio illo?</div>
		</div>
	</div>
</figure>



</div> <!--END OF BOOTSTRAP   -->
</section>






<c:set var="pagenumber" value="${1}"/>
<nav aria-label="Page navigation" class="text-center">
	<ul class="pagination ">
		<li><a href="${requestScope['javax.servlet.forward.request_uri']}?${requestScope['javax.servlet.forward.query_string']}&page=1" aria-label="Previous"> <span
			aria-hidden="true">&laquo;</span>
		</a></li>
		<li><a href="${requestScope['javax.servlet.forward.request_uri']}&page=${pagenumber}"> ${pagenumber} </a></li>
		<c:forEach var="pages" items="${pages}">
		<c:set var="total" value="${pagenumber + 1}" />
		<li><a href="${requestScope['javax.servlet.forward.request_uri']}&page=${total}">${total}</a></li>
	</c:forEach>
	<li><a href="${requestScope['javax.servlet.forward.request_uri']}&page=${totalpages}" aria-label="Next"> <span aria-hidden="true">&raquo;</span>
	</a></li>
</ul>
</nav>


<c:import url="footer.jsp"></c:import>  
