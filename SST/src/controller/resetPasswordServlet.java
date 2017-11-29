package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Dao;
import model.Model;

/**
 * Servlet implementation class resetPasswordServlet
 */
public class resetPasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public resetPasswordServlet() {
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
		String np=request.getParameter("npass");
		String cp=request.getParameter("cpass");
		HttpSession session=request.getSession();
		String email=(String) session.getAttribute("email");
		String sql="update register set password='"+np+"' where emailid='"+email+"'";
		String page="";
		if(np.equals(cp))
		{
			Model m = new Model();
			m.setPass(np);
			try {
				System.out.println("Dao Part");
				int j=Dao.register(m,sql);
				if(j!=0)
				{
					page="login.jsp?msg=pc";
				}
				else
				{
					page="error.jsp?msg=fail";
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		response.sendRedirect(page);
	}

}
