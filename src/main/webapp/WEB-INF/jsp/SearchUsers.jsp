<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<c:import url="header.jsp"></c:import>  

<div class="container">


	<!-- 		
		<form action="/action_page.php" id="carform">
  Firstname:<input type="text" name="fname">
  <input type="submit">
</form> -->

<div class="row">
		<!-- <select name="carlist" form="carform">
			<option value="10">Volvo</option>
			<option value="20">Saab</option>
			<option value="50">Opel</option>
		</select>



		<h2>Stylish Search Box</h2>
			<div id="custom-search-input">
				<div class="input-group col-md-8">
					<input type="text" class="  search-query form-control"
						placeholder="Search" /> <span class="input-group-btn">
						<button class="btn btn-danger" type="button">
							<span class=" glyphicon glyphicon-search"></span>
						</button>
					</span>
				</div>
			</div> -->
		</div> 

	</div>





	<section class="containerUsers jumbotron">

		<!-- SEARCH FILTERS -->	
		<div class="col-sm-2 sidenav">
			<form action="/action_page.php">


				<div class="form-group">
					<label for="keyword">KEYWORD SEARCH</label> <input type="text" class="form-control" name="keyword" id="email">
				</div>


				<div class="form-group">
					<label for="keyword">Category</label>			
					<select name="category" class="form-control" >
						<option value="10">DOCOTOS</option>
						<option value="20">MASTORES</option>
						<option value="50">KATHIGITES</option>
					</select>
				</div>


				<div class="form-group">
					<label for="keyword">Result no</label>			
					<select name="category" class="form-control" >
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

					<input class="star star-5" id="star-5" type="radio" name="star"/>
					<label class="star star-5" for="star-5"></label>
					<input class="star star-4" id="star-4" type="radio" name="star"/>
					<label class="star star-4" for="star-4"></label>
					<input class="star star-3" id="star-3" type="radio" name="star"/>
					<label class="star star-3" for="star-3"></label>
					<input class="star star-2" id="star-2" type="radio" name="star"/>
					<label class="star star-2" for="star-2"></label>
					<input class="star star-1" id="star-1" type="radio" name="star" value="5"/>
					<label class="star star-1" for="star-1"></label>

				</div>

			</div>


			<button type="submit" class="btn btn-default">Submit</button>
		</form>
	</div>
	<!-- END OFSEARCH FILTERS -->	

	<div class="col-sm-8 text-left"> <!-- START OF CONTAINER 8 COLUMN -->


		<figure class="col-md-4">

			<div class="flex-container">		
				<div class="comment-avatar">
					<img src="http://i9.photobucket.com/albums/a88/creaticode/avatar_2_zps7de12f8b.jpg" alt="">

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
					<div class="comment-content">Lorem ipsum dolor sit amet,consectetur adipisicing elit. Velit omnis nimiet iure laudantiumvitae, praesentium optio, sapienteistinctio illoasdadsdadasd1231231238585</div>
				</div>
			</div>
		</figure>


		
		<div class="row">
			<figure class="col-sm-6">

			</figure>
			<figure class="col-sm-6">
			</figure>
		</div>
		
	</div> <!--END OF BOOTSTRAP   -->
</section>
<c:import url="footer.jsp"></c:import>  
