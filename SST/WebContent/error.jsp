<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<script type="text/javascript">
		// scriptlet tag // in this we can write complete java code.
	<%try {
				String ms = request.getParameter("msg");
				if (ms.equals("check")) {%>
		alert("Something is wrong Try registering once again");
		window.location.href = "register.jsp";
	<%} else if (ms.equals("failed")) {%>
		alert("Try registering again");
		window.location.href = "register.jsp";
	<%} else if (ms.equals("date")) {%>
		alert("Please enter valid Date Of Birth");
		window.location.href = "register.jsp";
		<%} else if (ms.equals("ufailed")) {%>
		alert("Update Failed! Please Login");
		window.location.href = "login.jsp";
	<%} else if (ms.equals("captcha")) {%>
		alert("Incorrect Captcha Please try again");
		window.location.href = "register.jsp";
	<%} else if (ms.equals("notchanged")) {%>
		alert("Please try again");
		window.location.href = "cp.jsp";
		<%} else if (ms.equals("unmatch")) {%>
		alert("Please try again!");
		window.location.href = "cp.jsp";
	<%} else if (ms.equals("contains")) {%>
		alert("New Password contains Old Password Please try again");
		window.location.href = "cp.jsp";
	<%} else if (ms.equals("sameold")) {%>
		alert("New password and old password could not be same Please try again");
		window.location.href = "cp.jsp";
	<%} else if (ms.equals("olddontmatch")) {%>
		alert("Your Old password doesn't match Please try again");
		window.location.href = "cp.jsp";
	<%}else if (ms.equals("abc")) {%>
	alert("Emailid can't be empty Please try again");
	window.location.href = "login.jsp";
	<%}else if (ms.equals("fail")) {%>
	alert("Password didn't changed Please try again");
	window.location.href = "forgotPassword.jsp";
<%}
	else if (ms.equals("nospace")) {%>
	alert("No Space left");
	window.location.href = "enterWarehouse.jsp";
<%}
	else if(ms.equals("notbooked"))
	{%>
		alert("Fail to update status! please try again!");
		window.location.href = "viewCustomerSM.jsp";
	<%}
	else if(ms.equals("notmoved"))
	{%>
		alert("Fail to update status! please try again!");
		window.location.href = "viewCustomerWM.jsp";
	<%}
	else if(ms.equals("notmovedin"))
	{%>
		alert("Fail to update status! please try again!");
		window.location.href = "outWarehouse.jsp";
	<%}
	} catch (Exception e) {
				e.printStackTrace();
			}%>
		
	</script>
</body>
</html>