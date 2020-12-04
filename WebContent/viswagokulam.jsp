<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
	<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" id="bootstrap-css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/css/select2.min.css" />
	<link rel="stylesheet" type="text/css" href="WEB-INF/css/dashstyle.css">  
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

	<script type="text/javascript" src="//code.jquery.com/jquery-1.11.1.min.js"></script>
	<script type="text/javascript" src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment-with-locales.min.js"></script>
	<script type="text/javascript" src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>
	<script type="text/javascript" src="/WEB-INF/js/dashjs.js"></script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.47/js/bootstrap-datetimepicker.min.js"></script>
	<style type="text/css">
		html,body{
		background-image: url('mmsbg1.jpeg');
		background-size: 100% 100%;
		background-repeat: no-repeat;
		font-family: 'Numans', sans-serif;
		/*  overflow: hidden;
		*/}
		footer{
		background-image: url('header.jpg');
		background-size: 100% 100%;
		background-repeat: no-repeat;
		}
		.logo-div  {
		Width: 100px; /* Adjust as needed */
		height: 40px; /* Adjust as needed */
		left:0; /* Adjust as needed */
		top: 0; /* Adjust as needed */
		z-index: 1; /* Adjust as needed */
		}
	</style>
	<title>VISWAGOKULAM REGISTRATION</title>
</head>
<body>
    <jsp:include page="reguserheader.jsp" /> 

    <div class="panel-body" style="background-image: url('mmsbg1.jpeg');background-size: 100% 100%;background-repeat: no-repeat;">
        <jsp:include page="registerviswagokulam.html" />  
    </div>

    <jsp:include page="userfooter.jsp" />  
</body>
</html>