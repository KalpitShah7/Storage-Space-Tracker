<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript">
function updateTo(){
	
	var from = document.getElementById('from');
	var to = document.getElementById('to');
	to.removeChild(to.options[from.selectedIndex]);
}



function updateTextInput(val)
{
	document.getElementById('quantitynumber').value=val;	
}
	
<%try {
				String ms = request.getParameter("msg");
				if (ms.equals("success")) {%>
	alert(" Shipment Booked.Thankyou for using our service!");
<%} else if (ms.equals("failed")) {%>
	alert("Try booking again!");
<%}
			} catch (Exception e) {
				e.printStackTrace();
			}%>
	
</script>
</head>
<body>
	 <jsp:include page="header.jsp"></jsp:include>
	<form name="register1" action="enterWHServlet" method="post">
		<center>
			<table border="1">
				<tr>
					<%
						if(request.getAttribute("charges") != null){
					%>
						<td>
							Your charges are <%= request.getAttribute("charges") %>
						</td>
					<% 		
						}
					%>
				</tr>
				<tr>
					<td>Name of item</td>
					<td><input type="text" name="iname"
						placeholder="Enter Name Of Item" maxlength="100"></td>
				</tr>
				<tr>
					<td>Source (From)</td>
					<td><!-- <input type="text" name="from"
						placeholder="Enter Source Name" maxlength="100"> -->
						<select name="from" id="from" onchange="updateTo()">
							<option value="default">---</option>
							<option value="ahmedabad">Ahmedabad</option>
							<option value="delhi">Delhi</option>
							<option value="mumbai">Mumbai</option>
							<option value="chennai">Chennai</option>
							<option value="kerela">Kerela</option>
						</select>
						
						</td>
				</tr>
				<tr>
					<td>Destination (To)</td>
					<td><!-- <input type="text" name="to"
						placeholder="Enter Destination Name" maxlength="100"> -->
						<select name="to" id="to">
						<option value="default">---</option>
							
							<option value="ahmedabad">Ahmedabad</option>
							<option value="delhi">Delhi</option>
							<option value="mumbai">Mumbai</option>
							<option value="chennai">Chennai</option>
							<option value="kerela">Kerela</option>
						</select>
						
						</td>
				</tr>
				<tr>
					<td>Quantity(Units Should be <= 500)</td>
					<td><input type="range" name="quantity" min="0" max="500" onchange="updateTextInput(this.value);"
						step="1">
						<input type="text" id="quantitynumber" value="">
						</td>
				</tr>
				<tr>
					<td><input class="btn1" type="submit" value="Book"></td>
					<td><input class="btn1" type="reset" value="Clear"></td>
				</tr>
			</table>
		</center>
		<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>