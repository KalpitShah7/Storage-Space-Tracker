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
<body>
<%
if(session.getAttribute("emailid")!=null)
{
	String emailid=(String)session.getAttribute("emailid");
	Model m = new Model();
	String sql1="select itemname,quantity,source1,destination,status,id from placeorder where emailid='"+emailid+"'";
	ResultSet rs1=Dao.validate(m,sql1);
%>
<body>
<jsp:include page="header.jsp"></jsp:include>
<table border="2">
<tr>
<th>Item Name</th>
<th>Quantity</th>
<th>Source</th>
<th>Destination</th>
<th>Status</th>
<th></th>
</tr>
<%	
while(rs1.next())
{
%>
<td><%=rs1.getString(1)%></td>
<td><%=rs1.getString(2)%></td>
<td><%=rs1.getString(3)%></td>
<td><%=rs1.getString(4)%></td>
<td><%=rs1.getString(5)%></td>
<td><a href="changeStatusmoveout.jsp?idcsmo=<%=rs1.getString(6)%>">Change Status</a>
</tr>
<%} %>
</table>
<% }
else
{
	response.sendRedirect("login.jsp");
}
%>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>