<%@page import="java.sql.*"%>
<%@page import="model.Model"%>
<%@page import="dao.Dao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<%
	if (session.getAttribute("emailid") != null) {
		Model m = new Model();
		ResultSet rs = Dao.validate(m, "select * from register where type1='C'");
%>
<body>
<jsp:include page="header.jsp"></jsp:include>
	<table border="2">
		<tr>
			<th>First Name</th>
			<th>Last Name</th>
			<th>Contact</th>
			<th>Address</th>
			<th>Gender</th>
			<th>Country</th>
			<th>State</th>
			<th>Email id</th>
			<th>DOB</th>
			<th>Action</th>
		</tr>
		<%
			while (rs.next()) {
		%>
		<tr>
			<td><%=rs.getString(1)%></td>
			<td><%=rs.getString(2)%></td>
			<td><%=rs.getString(3)%></td>
			<td><%=rs.getString(4)%></td>
			<td><%=rs.getString(5)%></td>
			<td><%=rs.getString(7)%></td>
			<td><%=rs.getString(8)%></td>
			<td><%=rs.getString(9)%></td>
			<td><%=rs.getString(11)%></td>
			<td><a href="deleteC.jsp?idc=<%=rs.getString(12)%>">Delete</a>
		</tr>
		<%
			}
		%>
	</table>
	<%
		} else {
			response.sendRedirect("login.jsp");
		}
	%>

<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>