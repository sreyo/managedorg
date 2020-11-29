<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<head>
<title>User Dashboard</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Material+Icons">
    <link rel="stylesheet" href="https://unpkg.com/bootstrap-material-design@4.1.1/dist/css/bootstrap-material-design.min.css" integrity="sha384-wXznGJNEXNG1NFsbm0ugrLFMQPWswR3lds2VeinahP8N0zJw9VWSopbjv2x7WCvX" crossorigin="anonymous">
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons">
    <link rel="stylesgeet" href="https://rawgit.com/creativetimofficial/material-kit/master/assets/css/material-kit.css">

<script type="text/javascript"><%@include file="/WEB-INF/js/user.js"%></script>
<style><%@include file="/WEB-INF/css/Userprofile.css"%></style>

<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<style>
 .list-group {
     
     margin:auto;
     float:left;
     padding-top:20px;
     font-size: 12px;
    }
    .lead {
     
     margin:auto;
     left:0;
     right:0;
     padding-top:10%;
    }

</style>

</head>

<body class="profile-page">
    <nav class="navbar navbar-color-on-scroll navbar-transparent    fixed-top  navbar-expand-lg "  color-on-scroll="100"  id="sectionsNav">
        <div class="container">
            <div class="navbar-translate">
                <a class="navbar-brand" href="../index.html">UPETA </a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                    <span class="navbar-toggler-icon"></span>
                    <span class="navbar-toggler-icon"></span>
                </button>
            </div>
        
            <div class="collapse navbar-collapse">
                <ul class="navbar-nav ml-auto">
                    <li class="dropdown nav-item">
                      <a href="#" class="dropdown-toggle nav-link" data-toggle="dropdown" aria-expanded="false">
                          <i class="material-icons">apps</i> <%= session.getAttribute("name") %>
                          
                      </a>
                      <div class="dropdown-menu dropdown-with-icons">
                        <a href="${pageContext.request.contextPath}/familymembers.jsp" class="dropdown-item">
                            <i class="material-icons">layers</i> Family Members
                        </a>
<!--                         <a href="#" class="dropdown-item">
                            <i class="material-icons">layers</i> Edit Profile
                        </a>
 -->                        
                        <a href="${pageContext.request.contextPath}/useraddmember.jsp" class="dropdown-item">
                            <i class="material-icons">layers</i> Add Members
                        </a>
                        <a href="${pageContext.request.contextPath}/logout.jsp" class="dropdown-item">
                            <i class="material-icons">layers</i> Logout
                            
                        </a>
                        
                      </div>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    
    <div class="page-header " data-parallax="true" style="background-image:url('http://getwallpapers.com/wallpaper/full/a/5/d/544750.jpg');"></div>
    <div class="main main-raised">
            <div class="container">
  			  <div class="panel panel-default">
