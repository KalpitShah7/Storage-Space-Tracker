package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Dao;
import model.Model;

/**
 * Servlet implementation class addWMServlet
 */
public class addWMServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addWMServlet() {
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
		String con=request.getParameter("con");
		String page="";
		String sql="insert into register(contact,emailid,type1)values('"+con+"','"+emailid+"','WM')";
		Model m = new Model();
		m.setEmailid(emailid);
		m.setCon(con);
		try {
			int i=Dao.register(m, sql);
			if(i!=0)
			{
				page="addWarehouseManager.jsp?msg=success";
			}
			else
			{
				page="addWarehouseManager.jsp?msg=failed";
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		response.sendRedirect(page);
	}

}
