<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript" src="js/country_state.js"></script>
</head>
<body>
<%
try{
	String emailid = (String)session.getAttribute("emailid");
	Class.forName("com.ibm.db2.jcc.DB2Driver");
	Connection con = DriverManager.getConnection("jdbc:db2://localhost:50000/SST","Admin","Kalpit@123");
	PreparedStatement ps = con.prepareStatement("select * from register where emailid='"+emailid+"'");
	ResultSet rs = ps.executeQuery();
	while(rs.next())
	{
		String f = rs.getString(1);
		String l = rs.getString(2);
		String c = rs.getString(3);
		String a = rs.getString(4);
		String d = rs.getString(11);
%>
<body>
<jsp:include page="header.jsp"></jsp:include>
<form name="update" action="updateServlet" method="post">
<center>
<table border="1">
<tr>
<td>First Name</td>
<td><input type="text" name="fname" value="<%=f%>" placeholder="Enter First Name" maxlength="100"></td>
</tr>
<tr>
<td>Last Name</td>
<td><input type="text" name="lname" value="<%=l%>" placeholder="Enter Last Name" maxlength="100"></td>
</tr>
<tr>
<td>Contact</td>
<td><input type="text" name="con"   value="<%=c%>" min="7000000000" max="9999999999" placeholder="Enter Contact" maxlength="10"></td>
</tr>
<tr>
<td>Address</td>
<td><input type="text" rows="10px" cols="20px" value="<%=a%>" name="add" placeholder="Enter Address"></td>
</tr>
<tr>
<td>Email ID</td>
<td><input type="hidden" value="${emailid}" name="emailid" placeholder="Enter Email ID" maxlength="100"></td>
</tr>
<tr>
<td>Date Of Birth</td>
<td><input type="text" name="dob" value="<%=d%> "placeholder="Enter Date Of Birth" maxlength="100" required="required"></td>
</tr>
<tr>
<td><input class="btn1" type="submit" value="Update"></td>
<td><input class="btn1" type="reset" value="Clear"></td>
</tr>
</table>
</center>
<%
	}
}
catch(Exception e)
{
	e.printStackTrace();
}
%>
</form>
<jsp:include page="footer.jsp"></jsp:include>
<script type="text/javascript">
populateCountries("country","state");
</script>
</body>
</html>