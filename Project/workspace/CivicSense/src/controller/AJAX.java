package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

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
import entity.Complaintdetail;


import session.CitizenInterface;

import session.Complaint;
import session.NgoInterface;
import session.SuggestionInterface;

/**
 * Servlet implementation class AJAX
 * @author 4MB
 * @version 1.0
 */
@WebServlet("/AJAX")
public class AJAX extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * Constructor for AJAX
     * @see HttpServlet#HttpServlet()
     */

    public AJAX() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    @EJB
    private CitizenInterface stub1;
    @EJB
    private NgoInterface stub2;
    @EJB
    private session.Authority stub3;
    @EJB
    private SuggestionInterface stub;
    @EJB
    private Complaint stub4;
    /**
     * @param request
	 * @param response
	 * @throws IOException
	 * @throws ServletException
     */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter  out=response.getWriter();
		HttpSession session=request.getSession(false);
		if(session!=null)
		{
			Citizen user=(Citizen)session.getAttribute("user");
		String type=request.getParameter("type");
		if(type.equals("signup"))
		{
		String fname=request.getParameter("fname");
		String uname=request.getParameter("uname");
		String zone=request.getParameter("zone");
		String ward=request.getParameter("ward");
		String vid=request.getParameter("vid");
		boolean isExist=stub1.isPresent(uname);
		if(isExist)
			out.print("-1");
		else
		{
			boolean isTrue=stub1.isValid(vid,fname,zone,ward);
			if(isTrue)
				out.print("1");
			else
				out.print("0");
		}
		}
		else if(type.equals("ngosignup"))
		{
			String name=request.getParameter("name");
			String uname=request.getParameter("uname");
			String zone=request.getParameter("zone");
			String ward=request.getParameter("ward");
			String vid=request.getParameter("vid");
			boolean isExist=stub2.isPresent(uname);
			if(isExist)
				out.print("-1");
			else
			{
				boolean isTrue=stub2.isValid(vid,name,zone,ward);
				if(isTrue)
					out.print("1");
				else
					out.print("0");
			}
		}
		else if(type.equals("suggsupp"))
		{
			int suggid=Integer.parseInt(request.getParameter("suggid"));
			int support=stub.incrementSupport(suggid,user.getUserId());
			if(support!=0)
			out.print(support);
			else
				out.print("");
		}
		else if(type.equals("authcreation"))
		{
			String uname=request.getParameter("uname");
			String zone=request.getParameter("zone");
			String ward=request.getParameter("ward");
			String dept=request.getParameter("dept");
			Authority authority=stub3.getAuthority(zone, ward, dept);
			if(authority==null)
			{
				boolean isExist=stub3.isPresent(uname);
				if(isExist)
					out.print("0");
				else
					out.print("1");
			}
			else
				out.print("-1");
			
		}
		else if(type.equals("search"))
		{
			String searchKey=request.getParameter("searchbox");
			List<Complaintdetail> complaints=stub4.getSearchComplaints(searchKey);
			String searchRes="";
			if(complaints!=null)
			for(Complaintdetail complaint:complaints)
			{
				searchRes+="<li onclick=\""+"fill('"+complaint.getComplaintDesc()+"');\">"+complaint.getComplaintDesc()+"</li>";
			}
			out.print(searchRes);
		}
	
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
