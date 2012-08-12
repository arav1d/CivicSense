package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import session.Complaint;
import session.SuggestionInterface;

import entity.Citizen;
import entity.Complaintdetail;
import entity.Complaintsupport;
import entity.Location;




/**
 * Servlet implementation class CitizenViewServlet
 * @author 4MB
 * @version 1.0
 */
@WebServlet("/CitizenView")
public class CitizenViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */

    public CitizenViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    @EJB
    private Complaint stub;
    @EJB
    private SuggestionInterface stub1;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auenerated method stub
		//System.out.println("entered");
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		request.setAttribute("signupmsg", null);
		HttpSession session=request.getSession(false);
		if(session!=null)
		{
		String dept;
		int id;
		String text,nav;StringBuilder returnString = new StringBuilder();
		Complaintdetail complaint;
		Citizen userId=(Citizen)session.getAttribute("user");
		Location loc=(Location)session.getAttribute("location");
		Integer index=Integer.parseInt(request.getParameter("number"));
		text = request.getParameter("type");
		nav = request.getParameter("nav");
		List<Complaintdetail> complaints=stub.getComplaint(loc.getLocationId());
		List<Complaintdetail> complaints1=stub.getComplaint(userId);
		
		if(complaints!=null )
		{
		
		if(nav != null && nav.equals("prev"))
		{
			if(index>=complaints.size())
			{
				out.print("0");
			}
			else
			{
		for(int i=index;i<index+8 && i<complaints.size();i++)
		{	
			complaint=complaints.get(i);
			if(complaint!=null)
			{
			dept=complaint.getDept();
			if(dept.contains("Solid"))
				dept=dept.substring(0,11);
			id=complaint.getComplaintId();
			Date cal = (Date)complaint.getDate();
			String date=cal.toString().substring(0, 11);
			returnString.append("<li class='ui-state-default' id='"+id+"'>" +
					dept+"<br/>"+date+"<br/><br/>"+
					"<span style='color:#FCFCFC;'>Support:  <strong>"+complaint.getSupport()+"</strong></span><br/>"+
					"<span style='color:#FCFCFC;'>Street: "+complaint.getStreet()+"</span><br/>"+				
				"</li>");
			}
		}
		out.print(returnString.toString());
			}
	}
		
		else
		{
		if(nav != null && nav.equals("next"))
		{

			if(index>=complaints.size())
			{
				out.print("0");
			}
			else
			{
		for(int i=index;i<index+8 && i<complaints.size();i++)
		{	
			complaint=complaints.get(i);
			if(complaint!=null)
			{
			dept=complaint.getDept().trim();
			if(dept.contains("Solid"))
				dept=dept.substring(0,11).trim();
			
			Date cal = (Date)complaint.getDate();
			String date=cal.toString().substring(0, 11);
			id=complaint.getComplaintId();
			returnString.append("<li class='ui-state-default' onclick='populate(this)' id='"+id+"'>" +
					dept+"<br/>"+date+"<br/><br/>"+
					"<span style='color:#FCFCFC;'>Support:  <strong>"+complaint.getSupport()+"</strong></span><br/>"+
					"<span style='color:#FCFCFC;'>Street: "+complaint.getStreet()+"</span><br/>"+				
				"</li>");
			}
			
			
		}
		
		out.print(returnString.toString().trim());
		}
		}
		}
		}
		else
			out.print("0");
		if(text.equals("complaint"))
		{	int flag=0;
			Complaintdetail c1=stub.getComplaintById(index);
				
			
			returnString.append(c1.getStreet()+"/"+c1.getDate().toString().substring(0,11));
			if(!c1.getFeedback().equals(""))
			{
				if(c1.getFeedbackType()==1)
				returnString.append(",positive");
				else if(c1.getFeedbackType()==2)
					returnString.append(",negative");
				else
					returnString.append(",Memo Issued");
				 flag=1;
			}
			else
				returnString.append(",null");
			String status="";
			if(c1.getLevel1status()==1)
				status=",1,"+c1.getComplaint().getLevel1();
			else if(c1.getLevel2status()==1)
				status=",2,"+c1.getComplaint().getLevel2();
			else if(c1.getLevel3status()==1)
				status=",3,"+c1.getComplaint().getLevel3();
			else
				status=",1,yet to handle";
			returnString.append(status);
			returnString.append(","+c1.getDesc());
			returnString.append(","+c1.getComplaintId());
			
			int userId1=c1.getCitizen().getUserId();
			
			if(userId.getUserId()==userId1)
			returnString.append(",true");
			else
				returnString.append(",false");
			Complaintsupport obj=stub.getComplaintSupport(c1.getComplaintId(),userId.getUserId());
			if(obj==null)
			{
				returnString.append(",enable");
			}
			else
			{
				returnString.append(",disable");
			}
			returnString.append(","+c1.getSupport());
			if(flag==1)
				returnString.append(","+c1.getFeedback());
			
			
			out.print(returnString.toString());
					
		}
		if(text.equals("support"))
		{	
			Complaintdetail c1=stub.getComplaintById(index);
			int support=c1.getSupport()+1;
			c1.setSupport(support);
			stub.incrementComplaintSupport(c1,support,userId.getUserId());
			out.print(support);
			
		}
		if(text.equals("feedback"))
		{
			Complaintdetail c1=stub.getComplaintById(index);
			String value=request.getParameter("value");
			String feedbackType=request.getParameter("toggle");
			stub.setFeedback(c1,value,feedbackType);
		}
		if(text.equals("suggsupp"))
		{
			int suggid=Integer.parseInt(request.getParameter("suggid"));
			int support=stub1.incrementSupport(suggid,userId.getUserId());
			out.print(support);
		}
		if(text.equals("mytile"))
		{
			if(complaints1!=null)
			{
			if(index>=complaints1.size())
			{
				out.print("0");
			}
			else
			{
		for(int i=index;i<index+8 && i<complaints1.size();i++)
		{	
			complaint=complaints1.get(i);
			if(complaint!=null)
			{
			dept=complaint.getDept();
			if(dept.contains("Solid"))
				dept=dept.substring(0,11);
			id=complaint.getComplaintId();
			Date cal = (Date)complaint.getDate();
			String date=cal.toString().substring(0, 11);
			returnString.append("<li class='ui-state-default' id='"+id+"'>" +
					dept+"<br/>"+date+"<br/><br/>"+
					"<span style='color:#FCFCFC;'>Support:  <strong>"+complaint.getSupport()+"</strong></span><br/>"+
					"<span style='color:#FCFCFC;'>Street: "+complaint.getStreet()+"</span><br/>"+				
				"</li>");
			}
		}
		out.print(returnString.toString());
			}
			}
			else if(complaints!=null)
			{
				out.print("0");
			}
		}
		}
		else
		{

			request.setAttribute("error","Please login to access the website!");
			RequestDispatcher view = request.getRequestDispatcher("index.jsp");
			view.forward(request, response);
		}
		}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
