<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Attend</title>

<!-- --------------Bootstrap Header------------ -->
	<jsp:include page="bootstrapHeader.jsp"></jsp:include>

<link rel="stylesheet" href="css/styles.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>
<body class="attendbackground">

<!-- -------------------Navbar----------------- -->
<nav class="navbar sticky-top navbar-expand-sm bg-dark navbar-dark">
	<a class="navbar-brand" href="index.jsp"><img src="logo.png"
		style="width: 65px;"></a>
	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>
  	<div class="collapse navbar-collapse" id="navbarSupportedContent">
	<ul class="navbar-nav mr-auto">
		<li class="nav-item active">
			<a class="nav-link" href="attendEvent.do">Attend</a></li>
		<li class="nav-item active">
			<a class="nav-link" href="createEventPage.do">Create</a></li>
		<li class="nav-item active">
			<a class="nav-link" href="viewprofile.do">Your Profile</a></li>
		<li class="nav-item">
		  <div class="logout">
			<a class="nav-link" style="color:#97C4C0" href="loginPage.do">Logout</a>
		  </div>	</li>
	</ul>

	<form action="search.do?search=${search }" class="form-inline my-2 my-lg-0">
	<input class="form-control mr-sm-2" name="search" type="text" placeholder="Search">
	<button id="searchButton" class="btn btn-outline-success my-2 my-sm-0"  type="submit">Search Events</button>
	</form>
	</div>
</nav>

<div class="w3-sidebar w3-bar-block bg-dark w3-text-white pl-3" style="width:10%">
	<h3>Search By</h3>
	<hr>
        <ul class="list-unstyled components">
            <li class="active"><a href="attendEvent.do"><u>All Events</u></a></li>
            <li><!-- Link with dropdown items -->
                <a href="#homeSubmenu" data-toggle="collapse" aria-expanded="false"><h3><u>City</u></h3></a>
                <ul class="collapse list-unstyled w3-text-white" id="homeSubmenu">
                    <li><a href="filterByCity.do?city=Denver"><h5>->Denver</h5></a></li>
                    <li><a href="filterByCity.do?city=Orlando"><h5>->Orlando</h5></a></li>
                    <li><a href="filterByCity.do?city=Columbus"><h5>->Columbus</h5></a></li>
                    <li><a href="filterByCity.do?city=Columbus"><h5>->Boise</h5></a></li>
                    <li><a href="filterByCity.do?city=Columbus"><h5>->New Jersey</h5></a></li>
                    <li><a href="filterByCity.do?city=Columbus"><h5>->Kansas City</h5></a></li>
                    <li><a href="filterByCity.do?city=Columbus"><h5>->Phoenix</h5></a></li>
                    <li><a href="filterByCity.do?city=Columbus"><h5>->Miami</h5></a></li>
                    <li><a href="filterByCity.do?city=Columbus"><h5>->Salt Lake City</h5></a></li>
                </ul>
<!--
            <li><a href="#">Date</a></li>
            <li><a href="#">Contact</a></li> -->
        </ul>

  <br>

</div>


<br><br><br><br>

<div class="container bg-secondary roundCorners">
  	<div class="row justify-content-center">
    		<h1>ATTEND</h1>
  	</div>

  <div class="row justify-content-center">
	<h3>${errorMessage}</h3>
  </div>

<div class="container">
	<c:forEach var="event" items="${events}">
		<div class="row justify-content-center">

			<div class="col-sm-2">
			</div>

	<div class="col-sm-3">
 		${event.title } <strong>IN</strong> ${event.address.city}
	</div>
<!-- Button trigger modal -->
	<div class="col-sm-3">
		<button type="button" class="btn btn-secondary yellowgreen" data-toggle="modal" data-target="#details${event.id }">
  			See Event Details
		</button>
	</div>

<!-- Attend Event Button -->
	<div class="col-sm-3">
		<form action="addEventToUser.do" method="get">
			<input type="submit" class="btn btn-secondary yellowgreen" value="Attend Event"></input><br>
			<input type="hidden" value="${event.id }" name="eventId"></input>
		</form>
	</div>

			<div class="col-sm-1">
			</div>

<!-- Modal -->
<div class="modal fade" id="details${event.id }" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">${event.activity }</h5>
      </div>                    
								<div class="modal-body">
									<strong>Event: </strong> ${event.activity } <br> <strong>Location:
									</strong> ${event.address}<br> <strong>When: </strong>${event.dateTime}
									<br> <strong>Description: </strong>${event.description} <br>
									<strong>Attendees:</strong><br>
										<c:forEach var="ewu" items="${eventsWithUsers}">
												<c:choose>
													<c:when test="${ewu.id eq event.id}">
														<div class="littleBox">
														<div class="container-fluid">
														
														<div class="row">
															<c:forEach var="user" items="${ewu.users}">
															<div class="col-md-5">
															<div class="image">
																<a href="viewUserProfile.do?uid=${user.id }">
																<img src="${user.profile.imageURL }" width="100" height="100" />
																</a>
																<div>${user.userName }</div>
																</div>
															</div>
															</c:forEach>
															</div>
															</div>
														</div>
													</c:when>
												</c:choose>
											</c:forEach>
								</div>
								<div class="modal-footer">
								
	    

        <form action="addEventToUser.do" method="get">
		<input type="submit" class="btn btn-primary" value="Attend Event"></input><br>
		<input type="hidden" value="${event.id }" name="eventId"></input>
		</form>

        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <!-- <button type="button" class="btn btn-primary">Save changes</button> -->


      </div>
    </div>
  </div>
</div>
</div>
<br>
</c:forEach>
</div><br>
</div>

<!-- --------------Bootstrap Footer------------ -->

	<jsp:include page="bootstrapFooter.jsp"></jsp:include>

</body>
</html>
