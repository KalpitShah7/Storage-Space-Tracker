<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript" src="js/country_state.js"></script>
<script type="text/javascript" src="js/RegisterValidate.js"></script>
</head>
<body onload="document.register.fname.focus()">
<form name="register"  onsubmit="return formValidate()" action="registerServlet" method="post"> 
<jsp:include page="header1.jsp"></jsp:include>
<center>
<table border="1">
<tr>
<td>First Name</td>
<td><input type="text" name="fname" placeholder="Enter First Name" maxlength="100"></td>
</tr>
<tr>
<td>Middle Name</td>
<td><input type="text" name="mname" placeholder="Enter Middle Name" maxlength="100">*optional</td>
</tr>
<tr>
<td>Last Name</td>
<td><input type="text" name="lname" placeholder="Enter Last Name" maxlength="100"></td>
</tr>
<tr>
<td>Contact</td>
<td><input type="text" name="con"  min="7000000000" max="9999999999" placeholder="Enter Contact" maxlength="10"></td>
</tr>
<tr>
<td>Address</td>
<td><textarea rows="10px" cols="20px" name="add" placeholder="Enter Address" maxlength=""></textarea></td>
</tr>
<tr>
<td>Gender</td>
<td><select name="gen">
<option value="default">I am </option>
<option value="M">Male</option>
<option value="F">Female</option>
<option value="O">Other</option>
</select></td>
</tr>
<tr>
<td>Type</td>
<td><select name="type">
<option value="default">I am </option>
<option value="C">Customer</option>
<option value="WM">Warehouse Manager</option>
<option value="SM">Ship Manager</option>
</select></td>
</tr>
<tr>
<td>Country</td>
<td><select name="country" id="country" required="required"></select></td>
</tr>
<tr>
<td>State</td>
<td><select name="state" id="state" required="required"></select></td>
</tr>
<tr>
<td>Email ID</td>
<td><input type="text" name="emailid" placeholder="Enter Email ID" maxlength="100"></td>
</tr>
<tr>
<td>Password</td>
<td><input type="password" name="pass" placeholder="Enter Password" maxlength="100"></td>
</tr>
<tr>
<td>Confirm Password</td>
<td><input type="password" name="cpass" placeholder="Enter Confirm Password" maxlength="100"></td>
</tr>
<tr>
<td>Date Of Birth</td>
<td><input type="date" name="dob" placeholder="Enter Date Of Birth" maxlength="100" required="required"></td>
</tr>
<tr>

<td>Captcha</td>
<td><img src="http://localhost:8085/SST/captcha.jsp"></td>
</tr>
<tr>

<td>Enter captcha</td>
<td><input type="text" name="captcha" placeholder="Enter Captcha" maxlength="100" required="required"></td>
</tr>
<tr>
<td><input class="btn1" type="submit" value="Register"></td>
<td><input class="btn1" type="reset" value="Clear"></td>
</tr>
</table>
</center>


<jsp:include page="footer.jsp"></jsp:include>
<script type="text/javascript">
populateCountries("country","state");
</script>
</form>
</body>
</html>