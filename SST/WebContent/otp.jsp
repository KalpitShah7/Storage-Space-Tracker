<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript">


<%try {
	String ms = request.getParameter("msg");
	if (ms.equals("send")) {%>
alert("OTP Sent to registered emailid");
window.location.href = "otp.jsp";
	<%}
} catch (Exception e) {
	e.printStackTrace();
}%>


</script>
</head>
<body>
<form action="otpServlet" method="post">
<jsp:include page="header1.jsp"></jsp:include>
<center>
<table>
<tr>
<td>Enter Otp:
</td>
<td><input type="text" name="otp" placeholder="Enter Otp"></td>
</tr>
<tr>
<td><input type="submit" value="Submit">
</td>
<td><input type="reset" value="Clear"></td>
</tr>
</table>
</center>
</form>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>