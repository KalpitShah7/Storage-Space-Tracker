<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
pre {
	color: black;
	font-weight: bold;
	font-size: 25px;
	
}


</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript">
<%try {
				String ms = request.getParameter("msg");
				if (ms.equals("success")) {%>
			alert("Thankyou for your valuable feedback!");
		<%} else if (ms.equals("failed")) {%>
			alert("Please Try Again!");
	<%}
			} catch (Exception e) {
				e.printStackTrace();
			}%>
</script>
</head>
<body>
	<form action="contactServlet" method="post">
		<jsp:include page="header1.jsp"></jsp:include>
		<div
			style="float: left; width: 50%; height: 100%; margin-left: 0px; margin-top: 30px;">
			<pre>
Contact information:

Parimal House;
Near Parimal Garden;
Ambawadi Ahmedabad;
Gujarat-380006;

<img src="Images/1.png" style="width: 50%; height: 300px;">
</pre>
		</div>
		<div
			style="float: right; width: 50%; height: 100%; margin-left: 0px; margin-top: 55px;">
			<center>
				<table>
					<tr>
						<td>From:</td>
						<td><input type="email" name="emailid" size="67"
							placeholder="enter Emailid" maxlength="100"></td>
					</tr>
					<tr>
						<td>subject:</td>
						<td><input type="text" name="sub" size="67"
							placeholder="Enter Subject" maxlength=100></td>
					</tr>
					<tr>
						<td>Message:</td>
						<td><textarea rows="20" cols="50" name="msg"
								placeholder="Enter message" maxlength="1000">
</textarea></td>
					</tr>
					<tr>
						<td><input class="btn1" type="submit" value="send"></td>
						<td><input class="btn1" type="reset" value="clear"></td>
					</tr>
				</table>
			</center>
		</div>
	</form>
</body>
</html>