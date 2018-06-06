<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!--Custom tag for replacing attributes-->

<c:import url="header.jsp"></c:import>

<div class="container">

	<div class="row"></div>
</div>

<section class="containerUsers jumbotron">

	<!-- SEARCH FILTERS -->
	<div class="col-md-4 sidenav">
		<form id="formsearchusers" action="/usersResults" method="get" autocomplete="on">


			<div class="form-group">
				<label for="keyword">KEYWORD SEARCH</label> <input type="search"
					class="form-control" name="keyword" id="keyword" placeholder="Keyword">
			</div>


			<div class="form-group">
				<label for="keyword">Category</label>
				<!-- 	<select name="category" class="form-control" >
					<option value="0"  default>---Select Category---</option>
					<option value="1">DOCOTOS</option>
					<option value="2">MASTORES</option>
					<option value="3">KATHIGITES</option>
				</select> --->


				<!-- Get categories from categories table -->

				<select name="category" class="form-control">
					<option value="0" default>---Select Category---</option>
					<c:forEach items="${categories}" var="cat">
						<option id="category${cat.id}" value="${cat.id}">${cat.category}</option>
					</c:forEach>
				</select>

			</div>

			<input type="hidden" name="sort" value="totalpoints,desc">


			<div class="form-group">
				<label for="keyword">Result no</label> <select name="size"
					class="form-control">
					<option id="size5" value="5" selected>5</option>
					<option id="size10" value="10">10</option>
					<option id="size20" value="20">20</option>
					<option id="size50" value="50">50</option>
				</select>
			</div>

			
			




			<!-- 	<div class="checkbox">
				<label><input type="checkbox"> Remember me</label>
			</div> -->

			<label for="keyword">Rating</label> 	
				<div class="form-group">


					<div class="stars">

						<input class="star star-5" id="star-5" type="radio" name="star"
							value="5" /> <label class="star star-5" for="star-5"></label> <input
							class="star star-4" id="star-4" type="radio" name="star"
							value="4" /> <label class="star star-4" for="star-4"></label> <input
							class="star star-3" id="star-3" type="radio" name="star"
							value="3" /> <label class="star star-3" for="star-3"></label> <input
							class="star star-2" id="star-2" type="radio" name="star"
							value="2" /> <label class="star star-2" for="star-2"></label> <input
							class="star star-1" id="star-1" type="radio" name="star"
							value="1" /> <label class="star star-1" for="star-1"></label>


					</div>


			<script>
			 var perpage = '${perpage}';

			if  (perpage!=0)
			$( document ).ready(function() {			
				document.getElementById("size"+perpage).selected = "true";
		});	

			 var category = "${category}";
			if  (category!=0)

				$( document ).ready(function() {			
						document.getElementById("category"+category).selected = "true";
				});	
 
			var star = "${star}";
			var starInt = star | 0 ;
			if  (star!=0)
				$( document ).ready(function() {
					document.getElementById("star-"+starInt).checked = "true";
			});	
			

			var keyword = "${keyword}";
		
			if  (keyword!="" && keyword!="NOVALUE")
				$( document ).ready(function() {								
					document.getElementById("keyword").placeholder = keyword;	
					});	
		
			</script>


				</div>
	

			<button type="submit" class="btn btn-info" style="display: block;">Submit</button>
		</form>
	</div>
	<!-- END OFSEARCH FILTERS -->

	<div class="col-lg-8 text-left">
		<!-- START OF CONTAINER 8 COLUMN -->

		<c:if test="${empty list}">
			<div class="col-xs-12 text-center">
				<br>
				<h4>No results found for selected criteria.</h4>
				
			</div>
		</c:if>

		<c:forEach var="partner" items="${list}">
			<c:set var="str" value="${partner.description}" />

			<figure class="col-lg-6">

				<div class="flex-container">
					<div class="comment-avatar">
						<img src="${pageContext.request.contextPath}${partner.profileimage}"
							onError="this.onerror=null;this.src='${pageContext.request.contextPath}/images/defaultprofile.png';">

						<!-- BUTTONS HERE -->
						<button type="button" class="btn btn-default btn-xs center-block">
							<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
							<fmt:formatNumber type="number" maxFractionDigits="2"
								value="${partner.totalPoints}" />
						</button>
						<a href="/partner/profile/${partner.id}"
							class="btn btn-info center-block btn-xs" role="button">Profile</a>

					</div>
					
					<div class="comment-box" style="margin-top: 10px;">
						<div class="comment-head">
							<h5 class="comment-name">
								<a href="/partner/profile/${partner.id}">${partner.firstName}
									${partner.lastName}</a> <br> Category:
								${partner.category.category }
							</h5>


						</div>
						<div class="comment-content">${fn:substring(str,0,189)}....</div>
					</div>
				</div>

			</figure>
		</c:forEach>



	</div>
	<!--END OF BOOTSTRAP   -->
</section>

<nav aria-label="Page navigation" class="text-center">
	<ul class="pagination ">
		<li><a
			href="${requestScope['javax.servlet.forward.request_uri']}?&category=${param.category}&keyword=${param.keywork}&star=${param.star}&size=${param.size}&pages=0&sort=${param.sort} "
			aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
		</a> <c:forEach var="pages" begin="1" end="${totalpages}">

				<c:set var="total" value="${pages}" />
				<li><a
					href="${requestScope['javax.servlet.forward.request_uri']}?&category=${param.category}&keyword=${param.keywork}&star=${param.star}&page=${total-1}&size=${param.size}&sort=${param.sort} ">${total}</a></li>
			</c:forEach>
		<li><a
			href="${requestScope['javax.servlet.forward.request_uri']}?&page=${totalpages-1}&size=${param.size}&category=${param.category}&keyword=${param.keywork}&star=${param.star}&sort=${param.sort}"
			aria-label="Next"> <span aria-hidden="true">&raquo;</span>
		</a></li>
	</ul>
</nav>



<c:import url="footer.jsp"></c:import>
