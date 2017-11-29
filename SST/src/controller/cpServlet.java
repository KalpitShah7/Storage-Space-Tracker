package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Dao;
import model.Model;

/**
 * Servlet implementation class cpServlet
 */
public class cpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public cpServlet() {
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
		String opass = request.getParameter("opass");// old password
		String npass = request.getParameter("npass");// new password
		String cpass = request.getParameter("cpass");// confirm password
		String page = "";
		HttpSession session = request.getSession();
		String emailid = (String) session.getAttribute("emailid");
		String oldpass = (String) session.getAttribute("password");
		String sql = "update register set password='" + npass + "' where emailid='" + emailid + "'";
		if (opass.equals(oldpass)) {
			if (!npass.equals(oldpass)) {
				if (!npass.contains(oldpass)) {
					if (npass.equals(cpass)) {
						Model m = new Model();
						m.setEmailid(emailid);
						m.setPass(npass);
						try {

							int i = Dao.register(m, sql);
							if (i != 0) {
								page = "login.jsp?msg=successs";
							} else {
								page = "error.jsp?msg=notchanged";
							}
						} catch (Exception e) {
							e.printStackTrace();
						}
					} else {
						page = "error.jsp?msg=unmatch";
					}
				} else {
					page = "error.jsp?msg=contains";
				}
			} else {
				page = "error.jsp?msg=sameold";
			}
		} else {
			page = "error.jsp?msg=olddontmatch";
		}
		response.sendRedirect(page);
	}

}
