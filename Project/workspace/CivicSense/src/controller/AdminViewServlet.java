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

import entity.Administrator;
import entity.Complaintdetail;

/**
 * Servlet implementation class AdminViewServ
 * @author 4MB
 * @version 1.0
 */
@WebServlet("/AdminView")
public class AdminViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     * Constructor for AdminViewServlet
     */
    public AdminViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@EJB
	private Complaint stub;
	/*
	 * 
	 * @see javax.servlet.http.HttpServlet#doGet(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
	 * @param request
	 * @param response
	 * @throws IOException
	 * @throws ServletException
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
    	PrintWriter out=response.getWriter();
    	String color = null;
		HttpSession session=request.getSession(false);
		if(session!=null)
		{
			String type=request.getParameter("type");
			Administrator admin=(Administrator)session.getAttribute("user");
			if(type.equals("filter"))
			{
				int complaintId=Integer.parseInt(request.getParameter("number"));
				stub.filter(complaintId);
				out.print("filter");
			}
			else if(type.equals("scroll"))
			{
				int index=Integer.parseInt(request.getParameter("number"));
				
					List<Complaintdetail> complaints=(List<Complaintdetail>)stub.getInValidComplaints(admin.getZone());
					if(complaints!=null)
					{
					String str1=null;String str2=null;int page = 1;
					//StringBuilder returnString=new StringBuilder();
					if(index>=complaints.size())
					{
						out.print("0");
					}
					else
					{
					
					if(complaints.size()==1&&index<complaints.size())
					{
						Complaintdetail temp=complaints.get(0);
						int level=0;
						if(temp.getLevel2status()==1)
						{
							level=2;
							color = "#99cc33";
						}	
						else if(temp.getLevel1status()==1)
						{
								level=1;
								color = "#006699";
						}
						else
						{
							level=0;
							color = "#e73a35";
						}
						if(temp.getComplaint().getDesc().length()>=30)
						{
							str1=temp.getComplaint().getDesc().substring(0,30);
							str2=temp.getComplaint().getDesc().substring(30, temp.getComplaint().getDesc().length());
						}
						else{
							str1=temp.getComplaint().getDesc();
							str2 = "";
						}
						out.print("<div class='scrollEl' id='"+temp.getComplaintId()+"'onclick='populate(this)' style='background-color:"+color+";'>"+1+"<div class='date' style='color:#fff'>Date:&nbsp;<a style='color:#fff;'>"+temp.getDate().toString().substring(0,10)+"</a></div><div class='place' style='color:#fff'>Place:&nbsp;<a style='color:#fff;font-size:14px'>"+temp.getStreet()+"</a></div><div class='complainee' style='color:#fff'>Complainee:&nbsp;<a style='color:#fff;'>"+temp.getCitizen().getFname()+" "+temp.getCitizen().getLname()+"</a></div><div class='level' style='color:#fff'>Complaint is at &nbsp;<a style='color:#fff;'>Level"+level +" </a></div><div class='desc1' style='color:#fff'>Short Desc:&nbsp;<a style='color:#fff;'>"+str1+"</a></div><div class='desc2' style='color:#fff'><a style='color:#fff;'>"+str2+"</a></div></div>");
						out.print("<div class='scrollEl' id='"+temp.getComplaintId()+"'onclick='populate(this)' style='background-color:"+color+";visibility:hidden;'>"+2+"<div class='date' style='color:#fff'>Date:&nbsp;<a style='color:#fff;'>"+temp.getDate().toString().substring(0,10)+"</a></div><div class='place' style='color:#fff'>Place:&nbsp;<a style='color:#fff;font-size:14px'>"+temp.getStreet()+"</a></div><div class='complainee' style='color:#fff'>Complainee:&nbsp;<a style='color:#fff;'>"+temp.getCitizen().getFname()+" "+temp.getCitizen().getLname()+"</a></div><div class='level' style='color:#fff'>Complaint is at &nbsp;<a style='color:#fff;'>Level"+level +" </a></div><div class='desc1' style='color:#fff'>Short Desc:&nbsp;<a style='color:#fff;'>"+str1+"</a></div><div class='desc2' style='color:#fff'><a style='color:#fff;'>"+str2+"</a></div></div>");
						
					}
					else
					{
					for(int i=index;i<index+8 && i<complaints.size();i++,page++)
					{
						Complaintdetail temp=complaints.get(i);
						int level=0;
						if(temp.getLevel2status()==1)
						{
							level=2;
							color = "#99cc33";
						}	
						else if(temp.getLevel1status()==1)
						{
								level=1;
								color = "#006699";
						}
						else
						{
							level=0;
							color = "#e73a35";
						}
						if(temp.getComplaint().getDesc().length()>=30)
						{
							str1=temp.getComplaint().getDesc().substring(0,30);
							str2=temp.getComplaint().getDesc().substring(30, temp.getComplaint().getDesc().length());
						}
						else{
							str1=temp.getComplaint().getDesc();
							str2 = "";
						}
						out.print("<div class='scrollEl' id='"+temp.getComplaintId()+"'onclick='populate(this)' style='background-color:"+color+";'>"+page+"<div class='date' style='color:#fff'>Date:&nbsp;<a style='color:#fff;'>"+temp.getDate().toString().substring(0,10)+"</a></div><div class='place' style='color:#fff'>Place:&nbsp;<a style='color:#fff;font-size:14px'>"+temp.getStreet()+"</a></div><div class='complainee' style='color:#fff'>Complainee:&nbsp;<a style='color:#fff;'>"+temp.getCitizen().getFname()+" "+temp.getCitizen().getLname()+"</a></div><div class='level' style='color:#fff'>Complaint is at &nbsp;<a style='color:#fff;'>Level"+level +" </a></div><div class='desc1' style='color:#fff'>Short Desc:&nbsp;<a style='color:#fff;'>"+str1+"</a></div><div class='desc2' style='color:#fff'><a style='color:#fff;'>"+str2+"</a></div></div>");
						
					}
					//out.print(returnString.toString());
					}
					}
					}
					else
					out.print("0");
			}
			else if(type.equals("complaint"))
			{
				int index=Integer.parseInt(request.getParameter("number"));
				Complaintdetail complaint=stub.getComplaintById(index);
				if(complaint!=null)
				{
				StringBuilder returnString=new StringBuilder();
				String street=complaint.getStreet();
				Date date=complaint.getDate();
				returnString.append(street+" / "+date.toString().substring(0,11));
				String area=complaint.getLocation().getZone()+"  --  "+complaint.getLocation().getWard();
				returnString.append("&"+area);
				String name=complaint.getCitizen().getFname()+" "+complaint.getCitizen().getLname()+"[ "+complaint.getCitizen().getEmail()+" ]";
				returnString.append("&"+name);
				String dept=complaint.getDept()+" "+complaint.getComplaint().getDesc();
				returnString.append("&"+dept);
				int level;
				if(complaint.getLevel1status()==1 && complaint.getLevel2status()==1)
						level=2;
				else if(complaint.getLevel1status() == 1)
						level=1;
				else
					level=0;
				returnString.append("&"+level);
				String desc=complaint.getComplaintDesc();
				returnString.append("&"+desc);
				String l1=complaint.getComplaint().getLevel1();
				String l2=complaint.getComplaint().getLevel2();
				String l3=complaint.getComplaint().getLevel3();
				returnString.append("&"+l1);
				returnString.append("&"+l2);
				returnString.append("&"+l3);
				if(complaint.getValidity()==0 && type.equals("filter"))
					returnString.append("&unfiltered");
					else if(type.equals("filter"))
						returnString.append("&filtered");
					else
						returnString.append("&feedback");
					returnString.append("&"+complaint.getComplaintId());
					returnString.append("&"+complaint.getFeedback());
					out.print(returnString);
					}
					else
					{
						out.print("filtered");
					}
				
			}
			else if(type.equals("feedback"))
			{
				int index=Integer.parseInt(request.getParameter("number"));
				
					List<Complaintdetail> complaints=(List<Complaintdetail>)stub.getNegativeFeedbacks(admin.getZone());
					if(complaints!=null)
					{
					String str1=null;String str2=null;
					StringBuilder returnString=new StringBuilder();int page = 1;
					if(index>=complaints.size())
					{
						System.out.println("overflow");
						out.print("0");
					}
					else
					{
						
						if(complaints.size()==1&&index<complaints.size())
					{
						Complaintdetail temp=complaints.get(0);
						int level=0;
						if(temp.getLevel2status()==1)
						{
							level=2;
							color = "#99cc33";
						}	
						else if(temp.getLevel1status()==1)
						{
								level=1;
								color = "#006699";
						}
						else
						{
							level=0;
							color = "#e73a35";
						}
						if(temp.getComplaint().getDesc().length()>=30)
						{
							str1=temp.getComplaint().getDesc().substring(0,30);
							str2=temp.getComplaint().getDesc().substring(30, temp.getComplaint().getDesc().length());
						}
						else{
							str1=temp.getComplaint().getDesc();
							str2 = "";
						}
						out.print("<div class='scrollEl' id='"+temp.getComplaintId()+"'onclick='populate(this)' style='background-color:"+color+";'>"+1+"<div class='date' style='color:#fff'>Date:&nbsp;<a style='color:#fff;'>"+temp.getDate().toString().substring(0,10)+"</a></div><div class='place' style='color:#fff'>Place:&nbsp;<a style='color:#fff;font-size:14px'>"+temp.getStreet()+"</a></div><div class='complainee' style='color:#fff'>Complainee:&nbsp;<a style='color:#fff;'>"+temp.getCitizen().getFname()+" "+temp.getCitizen().getLname()+"</a></div><div class='level' style='color:#fff'>Complaint is at &nbsp;<a style='color:#fff;'>Level"+level +" </a></div><div class='desc1' style='color:#fff'>Short Desc:&nbsp;<a style='color:#fff;'>"+str1+"</a></div><div class='desc2' style='color:#fff'><a style='color:#fff;'>"+str2+"</a></div></div>");
						out.print("<div class='scrollEl' id='"+temp.getComplaintId()+"'onclick='populate(this)' style='background-color:"+color+";visibility:hidden;'>"+2+"<div class='date' style='color:#fff'>Date:&nbsp;<a style='color:#fff;'>"+temp.getDate().toString().substring(0,10)+"</a></div><div class='place' style='color:#fff'>Place:&nbsp;<a style='color:#fff;font-size:14px'>"+temp.getStreet()+"</a></div><div class='complainee' style='color:#fff'>Complainee:&nbsp;<a style='color:#fff;'>"+temp.getCitizen().getFname()+" "+temp.getCitizen().getLname()+"</a></div><div class='level' style='color:#fff'>Complaint is at &nbsp;<a style='color:#fff;'>Level"+level +" </a></div><div class='desc1' style='color:#fff'>Short Desc:&nbsp;<a style='color:#fff;'>"+str1+"</a></div><div class='desc2' style='color:#fff'><a style='color:#fff;'>"+str2+"</a></div></div>");
						
					}
					else
					{
					
					for(int i=index;i<index+8 && i<complaints.size();i++,page++)
					{
						Complaintdetail temp=complaints.get(i);
						int level=0;
						if(temp.getLevel2status()==1)
						{
							level=2;
							color = "#99cc33";
						}	
						else if(temp.getLevel1status()==1)
						{
								level=1;
								color = "#006699";
						}
						else
						{
							level=0;
							color = "#e73a35";
						}
						if(temp.getComplaint().getDesc().length()>=30)
						{
							str1=temp.getComplaint().getDesc().substring(0,30);
							str2=temp.getComplaint().getDesc().substring(30, temp.getComplaint().getDesc().length());
						}
						else{
							str1=temp.getComplaint().getDesc();
							str2 = "";
						}
						System.out.println(temp.getComplaintId());
						out.print("<div class='scrollEl' id='"+temp.getComplaintId()+"'onclick='populate(this)' style='background-color:"+color+";'>"+page+"<div class='date' style='color:#fff'>Date:&nbsp;<a style='color:#fff;'>"+temp.getDate().toString().substring(0,10)+"</a></div><div class='place' style='color:#fff'>Place:&nbsp;<a style='color:#fff;font-size:14px'>"+temp.getStreet()+"</a></div><div class='complainee' style='color:#fff'>Complainee:&nbsp;<a style='color:#fff;'>"+temp.getCitizen().getFname()+" "+temp.getCitizen().getLname()+"</a></div><div class='level' style='color:#fff'>Complaint is at &nbsp;<a style='color:#fff;'>Level"+level +" </a></div><div class='desc1' style='color:#fff'>Short Desc:&nbsp;<a style='color:#fff;'>"+str1+"</a></div><div class='desc2' style='color:#fff'><a style='color:#fff;'>"+str2+"</a></div></div>");
						
					}
					out.print(returnString.toString());
					}
					}
					}
					else
					{
						System.out.println("underflow");
						out.print("0");
					}
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
	 * @param request
	 * @param response
	 * @throws IOException
	 * @throws ServletException
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
