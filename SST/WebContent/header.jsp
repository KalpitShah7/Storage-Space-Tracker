<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="icon" href="Images/logo1.png">
<link rel="Stylesheet" type="text/css" href="CSS/Style.css">
<link rel="Stylesheet" type="text/css" href="CSS/Admin1.css">
<style>
.navbar {
    overflow: hidden;
    background-color: #333;
    font-family: Arial;
}

.navbar a {
    float: left;
    font-size: 16px;
    color: white;
    text-align: center;
    padding: 14px 16px;
    text-decoration: none;
}
.dropdown {
    float: left;
    overflow: hidden;
}

.dropdown .dropbtn {
    font-size: 16px;    
    border: none;
    outline: none;
    color: white;
    padding: 14px 16px;
    background-color: inherit;
}




.navbar a:hover, .dropdown:hover .dropbtn {
    background-color: red;
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
    float: none;
    color: black;
    padding: 12px 16px;
    text-decoration: none;
    display: block;
    text-align: left;
}

.dropdown-content a:hover {
    background-color: #ddd;
}

.dropdown:hover .dropdown-content {
    display: block;
}
</style>
</head>
<body>
<div id="header">
<div id="logo"></div>
<div id="headtitle">Storage Space Tracker</div>
<div id="subtitle">Comfort Provided</div>
<ul class="mymenu">
<% 

	String type=(String)session.getAttribute("type");

 if(type.equals("A"))
{%>
	<div class="navbar">
 <div class="dropdown">
    <button class="dropbtn">Warehouse Manager 
      <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown-content">
      <a href="addWarehouseManager.jsp">Add</a>
      <a href="viewWarehouseManager.jsp">View</a>
      <a href="deleteWarehouseManager.jsp">Delete</a>
       <a href="activateWarehouseManager.jsp">Activate</a>
    </div>
  </div> 
  
  <div class="dropdown">
    <button class="dropbtn">Ship Manager	
      <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown-content">
      <a href="addShipManager.jsp">Add</a>
      <a href="viewShipManager.jsp">View</a>
      <a href="deleteShipManager.jsp">Delete</a>
      <a href="activateShipManager.jsp">Activate</a>
    </div>
  </div> 
  <div class="dropdown">
    <button class="dropbtn">Customer 
      <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown-content">
      <a href="addCustomer.jsp">Add</a>
      <a href="viewCustomer.jsp">View</a>
      <a href="deleteCustomer.jsp">Delete</a>
    </div>
  </div>
  <a href="viewFeedback.jsp">View Feedback</a>
   <a href="logout.jsp">Sign Out</a>
</div>

<%}
 else if(type.equals("WM"))
{ %>
	<li class="mi"><a class="ml" href="updateProfile.jsp">Update Profile</a></li>
	<li class="mi"><a class="ml" href="cp.jsp">Change Password</a></li>
	<li class="mi"><a class="ml" href="viewCustomerWM.jsp">View Customer</a></li>
	<li class="mi"><a class="ml" href="logout.jsp">Sign Out</a></li>
<%}
 else if(type.equals("C"))
{ %>
	<li class="mi"><a class="ml" href="updateProfile.jsp">Update Profile</a></li>
	<li class="mi"><a class="ml" href="cp.jsp">Change Password</a></li>
	<li class="mi"><a class="ml" href="viewOrder.jsp">View Orders</a></li>
	<li class="mi"><a class="ml" href="enterWarehouse.jsp">Enter Into Warehouse</a></li>
	<li class="mi"><a class="ml" href="outWarehouse.jsp">Move Out Of Warehouse</a></li>
	<li class="mi"><a class="ml" href="logout.jsp">Sign Out</a></li>
<%}
 else if(type.equals("SM"))
{ %>
	<li class="mi"><a class="ml" href="updateProfile.jsp">Update Profile</a></li>
	<li class="mi"><a class="ml" href="cp.jsp">Change Password</a></li>
	<li class="mi"><a class="ml" href="viewCustomerSM.jsp">View Customer</a></li>
	<li class="mi"><a class="ml" href="logout.jsp">Sign Out</a></li>
<%}
 	
else{%>
	
<li class="mi"><a class="ml" href="about.jsp">About</a></li>
<li class="mi"><a class="ml" href="login.jsp">Login</a></li>
<li class="mi"><a class="ml" href="register.jsp">Register</a></li>
<li class="mi"><a class="ml" href="contact.jsp">Contact</a></li>
 <% 
 }%>	

</ul>
</div>
</body>
</html>