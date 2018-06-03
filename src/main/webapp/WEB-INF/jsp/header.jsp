<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
  <title>Ask A Pro</title>
  <meta charset="utf-8"/>

  <link href='https://fonts.googleapis.com/css?family=Roboto:300,400,700' rel='stylesheet' type='text/css'>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/basic-style.css">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/profile_style.css">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/search-users.css">
   <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/chat.css">

  <script src="${pageContext.request.contextPath}/js/basic.js"></script>
  <script src="${pageContext.request.contextPath}/js/form.js"></script>



  <link href='  https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css' rel='stylesheet' type='text/css'>

  
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

	<link href='https://fonts.googleapis.com/css?family=Roboto:300,400,700' rel='stylesheet' type='text/css'>

  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">


  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">


  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
  

  
</head>
<body>
  <style>
  .nav a:hover {
    background-color: #27c77ded;
  
}
</style>



  <nav class=" navbar ">
    <div class="container-fluid">

      <div class="navbar-header">

        <button type="button btn" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar" style="background-color: rgba(115, 125, 150,0.1);">options</button>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>                        
        </button>

        <a class="navbar-brand" href="#"><p style=" font-weight:bold; font-size: 180%;color:#27c77ded">Ask a pro</p></a>
      </div>
      <div class="collapse navbar-collapse" id="myNavbar">

        <div class="nav navbar-nav navbar-right">
          <a class="navbar-brand" href="${pageContext.request.contextPath}/users1">search</a>
          <c:if test="${sessionScope.loggedin == true}" > 
          <a class="navbar-brand" href="${pageContext.request.contextPath}/conversations/?id=${sessionScope.id}">conversations</a>
           </c:if>
          <c:if test="${sessionScope.loggedin == true}" > 
          <a class="navbar-brand" href="${pageContext.request.contextPath}/profile">profile</a>
          </c:if>
           <c:if test="${sessionScope.loggedin == null}" > 
            <a class="navbar-brand" href="${pageContext.request.contextPath}/login">login</a>
            <a class="navbar-brand" href="${pageContext.request.contextPath}/registration">Register</a>
          </c:if>
          <c:if test="${sessionScope.loggedin == true}" > 
            <a class="navbar-brand" href="${pageContext.request.contextPath}/logout">logout</a>
          </c:if>
          

          
        </div>
      </div>
    </div> 
  </nav>