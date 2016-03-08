<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script src="<spring:url value="/resources/loginjs/jquery-1.11.2.min.js" />"></script>

<script src="<spring:url value="/resources/js/bootstrap.js" />"></script>
<link href="<spring:url value="/resources/css/bootstrap.css" />" rel="stylesheet">
<link rel="stylesheet" href="<spring:url value="/resources/css/style.css" />" type="text/css"
	media="screen">


</head>
<body>
<div class="container" style="font-family :'Trebuchet MS', Helvetica, sans-serif">
    <div class="row vertical-offset-100">
    	<div class="col-md-4 col-md-offset-4">
    		<div class="panel panel-default">
			  	<div class="panel-heading">
			    	<h3 class="panel-title">Want to offer a ride ? Car Owners please click below</h3>
			 	</div>
			  	<div class="panel-body" >
			  	<a href="ownerPage"><img src="<c:url value="/resources/img/owner.png" />" alt="" style="width:150px;height:100px;display: block;margin-left: auto;margin-right: auto;"/></a>
			    </div>
			</div>
		</div>
		<div class="col-md-4 col-md-offset-4">
    		<div class="panel panel-default">
			  	<div class="panel-heading">
			    	<h3 class="panel-title">Want a Drop ? Others please click below</h3>
			 	</div>
			  	<div class="panel-body">
			  	<a href="poolinPage"><img src="<c:url value="/resources/img/drop.jpg" />" alt="" style="width:150px;height:100px;display: block;margin-left: auto;margin-right: auto;"/></a>
			    </div>
			</div>
		</div>
	</div>
</div>
</body>
</html>