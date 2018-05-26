<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>


<table class="table">
  <thead>
    <tr>
      <th scope="col">#</th>
      <th scope="col">text</th>
      <th scope="col">sender</th>
      <th scope="col">receiver</th>
    </tr>
  </thead>
  <tbody>
   <c:forEach var="par" items="${list}">
    <a href="messages/<c:out value="${par.id}"/>">a</a><tr>
      <th scope="row">1</th>
      <td><c:out value="${par.text}"/></td>
      <td><c:out value="${par.sender.username}"/></td>
      <td>${par.receiver.username}</td>
    </tr>
  </c:forEach>
  </tbody>
</table>

</body>
</html>