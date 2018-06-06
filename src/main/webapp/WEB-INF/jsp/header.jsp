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

  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">


  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">


  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
  

  
</head>
<body>

<nav class="navbar navbar-default">
            <div class="container">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="#"><img id="logoimg" src="${pageContext.request.contextPath}/images/logo.png" alt="Logo" /></a>
                </div>

                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">

                    <ul class="nav navbar-nav navbar-right">
                         <li><a href="/home">Home</a></li>
                        <li><a href="/about">About</a></li>
                        <li><a href="${pageContext.request.contextPath}/users1">search</a></li>  
                        <c:if test="${sessionScope.loggedin == true}" > 
                        <li> <a href="${pageContext.request.contextPath}/conversations/?id=${sessionScope.id}">conversations</a></li>  <li><a href="${pageContext.request.contextPath}/profile">profile</a></li>
                        </c:if>

                        <c:if test="${sessionScope.loggedin == null}" > 
                        <li class="login"> <a  href="${pageContext.request.contextPath}/login">login</a></li>
                        <li class="login"> <a  href="${pageContext.request.contextPath}/registration">Register</a></li>
                        </c:if>

                        <c:if test="${sessionScope.loggedin == true}" > 
                        <li class="login"> <a  href="${pageContext.request.contextPath}/logout">logout</a></li>
                        </c:if>

                        <c:if test="${sessionScope.isadmin == true}" > 
                        <li class="adminbtn"> <a  href="${pageContext.request.contextPath}/admin">admin</a></li>
                        </c:if>

                    </ul>

                </div><!-- /.navbar-collapse -->
            </div><!-- /.container-fluid -->
        </nav>