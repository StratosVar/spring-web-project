<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<c:import url="header.jsp"></c:import>  


 
 
<section class="jumbotron">
	<div class="container" id="conversationsTable">
		<h3>My Conversations</h3>
		<table class="table-conversations table-condensed">
			
			<tr>
				
				<td>Conversation Title</td>
				<td>Creator</td>
				<td>Interlocutor</td>
				<td>Time of Last Message</td>
				<td>Unread Messages</td>
				<td>Open Conversation</td>
				<td>Download</td>
			</tr>
			
		
				<c:set var = "i" value = "0" scope="page"/>
				<c:forEach var="conversation" items="${conversations}">
												
								<c:url var="startConversation" value="/showConversation" >
									<c:param name="conversationId" value="${conversation.id}"/>	
								</c:url>
								<c:url var="startConversationDownload" value="/showConversation/download" >
									<c:param name="conversationId" value="${conversation.id}"/>	
								</c:url>

								<tr class='trow' data-href='${startConversation}'>
									<td>${conversation.title}</td>
									<td>${conversation.creator.username}</td>
									<td>${conversation.interlocutor.username}</td>
									<td>${conversation.interlocutor.username}</td>
									<td><c:out value="${unreadlist[i]}"/></td>
									<td><a href="${startConversation}">Conversation</a></td>
									<td><a href="${startConversationDownload}">link1</a> <a href="${pageContext.request.contextPath}/conversation_logs/${conversation.id}_.txt" download>link2</a></td>
			<c:set var = "i" value = "${i+1}" scope="page"/>
											
								</tr>

							</c:forEach>
	
		</table>
		
<!-- 		
		 <script>

				jQuery(document).ready(function($) {
   				 $(".clickable-row").click(function() {
      				  window.location = $(this).data("href");
   						 });
				});

		</script> 

 -->
 
	</div>


</section>




						

<c:import url="footer.jsp"></c:import>  