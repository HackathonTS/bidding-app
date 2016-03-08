<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Buyer Page</title>
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


<link rel="stylesheet" type="text/css"
	href="http://localhost:8000/easyrtc/easyrtc.css" />

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
<!--show-->
<!-- Assumes global locations for socket.io.js and easyrtc.js -->
<script src="<spring:url value="/resources/easyrtc/socket.io.js" />"></script>
<script type="text/javascript"
	src="http://localhost:8000/easyrtc/easyrtc.js"></script>
<script type="text/javascript"
	src="<spring:url value="/resources/easyrtc/easyrtc_poolin.js" />"></script>


<script type="text/javascript">
	var user = "${username}"
	/* connect(user); */
	
	function connectnow() {
		$("#messagingpart").show();
		$("#messaginginfo").show();
	}
	var name,itemid,itemname,price;
	function showText1() {
		//$('#text1').show();
		var selectedItem = $("#source").val();
		$.ajax({
			url : "/bidding-app/userItems?itemname=" + selectedItem,
			type : "GET",
			success : function(result) {
				$('#text1').show();
			}
		});
	}
	function showText2() {
		$('#text2').show();
	}
	
	
	function saveBidData() {
		$('#text2').show();
		var val = $('#val').val();
		$.ajax({
			url : "/bidding-app/saveBuyerData?useritemid=${itemId}&price=" +val,
			type : "GET",
			success : function(result) {
				alert("Your requst is saved!");
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
	<div class="container-fluid"
		style="padding: 0px; font-family: 'Trebuchet MS', Helvetica, sans-serif;">
		<header id="top" class="header">
			<div style="background: :white" class="text-vertical-center">
				<div class="clr" style="color: pink">
					<h1>Bidding App</h1>
					<h3>Buy whatever you want</h3>
					<br>
					<!--<a href="#about" class="btn btn-dark btn-lg">Find Out More</a>-->
				</div>
			</div>
		</header>

		<div class="main">
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
								<h4>What would you like to buy?</h4>
							</div>
						</li>
						<li><select class="form-control" onchange="showText1();"
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
			<div style="color: white; display: none" class="example row"
				id="text1">
				<div class="col-md-12">
					<ul id="nav">
						<li>
							<div style="color: white">
								<h4>Details of items for sale under this category ::</h4>
							</div>
						</li>
						<li style="width: 450px"><input
							style="width: 20px; height: 20px" type="checkbox" />
							<div
								style="width: 420px; height: 170px; border: 2px solid white; border-radius: 5px; padding-left: 10px; float: right">
								<h3>
									${name}<br /> <br />Item: ${itemname}<br /> <br />Amount: <input
										style="color: black" disabled="disabled" value="${price}" />Rs.
								</h3>
							</div></li>
						<li><div>
								<button type="button" class="btn btn-info" id="selectItem"
									onclick="showText2()">Submit</button>
							</div> <br /></li>
					</ul>
				</div>
			</div>
			<div style="color: white; display: none" class=" example row"
				id="text2">
				<div class="col-md-12">
					<ul id="nav">
							<div style="color: white">
								<h4>Following people have already bid for the item::</h4>
							</div><br/><li>
							<c:forEach var="data" items="${buyerdata}">
                					<div class="col-md-12">
								<h5>
									Name: ${data.name}&nbsp;&nbsp;&nbsp;
									Item: ${data.userItem.item}&nbsp;&nbsp;&nbsp;
									Amount: <input style="color: black" disabled="disabled"
										value="${data.buyerPrice}" />Rs.
								</h5>
							</div>
            				</c:forEach>
            				<div class="col-md-12">
								<h5>
									Enter your Amount :: &nbsp;&nbsp;<input style="color: black" value="4700" id="val"/>&nbsp;Rs.&nbsp;&nbsp;&nbsp;
									<button type="button" class="btn btn-info" id="bidItem" onclick="saveBidData()">Bid</button>	
								</h5>
							</div>
            				</li>
						<!-- <li>
							<div style="color: white">
								<h4>Following people have already bid for the item::</h4>
							</div><br/>
							<div>
							<div class="col-md-12">
								<h5>
									Name: Buyer1&nbsp;&nbsp;&nbsp;
									Item: Necklace&nbsp;&nbsp;&nbsp;
									Amount: <input style="color: black" disabled="disabled"
										value="4500" />Rs.
								</h5>
							</div>
							<div class="col-md-12">
								<h5>
									Name: Buyer2&nbsp;&nbsp;&nbsp;
									Item: Necklace&nbsp;&nbsp;&nbsp;
									Amount: <input style="color: black" disabled="disabled"
										value="4600" />Rs.
								</h5>
							</div>
							<div class="col-md-12">
								<h5>
									Name: Buyer3&nbsp;&nbsp;&nbsp;
									Item: Necklace&nbsp;&nbsp;&nbsp;
									Amount: <input style="color: black" disabled="disabled"
										value="4700" />Rs.
								</h5>
							</div>
							<div class="col-md-12">
								<h5>
									Enter your Amount :: &nbsp;&nbsp;<input style="color: black" value="4700" id="val"/>&nbsp;Rs.&nbsp;&nbsp;&nbsp;
									<button type="button" class="btn btn-info" id="bidItem" onclick="saveBidData()">Bid</button>	
								</h5>
							</div>
							</div>
						</li> -->
					</ul>
				</div>
			</div>
			<!-- <div class=" example row" id="text" style="display: none">
				<div class="col-md-12">
					<ul id="nav">
						<li>
							<div style="color: white">
								<h4>Following people have already bid for the item</h4>
							</div>
						</li>
						<li><input type="text" id="initialValue" /></li>
						<li><div>
								<button type="button" class="btn btn-info">Submit</button>
							</div>
							<br /></li>
					</ul>
				</div>
			</div> -->
			<div class="row" id="showrest" style="display: none">
				<div class="col-md-8" style="padding: 35px">
					<!-- <select size="3" name="decision2" style="overflow:scroll;width:200px;height:100px" id ="result">
	</select><br/> -->
					<!-- <div style="color: white" id ="output"></div> -->
					<div>
						<button type="button" class="btn btn-info" onclick="connectnow();">Submit</button>
					</div>
					<br />
					<div style="color: white; display: none" id="messaginginfo">
						Following are the list of car owners using the same route. Type
						text and send to the owner you wish to pool in</div>
					<br />
					<div id="messagingpart" style="display: none">
						<div id="sendMessageArea">
							<!--<div id="iam">Obtaining ID...</div>-->
							<br />
							<textarea id="sendMessageText" placeholder="Type text here..."></textarea>
							<div id="otherClients"></div>
						</div>
						<div id="receiveMessageArea" style="color: white">
							Chat Messages:
							<div id="conversation" style="color: black"></div>
						</div>
					</div>
				</div>

				<div id="map-canvas" class="col-md-4"></div>
			</div>
		</div>
	</div>
</body>

</html>