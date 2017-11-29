<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="refresh"
	content="<%=session.getMaxInactiveInterval()%>;URL=./logout.jsp">
  <!-- Delete Back Browser's History Important! -->
<script type="text/javascript" language="javascript">
	javascript: window.history.forward(1);
</script>

<%
	 	response.setHeader("Pragma", "no-cache");
	 	response.setHeader("Cache-Control", "no-store");
	 	response.setHeader("Expires", "0");
	 	response.setDateHeader("Expires", -1);
%>


<title>Insert title here</title>
</head>
<body>
	<%
		if (session.getAttribute("emailid") != null) {
	%>
	<jsp:include page="header.jsp"></jsp:include>
	 Welcome ${emailid} 
	<%
		}
	%>
	<script type="text/javascript">
		// scriptlet tag // in this we can write complete java code.
	<%try {
					String ms = request.getParameter("msg");
					if (ms.equals("success")) {%>
		alert("Login Successfull");
	<%} else if (ms.equals("successs")) {%>
		alert("Update Successfull");
	<%}
				} catch (Exception e) {
					e.printStackTrace();
				}%>
		
	</script>
</body>
<jsp:include page="footer.jsp"></jsp:include>
</html>