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

import entity.Suggestion;

import session.SuggestionInterface;

/**
 * Servlet implementation class SuggestionHandle2Servlet
 * @author 4MB
 * @version 1.0
 */
@WebServlet("/SuggestionHandle2")
public class SuggestionHandle2Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SuggestionHandle2Servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 * @param request
	 * @param response
	 * @throws IOException
	 * @throws ServletException
	 */@EJB
	 private SuggestionInterface stub;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession(false);
		if(session!=null)
		{
		int suggestId=Integer.parseInt(request.getParameter("value"));
		Suggestion suggestion=stub.getSuggestion(suggestId);
		if(suggestion!=null)
		request.setAttribute("suggestion",suggestion);
		else
		request.setAttribute("no post","zero posts");
		RequestDispatcher view=request.getRequestDispatcher("suggestionAuthority.jsp");
		view.forward(request,response);
		}
		else{
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
	}

}
