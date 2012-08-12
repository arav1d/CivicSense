package controller;

import java.io.IOException;
import java.io.PrintWriter;


import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entity.Location;
import entity.Ngo;
import entity.Verification;


import session.LocationGet;
import session.StoreUser;

/**
 * Servlet implementation class NgoSignUpServlet
 * @author 4MB
 * @version 1.0
 */
@WebServlet("/NgoSignUp")
public class NgoSignUpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	@EJB
	private LocationGet stub;
	@EJB
	private StoreUser stub1;
    public NgoSignUpServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 * @param request
	 * @param response
	 * @throws IOException
	 * @throws ServletException
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 * @param request
	 * @param response
	 * @throws IOException
	 * @throws ServletException
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		try{
		String email=request.getParameter("email");
		String motto=request.getParameter("motto");
		String offAddr=request.getParameter("offaddr");
		String password=request.getParameter("password");
		long phNo=Long.parseLong(request.getParameter("phone"));
		String username=request.getParameter("username");
		String zone=request.getParameter("zone");
		String ward=request.getParameter("ward");
		String verifyId=request.getParameter("verifyId");
		String name=request.getParameter("name");
		String desc=request.getParameter("desc");
		Location location=stub.getLocation(ward, zone);
		Verification verification=stub.getVerification(verifyId, location,name);
		if(verification!=null)
		{
		Ngo ngo=new Ngo();
		ngo.setEmail(email);
		ngo.setLocation(verification.getLocation());
		ngo.setMotto(motto);
		ngo.setOffAddr(offAddr);
		ngo.setPassword(password);
		ngo.setPhNo(phNo);
		ngo.setUsername(username);
		ngo.setVerification(verification);
		ngo.setDesc(desc);
		ngo.setName(name);
		boolean truth=stub1.insertNgo(ngo);
		if(truth)
		{
			request.setAttribute("signupmsg", "Account creation<br/> <strong>successful<strong>! Login now!");
			RequestDispatcher view=request.getRequestDispatcher("index.jsp");
			view.forward(request,response);
		}
		}
		else
		{
			request.setAttribute("signupmsg", "Account creation<br/> <strong>failure<strong>! Signup again.");
			RequestDispatcher view=request.getRequestDispatcher("index.jsp");
			request.setAttribute("error",null);
			view.forward(request,response);
		}
	}
	catch(Exception ex){
		out.println("<html><head><title>Sorry First Hit !</title></head><body style='color:#75A3FF;'><h1>Please hit f5 or refresh !<h1><br/><br/><h2>Sorry for the inconvinience !(First database hit)</h2></body></html>");
	}
	}

}
