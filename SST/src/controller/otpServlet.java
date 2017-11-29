package controller;

import java.io.IOException;

import javax.mail.MessagingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mail.PasswordMail;

/**
 * Servlet implementation class otpServlet
 */
public class otpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public otpServlet() {
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
		String otp=request.getParameter("otp");
		HttpSession session=request.getSession();
		String otp1=(String)session.getAttribute("otp");
		String emailid=(String)session.getAttribute("email");
		String password=(String)session.getAttribute("pass");
		String link="http://localhost:8085/MVC/resetpassword.jsp";
		String page="";
		if(otp.equals(otp1))
		{
			PasswordMail pm=new PasswordMail();
			try {
				boolean status=pm.sendMail1(emailid,password,link);
				if(status)
				{
					page="resetPassword.jsp";
				}
			} catch (MessagingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		response.sendRedirect(page);
	}

}
