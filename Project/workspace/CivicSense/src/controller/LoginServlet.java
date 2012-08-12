package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

//import java.io.PrintWriter;

import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entity.Administrator;
import entity.Authority;
import entity.Citizen;
import entity.Group;
import entity.Memo;
import entity.Ngo;
import entity.Suggestion;

import session.AuthenticateUser;
import session.GroupInterface;
import session.LocationGet;
import session.MemoInterface;
import session.SuggestionInterface;

/**
 * Servlet implementation class LoginServlet
 * @author 4MB
 * @version 1.0
 */
@WebServlet("/Login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	@EJB
	private AuthenticateUser stub;
	@EJB
	private GroupInterface stub1;
	@EJB
	private LocationGet stub3;
	@EJB
	private SuggestionInterface stub4;
	@EJB
	private MemoInterface stub5;
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    private static int count=0;
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
		PrintWriter out=response.getWriter();
		response.setHeader("Cache-Control", "no-cache");
		try{
		Object obj=null;
		String user=request.getParameter("radio");
		String uname=request.getParameter("username");
		String pwd=request.getParameter("password");
			if(user.equals("citizen"))
			{
				obj=stub.authenticate(uname,pwd,"citizen");
				if(obj!=null)
				{
					HttpSession session=request.getSession();
					Citizen user1=(Citizen)obj;
					session.setAttribute("user",user1);
					session.setAttribute("location",user1.getLocation() );
					List<Group> groups=stub1.getGroups(user1.getLocation());
					if(groups!=null && !groups.isEmpty())
					{
						session.setAttribute("groups1","groups");
					session.setAttribute("groups", groups);
					}
					else
						session.setAttribute("groups1","no groups");
					List<Suggestion> suggestions=stub3.getSuggestions(user1.getLocation());
					if(suggestions!=null  && !suggestions.isEmpty())
					{
						session.setAttribute("suggestions1","suggestions");
					session.setAttribute("suggestions", suggestions);
					}
					else
						session.setAttribute("suggestions1","no suggestions");
				RequestDispatcher view=request.getRequestDispatcher("citizenHome.jsp");
				view.forward(request,response);
				count=0;
				}
				
			}
			else if(user.equals("authority"))
			{
				obj=stub.authenticate(uname,pwd,"authority");
				if(obj!=null)
				{	
					HttpSession session=request.getSession();
					Authority user1=(Authority)obj;
				session.setAttribute("user",user1);
				//request.setAttribute("location",user1.getLocation() );
				//request.setAttribute("user",(Authority)obj);
				List<Suggestion> suggestions=(List<Suggestion>)stub4.getSuggestions(user1);
				if(suggestions!=null  && !suggestions.isEmpty())
				{
					session.setAttribute("suggestions1","suggestions");
				session.setAttribute("suggestions", suggestions);
				}
				else
					session.setAttribute("suggestions1","no suggestions");	
				List<Memo> memos=(List<Memo>)stub5.getMemos(user1);
				if(memos!=null)
				{
					session.setAttribute("memos1","memos");
				session.setAttribute("memos",memos);
				}
				else
					session.setAttribute("memos1","no memos");	
				RequestDispatcher view=request.getRequestDispatcher("authorityHome.jsp");
				view.forward(request,response);count=0;
				}
			}
			else if(user.equals("admin"))
			{
				obj=stub.authenticate(uname,pwd,"admin");
				if(obj!=null)
				{	
					HttpSession session=request.getSession();
					Administrator user1=(Administrator)obj;
					session.setAttribute("user",user1);
					RequestDispatcher view=request.getRequestDispatcher("adminHome.jsp");
				view.forward(request,response);count=0;
				}
			}
			else
			{
				obj=stub.authenticate(uname,pwd,"ngo");
				if(obj!=null)
				{
					HttpSession session=request.getSession();
					Ngo user1=(Ngo)obj;
					session.setAttribute("user",user1);
					session.setAttribute("location",user1.getLocation() );
					List<Group> groups=stub1.getGroups(user1.getLocation());
					if(groups!=null && !groups.isEmpty())
					{
						session.setAttribute("groups1","groups");
					session.setAttribute("groups", groups);
					}
						else
							session.setAttribute("groups1", "no groups");
				RequestDispatcher view=request.getRequestDispatcher("ngoHome.jsp");
				view.forward(request,response);count=0;
				}
			}
			if(obj==null)
			{	count++;
				request.setAttribute("count",count);
				RequestDispatcher view=request.getRequestDispatcher("index.jsp");
				view.forward(request, response);
			}
		}
		catch(Exception ex){
			out.println("<html><head><title>Sorry First Hit !</title></head><body style='color:#75A3FF;'><h1>Please hit f5 or refresh !<h1><br/><br/><h2>Sorry for the inconvinience !(First database hit)</h2></body></html>");
		}
	}
			
	}

