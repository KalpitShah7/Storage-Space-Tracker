package controller;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Dao;
import model.Model;

/**
 * Servlet implementation class registerServlet
 */
public class registerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public registerServlet() {
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
		String gen = request.getParameter("gen");
		String country = request.getParameter("country");
		String state = request.getParameter("state");
		String emailid = request.getParameter("emailid");
		String pass = request.getParameter("pass");
		String cpass = request.getParameter("cpass");
		String dob = request.getParameter("dob");
		String captcha = request.getParameter("captcha");
		String s = dob.substring(0, 4);// differnce find characters
		String type = request.getParameter("type");
		Date d = new Date();
		String s1 = d.toString();
		String s2 = s1.substring(24);

		int a = Integer.parseInt(s);// user entered
		int b = Integer.parseInt(s2);// system entered

		HttpSession session = request.getSession();
		String captcha1 = (String) session.getAttribute("captcha");
		String sql1="insert into capacity values('"+emailid+"','500')";
		String sql = "insert into register(firstname,lastname,contact,address,gender,type1,country,state,emailid,password,dateofbirth,status) values('" + fn + "','" + ln + "','" + con + "','" + add + "','" + gen + "','"
				+ type + "','" + country + "','" + state + "','" + emailid + "','" + pass + "','" + dob + "','')";
		String page = "";
		

		if (a > 1950 && (b - a) >= 18) {
			if (captcha.equals(captcha1)) {
				if (pass.equals(cpass)) {
					Model m = new Model();
					m.setFn(fn);
					m.setLn(ln);
					m.setCon(con);
					m.setAdd(add);
					m.setGen(gen);
					m.setType(type);
					m.setEmailid(emailid);
					m.setPass(pass);
					m.setCountry(country);
					m.setState(state);
					m.setDob(dob);
					try {

						int j = Dao.register(m, sql);
						if (j != 0) {
							
							page="login.jsp?msg=redirect";
							if(type.equals("C"))
							{
								int i = Dao.register(m, sql1);
								if(i!=0)
								{
									page = "login.jsp?msg=success";
								}
							}
							
						} else {
							page = "error.jsp?msg=failed";
						}
					} catch (Exception e) {
						e.printStackTrace();
					}
				} else {
					page = "error.jsp?msg=check";
				}
			} else {
				page = "error.jsp?msg=captcha";
			}
		} else {
			page = "error.jsp?msg=date";
		}
		response.sendRedirect(page);
	}

}
