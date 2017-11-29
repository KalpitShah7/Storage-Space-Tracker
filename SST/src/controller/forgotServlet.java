package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.sql.*;
import dao.Dao;
import mail.PasswordMail;
import model.Model;

/**
 * Servlet implementation class forgotServlet
 */
public class forgotServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public forgotServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String emailid=request.getParameter("emailid");
		String page="";
		String sql="select * from register where emailid='"+emailid+"'";
		if(emailid.equals(""))
		{
			page="error.jsp?msg=abc";
		}
		else
		{
			Model m=new Model();
			m.setEmail(emailid);
			try
			{
		ResultSet rs=Dao.validate(m,sql);
			if(rs.next())
			{
				String password=rs.getString(10);
				HttpSession session=request.getSession();
				session.setAttribute("email", emailid);
				session.setAttribute("pass", password);
		String data="12345678901234567890123456789012345678901234567890";
		String otp="";
		char ch[]=data.toCharArray();
		for(int i=0;i<4;i++)
		{
			int j=(int)((Math.random())*50);
			otp=otp+ch[j];
		}
		session.setAttribute("otp", otp);
		PasswordMail pm=new PasswordMail();
		boolean status=pm.sendMail(emailid, otp);
		if(status)
		{
			page="otp.jsp?msg=send";
			
		}
		
			}
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
		
		}
		response.sendRedirect(page);
	}

}
