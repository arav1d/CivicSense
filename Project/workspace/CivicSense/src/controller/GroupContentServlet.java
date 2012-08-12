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

import session.GroupInterface;

import entity.Citizen;
import entity.Groupcontent;

/**
 * Servlet implementation class GroupContentServlet
 * @author 4MB
 * @version 1.0
 */
@WebServlet("/GroupContent")
public class GroupContentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GroupContentServlet() {
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
	private GroupInterface stub;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session=request.getSession(false);
		if(session!=null)
		{
	
		String content=request.getParameter("content");
		int groupId=Integer.parseInt(request.getParameter("id"));
		Citizen user=(Citizen)session.getAttribute("user");
		Groupcontent gContent=new Groupcontent();
		gContent.setContent(content);
		gContent.setCitizen(user);
		gContent.setGroup(stub.getGroup(groupId));
		gContent.setDate(new Date());
		stub.postContent(gContent);
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
	
	}

}
