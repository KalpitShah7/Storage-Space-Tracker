<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form name="cp" action="cpServlet" method="post">
<jsp:include page="header.jsp"></jsp:include>
<center>
<table>
<tr>
<td>Old Password</td>
<td><input type="password" name="opass" placeholder="Enter Old Password" maxlength="100"></td>
</tr>
<tr>
<td>New Password</td>
<td><input type="password" name="npass" placeholder="Enter New Password" maxlength="100"></td>
</tr>
<tr>
<td>Confirm Password</td>
<td><input type="password" name="cpass" placeholder="Enter Confirm Password" maxlength="100"></td>
</tr>
<tr>
<td><input class="btn1" type="submit" value="Change"></td>
<td><input class="btn1" type="reset" value="Clear"></td>
</tr>
</center>
</table>
<jsp:include page="footer.jsp"></jsp:include>
</center>
</form>
</body>
</html>