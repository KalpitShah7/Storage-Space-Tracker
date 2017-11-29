package controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Dao;
import model.Model;

/**
 * Servlet implementation class contactServlet
 */
public class contactServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public contactServlet() {
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
		String from = request.getParameter("emailid");
		String subject = request.getParameter("sub");
		String message = request.getParameter("msg");
		String page = " ";
		Date d = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
		String s = sdf.format(d);
		if (from.equals("") || subject.equals("") || message.equals("")) {
			page = "error.jsp?msg=abc";
		} else {

			Model m = new Model();
			m.setEmail(from);
			m.setSubject(subject);
			m.setMessage(message);
			try {
				int i = Dao.register(m, "insert into feedback values('" + from + "','kalpits21@gmail.com','" + subject
						+ "','" + message + "','" + s + "')");
				if (i != 0) {
					page = "contact.jsp?msg=success";
				} else {
					page = "contact.jsp?msg=failed";
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			response.sendRedirect(page);
		}
	}

}
