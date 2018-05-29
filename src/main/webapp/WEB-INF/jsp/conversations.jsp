<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<c:import url="header.jsp"></c:import>  


 
 
<section class="jumbotron">
	<div class="container" id="conversationsTable">
		<h3>Your Conversations</h3>
		<table class="table table-condensed">
			
			<tr>
				<td>Interlocutor</td>
				<td>Conversation Title</td>
				<td>Time of Last Message</td>
				<td>Unread Messages</td>
			</tr>
			
			
			
				<c:forEach var="conversation" items="${conversations}">

								<!-- construct an "update" link with customer id -->
								<c:url var="startConversation" value="/showConversation" >
									<c:param name="conversationId" value="${conversation.id}"/>	
								</c:url>


								<tr>
									<td>${conversation.id}</td>
									<td>${conversation.title}</td>
									<td>${conversation.creator.username}</td>
									<td>${conversation.interlocutor.username}</td>
									<td><a href="${startConversation}">Conversation</a>
									<td>
								</tr>

							</c:forEach>
			<tr class='clickable-row' data-href='https://www.w3schools.com/css/tryit.asp?filename=trycss_max-width'>
			
				<td>Kostas Ydraylikos</td>
				<td>Kazanaki Skatenio</td>
				<td>12:43 15/07/21</td>
				<td>0</td>
			</tr>
			<tr class='clickable-row' data-href='https://www.w3schools.com/css/tryit.asp?filename=trycss_max-width'>
				<td>Litsa Patera</td>
				<td>Magia magia tha sou kanw</td>
				<td>03:43 10/08/21</td>
				<td>0</td>
			</tr>
			<tr class='clickable-row' data-href='https://www.w3schools.com/css/tryit.asp?filename=trycss_max-width'>
				<td>Alex Kougias</td>
				<td>Fonos ek promeletis</td>
				<td>07:43 12/08/21</td>
				<td>3</td>
			</tr>
			<tr class='clickable-row' data-href='https://www.w3schools.com/css/tryit.asp?filename=trycss_max-width'>
				<td>Vefa Aleksiadou</td>
				<td>Peinasa ti na ftiaksw?</td>
				<td>14:07 13/08/21</td>
				<td>7</td>
			</tr>





		</table>

		 <script>

				jQuery(document).ready(function($) {
   				 $(".clickable-row").click(function() {
      				  window.location = $(this).data("href");
   						 });
				});

		</script> 


	</div>


</section>




						

<c:import url="footer.jsp"></c:import>  