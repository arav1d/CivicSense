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

import session.LocationGet;
import session.SuggestionInterface;

import entity.Citizen;
import entity.Suggestion;
import entity.Suggestionsupport;

/**
 * Servlet implementation class SuggestionHandle1Servlet
 * @author 4MB
 * @version 1.0
 */
@WebServlet("/SuggestionHandle1")
public class SuggestionHandle1Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SuggestionHandle1Servlet() {
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
    @EJB
    private LocationGet stub;
    @EJB
    private SuggestionInterface stub1;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session=request.getSession(false);
		if(session!=null)
		{
			int suggestId=Integer.parseInt(request.getParameter("value"));
			Suggestion suggestion=stub.getSuggestion(suggestId);
			Citizen user=(Citizen)session.getAttribute("user");
			if(suggestion!=null)
			{
			request.setAttribute("suggestion",suggestion);
			Suggestionsupport obj=stub1.getSuggestionSupport(suggestion,user);
			if(obj==null)
			request.setAttribute("support","enable");
			else
			request.setAttribute("support","disable");
			RequestDispatcher view=request.getRequestDispatcher("suggestion.jsp");
			view.forward(request, response);
			}
			else
			request.setAttribute("no post","zero posts");
			
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
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
