package controller;

import java.io.IOException;
import java.util.Date;

import javax.ejb.EJB;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entity.Authority;
import entity.Citizen;
import entity.Location;
import entity.Suggestion;
import session.SuggestionInterface;

/**
 * Servlet implementation class SuggestionHandleServlet
 * @author 4MB
 * @version 1.0
 */
@WebServlet("/Suggestion")
public class SuggestionHandleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	  @EJB
	   private SuggestionInterface stub;
	  @EJB
	  private session.Authority stub1;
    public SuggestionHandleServlet() {
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
		HttpSession session=request.getSession(false);
		if(session!=null)
		{
		RequestDispatcher view=request.getRequestDispatcher("suggestionForm.jsp");
		view.forward(request,response);
		}
		else
		{
			request.setAttribute("error","Please login to access the website!");
			RequestDispatcher view=request.getRequestDispatcher("index.jsp");
			view.forward(request,response);
		}
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
		
		HttpSession session=request.getSession(false);
		if(session!=null)
		{
		String desc=request.getParameter("desc");
		//String street=request.getParameter("splloc");
		Location loc=(Location)session.getAttribute("location");
		String zone=loc.getZone();
		String ward=loc.getWard();
		String dept=request.getParameter("dept");
		Authority authority=stub1.getAuthority(zone,ward,dept);//get by dept
		Citizen citizen=(Citizen)session.getAttribute("user");
		Location location=(Location)session.getAttribute("location");
		Suggestion suggestion=new Suggestion();
		suggestion.setAuthority(authority);
		suggestion.setCitizen(citizen);
		suggestion.setDesc(desc);
		suggestion.setLocation(location);
		suggestion.setDate(new Date());
		//suggestion.setStreet(street);
		stub.postSuggestion(suggestion);
		request.setAttribute("sugmsg", "Suggestion posted<br/> <strong>successfully!</strong><br/>You can view it<br/>in your next login.");
		RequestDispatcher view=request.getRequestDispatcher("citizenHome.jsp");
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
