<%@ page import="java.sql.*" %>
<%@ page import="model.Model" %>
<%@ page import="dao.Dao" %>
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

Model m = new Model();
String id=request.getParameter("idcsmo");

String page1="";
String sql1="select status from placeorder where id='"+id+"'";
ResultSet rs2=Dao.validate(m, sql1);
if(rs2.next())
{
	String status=rs2.getString(1);
	if(status.equals("moved in"))
	{
int i = Dao.register(m,"update placeorder set status='moved out' where id='"+id+"'");
if(i!=0)
{
	String sql="select emailid,quantity from placeorder where id='"+id+"'";
	ResultSet rs=Dao.validate(m, sql);
	if(rs.next())
	{
		String email=rs.getString(1);
		String checkspace="select quantityleft from capacity where emailid='"+email+"'";
		ResultSet rs1=Dao.validate(m,checkspace);
		if(rs1.next())
		{
			String spacewarehouse=rs.getString(2);
			String space=rs1.getString(1);
			System.out.println(space);
			System.out.println(spacewarehouse);
			int qua=Integer.parseInt(spacewarehouse);
			int userqut=Integer.parseInt(space);
			int ans=qua+userqut;
			String answer= String.valueOf(ans);
			String updatespace="update capacity set quantityleft='"+answer+"' where emailid='"+email+"'";
			int j=Dao.register(m, updatespace);
			if(j!=0)
			{
				page1="outWarehouse.jsp";				
			}
			
			
		}
	}
	
}
	}
	else
	{
		page1="error.jsp?msg=notmovedin";
	}
}
response.sendRedirect(page1);

%>
</body>
</html>