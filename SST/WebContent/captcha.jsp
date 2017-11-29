<%@page import="java.io.*"%>
<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.awt.*"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<%
int width=155;
int height=50;
BufferedImage buf = new BufferedImage(width,height,BufferedImage.TYPE_INT_RGB);
Graphics2D g = buf.createGraphics();
GradientPaint gp = new GradientPaint(0,0,Color.GREEN,0,height/2,Color.BLUE,true);
g.setPaint(gp);
Font f = new Font("TIMES NEW ROMAN",Font.BOLD,22);
g.setFont(f);
g.fillRect(0, 0, width, height);
Color c = new Color(0,152,255);
g.setColor(c);

String data = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0987654321";
String captcha = "";
String captcha1="";
char ch[] = data.toCharArray();
for(int i=0;i<6;i++)
{
	int j = (int)((Math.random())*62);
	captcha =  captcha + " " + ch[j];
	captcha1=captcha1+ch[j];
}
session.setAttribute("captcha",captcha1);
response.setContentType("image/png");
g.drawString(captcha, 10, 35);
g.dispose();
OutputStream os =response.getOutputStream();
ImageIO.write(buf,"png",os);
os.close();
%>
<body>
</body>
</html>