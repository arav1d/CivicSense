package controller;

import java.io.IOException;

import javax.ejb.EJB;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



import entity.Authority;


/**
 * Servlet implementation class AuthorityAccountServlet
 * @author 4MB
 * @version 1.0
 */
@WebServlet("/AuthorityAccount")
public class AuthorityAccountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	@EJB
	private session.Authority stub;
    public AuthorityAccountServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**Complaint detail
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 * @param request
	 * @param response
	 * @throws IOException
	 * @throws ServletException
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stuComplaintdetailb
	}

	/**
	 * The servlet method is responsible for creation of authority account.
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 * @param request
	 * @param response
	 * @throws IOException
	 * @throws ServletException
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session=request.getSession(false);
		if(session!=null)
		{
		int credits=0;
		String dept=request.getParameter("dept");
		String email=request.getParameter("email");
		String fname=request.getParameter("fname");
		String lname=request.getParameter("lname");
		String offAddr=request.getParameter("offAddr");
		String password=request.getParameter("password");
		long phNo=Long.parseLong(request.getParameter("phNo"));
		String sex=request.getParameter("radio");
		String username=request.getParameter("username");
		String ward=request.getParameter("ward");
		String zone=request.getParameter("zone");
		Authority authority=new Authority();
		authority.setCredits(credits);
		authority.setDept(dept);
		authority.setEmail(email);
		authority.setFname(fname);
		authority.setLname(lname);
		authority.setOffAddr(offAddr);
		authority.setPassword(password);
		authority.setPhNo(phNo);
		authority.setSex(sex);
		authority.setUsername(username);
		authority.setWard(ward);
		authority.setZone(zone);
		stub.createAuthority(authority);
		request.setAttribute("auacc", "Account has been<br/> <strong>successfully!</strong>created<br/>.");
		RequestDispatcher view=request.getRequestDispatcher("adminHome.jsp");
		view.forward(request,response);
		}
		else
		{
			request.setAttribute("error","Please login to access the website!");
			RequestDispatcher view=request.getRequestDispatcher("index.jsp");
			view.forward(request,response);
		}
	}
		

}
