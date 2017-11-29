package controller;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Dao;
import model.Model;

/**
 * Servlet implementation class loginServlet
 */
public class loginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public loginServlet() {
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
		String emailid = request.getParameter("emailid");
		String pass = request.getParameter("pass");
		String type= request.getParameter("type");

		
		String page = "";

		if (emailid.equals("") || pass.equals("")) {
			page = "error.jsp?msg=abc";// URL rewriting
			// response.sendRedirect("error.jsp");
			// page="error.jsp?msg=abc &msg1=qwe &msg2=asd";
		} else if(type.equals("C"))
		{
			Model m = new Model();
			m.setEmailid(emailid);
			m.setPass(pass);
			m.setType(type);
			
			String sql = "select * from register where emailid='" + emailid + "' and password='" + pass + "' and type1='"+type+"'";
			try {
				ResultSet rs = Dao.validate(m, sql);
				if (rs.next()) {
					HttpSession session = request.getSession();
					session.setAttribute("emailid", emailid);
					session.setAttribute("password", pass);
					session.setAttribute("type", type);
					page = "profile.jsp?msg=success";
				}
				else
				{
					page="login.jsp?msg=try";
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		else
		{
			Model m = new Model();
			m.setEmailid(emailid);
			m.setPass(pass);
			m.setType(type);

			String sql = "select * from register where emailid='" + emailid + "' and password='" + pass + "' and type1='"+type+"' and status='activated'";
			try {
				ResultSet rs = Dao.validate(m, sql);
				if (rs.next()) {
					HttpSession session = request.getSession();
					session.setAttribute("emailid", emailid);
					session.setAttribute("password", pass);
					session.setAttribute("type", type);
					page = "profile.jsp?msg=success";
				}
				else{
					page="login.jsp?msg=try";	
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		response.sendRedirect(page);
	}

}
