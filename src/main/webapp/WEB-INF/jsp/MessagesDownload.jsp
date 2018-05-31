<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<c:import url="header.jsp"></c:import>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 


<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>


<%@ page import="java.util.*"%>
<!-- <link rel="stylesheet" href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css">
<link rel="stylesheet" href="https://cdn.datatables.net/buttons/1.5.1/css/buttons.dataTables.min.css">
<script src="https://cdn.datatables.net/buttons/1.5.1/js/buttons.print.min.js"></script>
<script src="https://cdn.datatables.net/buttons/1.5.1/js/buttons.html5.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/vfs_fonts.js
"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/amcharts/3.21.13/plugins/export/libs/pdfmake/pdfmake.min.js
"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
<script src="https://cdn.datatables.net/buttons/1.5.1/js/buttons.flash.min.js"></script>
<script src="https://cdn.datatables.net/buttons/1.5.1/js/dataTables.buttons.min.js"></script>
<script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js
"></script> -->


 <link rel="stylesheet" href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css">
<link rel="stylesheet" href="https://cdn.datatables.net/buttons/1.5.1/css/buttons.dataTables.min.css">
<script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/buttons/1.5.1/js/dataTables.buttons.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js

"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/amcharts/3.21.13/plugins/export/libs/pdfmake/pdfmake.min.js
"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/vfs_fonts.js"></script>
<script src="https://cdn.datatables.net/buttons/1.5.1/js/buttons.html5.min.js"></script>








<div class="container">
<table id="example" class="display nowrap" style="width: 100%">
	<thead>
		<tr>
			<th>Sender</th>
			<th>Receiver</th>
			<th>Timestamp</th>
			<th>Text</th>
		</tr>
	</thead>
	<tbody>
	<c:forEach items="${list}" var="message">
		<tr>
			<td>${message.sender.username }</td>
			<td>${message.receiver.username }</td>
			<td><fmt:formatDate pattern="dd-MM-yyyy hh:mm:ss a" value="${message.dateTime}" /></td>
			<td>${message.text}</td>
		</tr>

	</c:forEach>

	</tbody>
</table>

</div>


<script>
$(document).ready(function() {
    $('#example').DataTable( {
    	
        dom: 'Bfrtip',
        buttons: [
            'copyHtml5',
            'excelHtml5',
            'csvHtml5',
            'pdfHtml5'
        ]
    } );
} );
</script>

<c:import url="footer.jsp"></c:import>  