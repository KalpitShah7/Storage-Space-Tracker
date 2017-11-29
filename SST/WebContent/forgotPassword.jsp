<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="forgotServlet" method="post">
<jsp:include page="header1.jsp"></jsp:include>
<center>
<table>
<tr>
<td>Enter Emailid:
</td>
<td><input type="email" name="emailid" placeholder="Enter Emailid" maxlength="100">
</td>
<td>
<td><input class="btn1" type="submit" value="Submit"></td>
<td><input class="btn1" type="reset" value="Clear"></td>
</tr>

</table>

</center>
<jsp:include page="footer.jsp"></jsp:include>
</form>
</body>
</html>