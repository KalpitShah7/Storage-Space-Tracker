<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form name="rp" action="resetPasswordServlet" method="post">
<jsp:include page="header1.jsp"></jsp:include>
<center>
<table>
<tr>
<td>New Password</td>
<td><input type="password" name="npass" placeholder="Enter New Password" maxlength="100"></td>
</tr>
<tr>
<td>Confirm Password</td>
<td><input type="password" name="cpass" placeholder="Enter Confirm Password" maxlength="100"></td>
</tr>
<tr>
<td><input type="submit" value="Change"></td>
<td><input type="reset" value="Clear"></td>
</tr>
</center>
</table>
<jsp:include page="footer.jsp"></jsp:include>
</center>
</form>
</body>
</html>