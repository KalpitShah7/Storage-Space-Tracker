<%@page import="java.sql.ResultSet"%>
<%@page import="dao.Dao"%>
<%@page import="model.Model"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%if(session.getAttribute("emailid")!=null)
	{
	String email= (String)session.getAttribute("emailid");
	String page1="";
Model m = new Model();
String id=request.getParameter("idcswm");
String sql="select status from placeorder";
String status=null;
ResultSet rs=Dao.validate(m, sql);
while(rs.next())
{
	status=rs.getString(1);
	if(status.equals("shipped"))
	{
		int i = Dao.register(m,"update placeorder set status='moved in',warehousemanager='"+email+"' where id='"+id+"'");
		if(i!=0)
		{
			page1="viewCustomerWM.jsp";
		}

	}
	else
	{
		page1="error.jsp?msg=notmoved";
	}
	response.sendRedirect(page1);
}
}
%>

</body>
</html>