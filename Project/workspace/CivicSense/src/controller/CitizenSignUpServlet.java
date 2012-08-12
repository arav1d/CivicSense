package controller;

import java.io.IOException;
import java.io.PrintWriter;
//import java.io.PrintWriter;


import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import session.LocationGet;
import session.StoreUser;

import entity.Citizen;
import entity.Location;
import entity.Verification;

/**
 * Servlet implementation class SignUpServlet
 * @author 4MB
 * @version 1.0
 */
@WebServlet("/CitizenSignUp")
public class CitizenSignUpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	@EJB
	private LocationGet stub;
	@EJB
	private StoreUser stub1;
    public CitizenSignUpServlet() {
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
		//PrintWriter out=response.getWriter();
		PrintWriter out = response.getWriter();
		try{
		String username=request.getParameter("username");
		int age=Integer.parseInt(request.getParameter("age"));
		String doorNo=request.getParameter("doorno");
		String email=request.getParameter("email");
		String fname=request.getParameter("fname").trim();
		String lname=request.getParameter("lname");
		String password=request.getParameter("password");
		String sex=request.getParameter("radio");
		String street=request.getParameter("street");
		String zone=request.getParameter("zone");
		String ward=request.getParameter("ward");
		String verifyId=request.getParameter("verifyId");
		long phone=Long.parseLong(request.getParameter("phone"));
		Location location=stub.getLocation(ward,zone);
		Verification verification=stub.getVerification(verifyId,location,fname);
		if(verification!=null)
		{
		Citizen user=new Citizen();
		
		user.setAge(age);
		user.setDoor(doorNo);
		user.setEmail(email);
		user.setFname(fname);
		user.setLname(lname);
		user.setLocation(location);
		user.setVerification(verification);
		user.setPassword(password);
		user.setSex(sex);
		user.setUsername(username);
		user.setStreet(street);
		user.setPhone(phone);
		stub1.insertCitizen(user);
		request.setAttribute("error",null);
		request.setAttribute("signupmsg", "Account creation<br/> <strong>successful<strong>! Login now!");
				RequestDispatcher view=request.getRequestDispatcher("index.jsp");
				view.forward(request,response);
			
		}
			
		
	}
	catch(Exception ex){
			out.println("<html><head><title>Sorry First Hit !</title></head><body style='color:#75A3FF;'><h1>Please hit f5 or refresh !<h1><br/><br/><h2>Sorry for the inconvinience !(First database hit)</h2></body></html>");
	}
}

}
