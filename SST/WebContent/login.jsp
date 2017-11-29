<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	
		<jsp:include page="header1.jsp"></jsp:include>
		<script type="text/javascript">
			//scriptlet tag //in this we can write complete java code.
		<%try {
				String ms = request.getParameter("msg");
				if (ms.equals("success")) {%>
			alert("You are registered successfully please login!");
		<%} else if (ms.equals("successs")) {%>
			alert("Password Changed Successfully");
		<%} else if (ms.equals("pc")) {%>
			alert("Password Changed Successfully through mail");
			<%} else if (ms.equals("try")) {%>
			alert("Failed! Incorrect Details!Please Try again!");
		<%}else if (ms.equals("usuccess")) {%>
		alert("Updated Successfully! Please Login");
	<%}else if (ms.equals("redirect")) {%>
	alert("Wait till admin activates your account!");
<%}
			} catch (Exception e) {
				e.printStackTrace();
			}%>
			
		</script>
		<form action="loginServlet" method="post">
		<center>
			<table>
				<tr>
					<td>Email id :</td>
					<td><input type="text" name="emailid" placeholder="Enter Emailid" maxlength="100"></td>
				</tr>
				<tr>						
					<td>Password :</td>
					<td><input type="password" name="pass" placeholder="Enter Password" minlength="7" maxlength="12"
					>
					</td>
				</tr>
				
				
				<tr>
				<td>
				Type :
				</td>
				<td> <select name="type">
				<option value="A">Admin</option>
				<option value="C">Customer</option>
				<option value="WM">Warehouse Manager</option>
				<option value="SM">Ship Manager</option>
				</select> </td>
				</tr>
				
				</table>
				<table>
				<tr>
					<td><input class="btn1" type="submit"></td>
				</tr>
				<tr>		
					<td><input class="btn1" type="reset" value="Clear"></td>
				</tr>
			 	
			</table>
			<a href="forgotPassword.jsp">Forgot Password</a> 
		</center>
		
	</form>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>