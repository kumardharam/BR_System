<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
    overflow: hidden;
    background-color: #3665c2;
}

li {
    float: left;
}

li a, .dropbtn {
    display: inline-block;
    color: white;
    text-align: center;
    padding: 10px 15px;
    text-decoration: none;
}

li a:hover, .dropdown:hover .dropbtn {
    background-color: MediumSpringGreen  ;
}

li.dropdown {
    display: inline-block;
}

.dropdown-content {
    display: none;
    position: absolute;
    background-color: #f9f9f9;
    min-width: 160px;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    z-index: 1;
}

.dropdown-content a {
    color: black;
    padding: 12px 16px;
    text-decoration: none;
    display: block;
    text-align: left;
}

.dropdown-content a:hover {
background-color: #f06009; 
color: white;
}

.dropdown:hover .dropdown-content {
    display: block;
}
</style>
</head>
<body>
	<ul>
  <li><a href="adminhomepage.jsp">Home</a></li>
  <li class="dropdown">
    <a href="javascript:void(0)" class="dropbtn">Stoppage</a>
    <div class="dropdown-content">
      <a href="#" onclick="viewstoppage()">View Stoppage</a>
      <a href="#" onclick="addstoppage()">Add Stoppage</a>
      <a href="#" onclick="viewstoppage()">Edit Stoppage</a>
      <a href="#" onclick="viewstoppage()">Delete Stoppage</a>
    </div>
  </li>
  <li class="dropdown">
    <a href="javascript:void(0)" class="dropbtn">Bus Info.</a>
    <div class="dropdown-content">
      <a href="#" onclick="viewbus()">View Bus</a>
      <a href="#" onclick="addbus()">Add Bus</a>
      <a href="#" onclick="viewbus()">Edit Bus</a>
      <a href="#" onclick="viewbus()">Delete Bus</a>
    </div>
  </li>
  <li class="dropdown">
    <a href="javascript:void(0)" class="dropbtn">Bus Status</a>
    <div class="dropdown-content">
      <a href="#" onclick="viewbusstatus()">View Booked Status</a>
    </div>
  </li>
   <li class="dropdown">
    <a href="javascript:void(0)" class="dropbtn">Feedback</a>
    <div class="dropdown-content">
      <a href="#" onclick="viewfeedback()">View User Feedback</a>
    </div>
  </li>
  <li style="float: right;"><a href="adminlogout.jsp">LogOut</a> </li>
</ul>
</body>
</html>