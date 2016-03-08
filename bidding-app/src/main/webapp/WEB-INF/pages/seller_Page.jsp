<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Seller Page</title>
<script
	src="<spring:url value="/resources/loginjs/jquery-1.11.2.min.js" />"></script>

<script src="<spring:url value="/resources/js/bootstrap.js" />"></script>
<script src="<spring:url value="/resources/loginjs/owner_Page.js" />"></script>
<link href="<spring:url value="/resources/logincss/font.css" />"
	rel="stylesheet">
<link href="<spring:url value="/resources/logincss/owner_Page.css" />"
	rel="stylesheet">
<link href="<spring:url value="/resources/css/bootstrap.css" />"
	rel="stylesheet">
<link rel="stylesheet"
	href="<spring:url value="/resources/css/style.css" />" type="text/css"
	media="screen">
<script src="https://maps.googleapis.com/maps/api/js?sensor=false"></script>

<!--hide-->

<!-- Prettify Code -->
<script type="text/javascript"
	src="<spring:url value="/resources/js/prettify/prettify.js" />"></script>
<link rel="stylesheet" type="text/css"
	href="<spring:url value="/resources/js/prettify/prettify.css"  />" />
<script type="text/javascript"
	src="<spring:url value="/resources/js/prettify/loadAndFilter.js" />"></script>
<script type="text/javascript"
	src="<spring:url value="/resources/js/prettify/jquery.min.js" />"></script>
<script type="text/javascript">
	var user = "${username}";
	/* connect(user); */
	function showdest() {
		$('#text').show();

	}
	function savePrice() {
		var price = $("#initialValue").val();
		var selectedItem = $("#source").val();
		$.ajax({
			url : "/bidding-app/saveSellerData?item=" + selectedItem + "&price=" + price,
			type : "GET",
			success : function(result) {
				$('#output').html(result);
				$('#chat').show();
				init();
			}
		});

	}
	
	
</script>
<style type="text/css">
#stuffToSend {
	width: 300px;
}

#sendMessageArea {
	float: left;
	width: 400px;
	padding-right: 20px;
}

#sendMessageText {
	width: 100%;
	height: 100px;
}

#conversation {
	height: 300px;
	border: solid 1px gray;
	overflow-y: scroll;
	background: white;
}
</style>
</head>
<body>
	<c:url value="/j_spring_security_logout" var="logoutUrl" />
	<form action="${logoutUrl}" method="post" id="logoutForm">
		<input type="hidden" name="${_csrf.parameterName}"
			value="${_csrf.token}" />
	</form>
	<script>
		function formSubmit() {
			document.getElementById("logoutForm").submit();
		}
	</script>
	<!-- Header -->
	<div class="container-fluid" style="padding: 0px">
		<header id="top" class="header">
			<div class="text-vertical-center clr"
				style="font-family: 'Trebuchet MS', Helvetica, sans-serif;color: pink">
				<h1>Bidding App</h1>
				<h3>Sell your items in a smart way</h3>
				<br>
				<!--<a href="#about" class="btn btn-dark btn-lg">Find Out More</a>-->
			</div>
		</header>

		<div class="main"
			style="font-family: 'Trebuchet MS', Helvetica, sans-serif">
			<div class="row" style="color: white; padding-left: 40px;">
				<div style="float: left">
					<h3>WELCOME ${username}</h3>
				</div>
				<div style="float: right; margin-right: 50px; margin-top: 10px">
					<a href="javascript:formSubmit()"><button type="button"
							class="btn btn-info" style="float: right">Logout</button></a>
				</div>
			</div>
			<div class="example row">
				<div class="col-md-12">

					<ul id="nav">
						<li>
							<div style="color: white">
								<h4>I would like to sell ::</h4>
							</div>
						</li>
						<li><select class="form-control" onchange="showdest();"
							id="source" onchange="callajax();">
								<option>Select</option>
								<option>Jewellery</option>
								<option>Sarees</option>
								<option>Home items</option>
								<option>Crockeries</option>
						</select></li>

					</ul>
				</div>
			</div>
			<div class=" example row" id="text" style="display: none">
				<div class="col-md-12">
					<ul id="nav">
						<li>
							<div class="col-md-12" style="color: white">
								<h5>
									Quote your initial price here&nbsp;&nbsp;&nbsp; <input style="color:black"
										type="text" id="initialValue" />&nbsp;&nbsp;&nbsp;
									<button type="button" class="btn btn-info" onclick="savePrice();">Submit</button>
								</h5>
							</div>
						</li>
					</ul>
				</div>
			</div>
			<div class="row" style="display: none" id="chat">
				<div class="col-md-8" style="padding: 35px">
					<div style="color: white">
						<h3>Shortest path to your destination would be via :</h3>
					</div>
					<br />
					<div style="color: white" id="output"></div>
					<br />
					<div id="sendMessageArea">
						<br />
						<textarea id="sendMessageText"></textarea>
						<div id="otherClients"></div>
					</div>
					<div id="receiveMessageArea" style="color: white">
						Chat Messages:
						<div id="conversation" style="color: black"></div>
					</div>
				</div>
				<div id="map-canvas" class="col-md-4"></div>
			</div>
		</div>
	</div>
</body>
</html>