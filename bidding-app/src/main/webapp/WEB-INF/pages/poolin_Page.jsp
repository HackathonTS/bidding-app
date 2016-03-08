<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Pool-In Page</title>
<script src="<spring:url value="/resources/loginjs/jquery-1.11.2.min.js" />"></script>

<script src="<spring:url value="/resources/js/bootstrap.js" />"></script>
<script src="<spring:url value="/resources/loginjs/owner_Page.js" />"></script>
<link href="<spring:url value="/resources/logincss/font.css" />" rel="stylesheet">
<link href="<spring:url value="/resources/logincss/owner_Page.css" />" rel="stylesheet">
<link href="<spring:url value="/resources/css/bootstrap.css" />" rel="stylesheet">
<link rel="stylesheet" href="<spring:url value="/resources/css/style.css" />" type="text/css"
	media="screen">
<script src="https://maps.googleapis.com/maps/api/js?sensor=false"></script>


<link rel="stylesheet" type="text/css"
	href="http://localhost:8000/easyrtc/easyrtc.css" />

<!--hide-->

<!-- Prettify Code -->
<script type="text/javascript" src="<spring:url value="/resources/js/prettify/prettify.js" />"></script>
<link rel="stylesheet" type="text/css" href="<spring:url value="/resources/js/prettify/prettify.css"  />"/>
<script type="text/javascript" src="<spring:url value="/resources/js/prettify/loadAndFilter.js" />"></script>
<script type="text/javascript" src="<spring:url value="/resources/js/prettify/jquery.min.js" />"></script>
<!--show-->
<!-- Assumes global locations for socket.io.js and easyrtc.js -->
<script src="<spring:url value="/resources/easyrtc/socket.io.js" />"></script>
<script type="text/javascript"
	src="http://localhost:8000/easyrtc/easyrtc.js"></script>
		<script type="text/javascript" src="<spring:url value="/resources/easyrtc/easyrtc_poolin.js" />"></script>
 
 
<script type="text/javascript">
	var user = "${username}"
	connect(user);
	var locations = [ [ 'HSR Layout', 12.916334, 77.632893, 4 ],
	      			[ 'BTM Layout', 12.9200, 77.6100, 5 ],
	    			[ 'Silk Board', 12.916734, 77.621759, 3 ],
	    			[ 'Agara', 12.924167, 77.650547, 2 ],
	    			[ 'Bellandur', 12.922445, 77.668600, 1 ],
	    			[ 'Marathalli', 12.959568, 77.701254, 6 ],
	    			[ 'Mahadevpura', 12.981398, 77.693572, 7 ]
	    			];
var map;
var markers = [];

function init(){
  map = new google.maps.Map(document.getElementById('map-canvas'), {
    zoom: 10,
    center: new google.maps.LatLng(12.916334, 77.632893),
    mapTypeId: google.maps.MapTypeId.ROADMAP
  });

  var num_markers = locations.length;
  for (var i = 0; i < num_markers; i++) {  
    markers[i] = new google.maps.Marker({
      position: {lat:locations[i][1], lng:locations[i][2]},
      map: map,
	  animation: google.maps.Animation.DROP,
      html: locations[i][0],
      id: i,
    });
      
    google.maps.event.addListener(markers[i], 'click', function(){
	
			if (markers[this.id].getAnimation() != null) {
			markers[this.id].setAnimation(null);
		  } else {
			markers[this.id].setAnimation(google.maps.Animation.BOUNCE);
		  }
      var infowindow = new google.maps.InfoWindow({
        id: this.id,
        content:this.html,
        position:this.getPosition()
      });
      google.maps.event.addListenerOnce(infowindow, 'closeclick', function(){
        markers[this.id].setVisible(true);
      });
      this.setVisible(false);
      infowindow.open(map);
    });
  }
}


function connectnow(){
		$("#messagingpart").show();
		$("#messaginginfo").show();
}

function showdest(){
	$('#dest').show();
}

 function showrest(){
	$('#showrest').show();
	init();
	 }
    </script> 
	<style type="text/css">
            #stuffToSend {width:300px;}
            #sendMessageArea{
                float:left;
                width:400px;
                padding-right:20px;
            }
            #sendMessageText{
                width:100%;
                height:100px;
            }
            #conversation {
                height:300px;
                border:solid 1px gray;
                overflow-y:scroll;
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
	<div class="container-fluid" style="padding:0px;font-family :'Trebuchet MS', Helvetica, sans-serif">
    <header id="top" class="header">
        <div class="text-vertical-center clr" >
            <h1>Car Pooling</h1>
            <h3>Getting Late for Office? Then Pool-In now</h3>
            <br>
            <!--<a href="#about" class="btn btn-dark btn-lg">Find Out More</a>-->
        </div>
    </header>
	
	<div class="main">
	<div class="row" style="color:white;padding-left:40px;"><div style="float:left"><h3>WELCOME ${username}</h3></div>
	<div style="float:right;margin-right:50px;margin-top:10px">
	<a href="javascript:formSubmit()"><button type="button" class="btn btn-info" style="float:right">Logout</button></a> </div>
	</div>
    <div class="example row">
	<div class="col-md-12">
    <ul id="nav">
        
		<li><select class="form-control" onchange="showdest();" id="source">
								<option>Select your Source</option>
								<option>HSR Layout</option>
								<option>BTM Layout</option>
								<option>Silk Board</option>
								<option>Agara</option>
								<option>Bellandur</option>
								<option>Koramangala</option>
								<option>Marathalli</option>
								<option>Indiranagar</option>
								<option>Mahadevpura</option>
								<option>KR Puram</option>
						</select></li>
						<li><select class="form-control" style="display:none" id="dest" onchange="showrest();">
								<option>Select Destination</option>
								<option>Select your Source</option>
								<option>HSR Layout</option>
								<option>BTM Layout</option>
								<option>Silk Board</option>
								<option>Agara</option>
								<option>Bellandur</option>
								<option>Koramangala</option>
								<option>Marathalli</option>
								<option>Indiranagar</option>
								<option>Mahadevpura</option>
								<option>KR Puram</option>
						</select></li>
        
    </ul>
	</div>
</div>
<div class="row" id="showrest" style="display:none">
<div class="col-md-8" style="padding:35px">
	<!-- <select size="3" name="decision2" style="overflow:scroll;width:200px;height:100px" id ="result">
	</select><br/> -->
	<!-- <div style="color: white" id ="output"></div> -->
	<div><button type="button" class="btn btn-info" onclick="connectnow();">Submit</button></div><br/>
	<div style="color:white;display:none" id="messaginginfo">
	Following are the list of car owners using the same route.
	Type text and send to the owner you wish to pool in </div><br/>
	<div id="messagingpart" style="display:none">
	 <div id="sendMessageArea">
                    <!--<div id="iam">Obtaining ID...</div>--><br/>
                    <textarea id="sendMessageText" placeholder="Type text here..."></textarea>
                    <div id="otherClients"></div>
                </div>
                <div id="receiveMessageArea" style="color:white">
                    Chat Messages:
                    <div id="conversation" style="color:black"></div>
                </div></div>
</div>

<div id="map-canvas" class="col-md-4"></div>
</div>
</div>
</div>
</body>

</html>