package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Dao;
import model.Model;

/**
 * Servlet implementation class updateServlet
 */
public class updateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public updateServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String fn = request.getParameter("fname");
		String ln = request.getParameter("lname");
		String con = request.getParameter("con");
		String add = request.getParameter("add");
		String email = request.getParameter("emailid");
		String dob = request.getParameter("dob");
		String page = "";
		String sql = "update register set firstname = '" + fn + "',lastname = '" + ln + "',contact = '" + con
				+ "',address='" + add + "',dateofbirth='" + dob + "' where emailid='" + email + "'";
		Model m = new Model();
		m.setFn(fn);
		m.setLn(ln);
		m.setCon(con);
		m.setAdd(add);
		m.setDob(dob);
		try {

			int j = Dao.register(m, sql);
			if (j != 0) {
				page = "login.jsp?msg=usuccess";
			} else {
				page = "error.jsp?msg=ufailed";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		response.sendRedirect(page);
	}
}
