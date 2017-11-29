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
session = request.getSession();
String emailid = (String) session.getAttribute("emailid");
if(session.getAttribute("emailid")!=null)
{
	Model m = new Model();
	String sql="select itemname,quantity,source1,destination,status,charges from placeorder where emailid='"+emailid+"'";
	String sql1="select quantityleft from capacity where emailid='"+emailid+"'";
	ResultSet rs=Dao.validate(m,sql);
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
<th>Charges</th>
<th>Quantity Left</th>
</tr>
<%	
while(rs.next())
{
%>
<tr>
<td><%=rs.getString(1)%></td>
<td><%=rs.getString(2)%></td>
<td><%=rs.getString(3)%></td>
<td><%=rs.getString(4)%></td>
<td><%=rs.getString(5)%></td>
<td><%=rs.getString(6)%></td>
<%
}
while(rs1.next())
{
%>
<td><%=rs1.getString(1)%></td>
</tr>
<%} 

%>
</table>
<% 
}
else
{
	response.sendRedirect("login.jsp");
}
%>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>