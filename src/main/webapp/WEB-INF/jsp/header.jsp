<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
  <title>Skillfair</title>
  <meta charset="utf-8"/>

  <link href='https://fonts.googleapis.com/css?family=Roboto:300,400,700' rel='stylesheet' type='text/css'>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/basicStyle.css">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/profile_style.css">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/SearchUsers.css">
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
  <nav class=" navbar ">
    <div class="container-fluid">

      <div class="navbar-header">

        <button type="button btn" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar" style="background-color: rgba(115, 125, 150,0.1);">options</button>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>                        
        </button>

        <a class="navbar-brand" href="#"><p style=" font-size: 180%;">Conversations</p></a>
      </div>
      <div class="collapse navbar-collapse" id="myNavbar">

        <div class="nav navbar-nav navbar-right">
          <a class="navbar-brand" href="#">search</a>
          <a class="navbar-brand" href="#">conversations</a>
          <a class="navbar-brand" href="#">profile</a>

          
        </div>
      </div>
    </div> 
  </nav>