package controller;

import java.io.IOException;
import java.sql.ResultSet;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Dao;
import model.Model;

/**
 * Servlet implementation class enterWHServlet
 */
public class enterWHServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static HashMap<String,HashMap<String,Integer>> distance = new HashMap<String,HashMap<String,Integer>>();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public enterWHServlet() {
        super();
        HashMap<String,Integer> a= new HashMap<String,Integer>();
        a.put("delhi",900);
        a.put("mumbai",600);
        a.put("chennai",1600);
        a.put("kerela",2200);
        
        HashMap<String,Integer> d= new HashMap<String,Integer>();
        d.put("ahmedabad",900);
        d.put("mumbai",1500);
        d.put("chennai",2500);
        d.put("kerela",3100);
        
        HashMap<String,Integer> m= new HashMap<String,Integer>();
        m.put("delhi",1500);
        m.put("ahmedabad",600);
        m.put("chennai",1000);
        m.put("kerela",1600);
        
        HashMap<String,Integer> c= new HashMap<String,Integer>();
        c.put("delhi",2500);
        c.put("mumbai",1000);
        c.put("ahmedabad",1600);
        c.put("kerela",800);
        
        HashMap<String,Integer> k= new HashMap<String,Integer>();
        k.put("delhi",3100);
        k.put("mumbai",1600);
        k.put("chennai",800);
        k.put("ahmedabad",2200);
        
        distance.put("ahmedabad",a );
        distance.put("delhi",d);
        distance.put("mumbai",m);
        distance.put("chennai",c);
        distance.put("kerela",k);
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
		HttpSession session = request.getSession();
		String emailid = (String) session.getAttribute("emailid");
		
		String iname = request.getParameter("iname");
		String from = request.getParameter("from");
		String to = request.getParameter("to");
		String quantity = request.getParameter("quantity");
		int quantity1 = Integer.parseInt(request.getParameter("quantity"));
		String checkspace="select quantityleft from capacity where emailid='"+emailid+"'";
		int dist = (int)distance.get(from).get(to); 
		int charges = dist*quantity1*2;
		System.out.println(dist);
		System.out.println(charges);	
		String page="";
		
				
		String sql="insert into placeorder(emailid,itemname,quantity,source1,destination,status,charges) values('"+emailid+"','"+iname+"','"+quantity+"','"+from+"','"+to+"','booked','"+ charges +"')";
		
		Model m = new Model();
		m.setIname(iname);
		m.setFrom(from);
		m.setTo(to);
		m.setQuantity(quantity);
		try {
			ResultSet rs=Dao.validate(m, checkspace);
			if(rs.next())
			{
				String q=rs.getString(1);
				int qua=Integer.parseInt(q);
				int userqut=Integer.parseInt(quantity);
				int ans=qua-userqut;
				if(0<=ans && ans<=qua)
				{
					int j = Dao.register(m, sql);
					if (j != 0) {
						String updatespace="update capacity set quantityleft='"+ans+"' where emailid='"+emailid+"'";
						Dao.register(m, updatespace);
						page = "enterWarehouse.jsp?msg=success";
					} 
					else
					{
						page = "enterWarehouse.jsp?msg=failed";
					}
				}
				else
				{
					page="error.jsp?msg=nospace";
				}
				
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("charges",charges);
		request.getRequestDispatcher(page).forward(request, response);
		
	}

}
