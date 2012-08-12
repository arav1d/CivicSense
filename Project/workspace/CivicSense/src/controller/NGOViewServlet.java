package controller;

import java.io.IOException;

import session.GroupInterface;
import java.util.ArrayList;
import java.util.List;

import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entity.Group;
import entity.Groupcontent;
import entity.Location;
import entity.Ngo;


/**
 * Servlet implementation class NGOViewServlet
 * @author 4MB
 * @version 1.0
 */
@WebServlet("/NGOView")
public class NGOViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NGOViewServlet() {
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
		request.setAttribute("signupmsg", null);
		HttpSession session=request.getSession(false);
		if(session!=null)
		{
			int gId=Integer.parseInt(request.getParameter("value"));
			Group group=stub.getGroup(gId);
			List<Groupcontent> contents=stub.getContents(group);
			if(contents!=null)
			{
			List<String> contentVal=new ArrayList<String>();
			for(int i=0;i<contents.size();i++)
			{ 
				contentVal.add(contents.get(i).getContent()+"&"+contents.get(i).getCitizen().getFname());
			}
			
			request.setAttribute("contents",contentVal);
			}
			request.setAttribute("group", group);
			request.setAttribute("no post","zero posts");
			RequestDispatcher view=request.getRequestDispatcher("groupNgo.jsp");
			view.forward(request, response);
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
		HttpSession session=request.getSession(false);
		if(session!=null)
		{
		Ngo user=(Ngo)session.getAttribute("user");
		Location location=(Location)session.getAttribute("location");
		String groupName=request.getParameter("name");
		String desc=request.getParameter("desc");
		Group group=new Group();
		group.setDesc(desc);
		group.setNgo(user);
		group.setName(groupName);
		group.setLocation(location);
		stub.createGroup(group);
		request.setAttribute("group", group);
		RequestDispatcher view=request.getRequestDispatcher("groupNgo.jsp");
		view.forward(request, response);
		}
		else
			request.setAttribute("error","Please login to access the website!");
			RequestDispatcher view=request.getRequestDispatcher("index.jsp");
			view.forward(request,response);
	}

}
