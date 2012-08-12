package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;
import java.util.Properties;



import javax.ejb.EJB;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSession;

import entity.Authority;
import entity.Complaintdetail;

import session.Complaint;



//import entity.Authority;
//import entity.Complaintdetail;
//import entity.Suggestion;


/**
 * Servlet implementation class AuthorityViewServlet
 * @author 4MB
 * @version 1.0
 */
@WebServlet("/AuthorityView")
public class AuthorityViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    /**
     * @see HttpServlet#HttpServlet()
     * Constructor for AuthorityViewServlet
     */
    public AuthorityViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * Performs operations related to view the authority
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 * @param request
	 * @param response
	 * @throws IOException
	 * @throws ServletException
	 */
    @EJB
    private Complaint stub;
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
    	response.setContentType("text/html");
    	PrintWriter out=response.getWriter();
    	String color = null;
		HttpSession session=request.getSession(false);
		if(session!=null)
		{
			String type=request.getParameter("type");
			Authority authority=(Authority)session.getAttribute("user");
			if(type.equals("invalid"))
			{
				int complaintId=Integer.parseInt(request.getParameter("number"));
				stub.invalidate(complaintId);
				out.print("invalidated");
			}
			else if(type.equals("scroll"))
			{
				int index=Integer.parseInt(request.getParameter("number"));
				
					List<Complaintdetail> complaints=(List<Complaintdetail>)stub.getValidComplaints(authority);
					if(complaints!=null)
					{
					String str1=null;String str2=null;
					//StringBuilder returnString=new StringBuilder();
					int page = 1;
					if(index>=complaints.size())
					{
						//System.out.println("size probs");
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
							str2=temp.getComplaint().getDesc().substring(0, temp.getComplaint().getDesc().length());
						}
						else{
							str1=temp.getComplaint().getDesc();
							str2 = "";
						}
						out.print("<div class='scrollEl' id='"+temp.getComplaintId()+"'onclick='populate(this)' style='background-color:"+color+";'>"+page+"<div class='date' style='color:#fff'>Date:&nbsp;<a style='color:#fff;'>"+temp.getDate().toString().substring(0,10)+"</a></div><div class='place' style='color:#fff'>Place:&nbsp;<a style='color:#fff;font-size:14px'>"+temp.getStreet()+"</a></div><div class='complainee' style='color:#fff'>Complainee:&nbsp;<a style='color:#fff;'>"+temp.getCitizen().getFname()+" "+temp.getCitizen().getLname()+"</a></div><div class='level' style='color:#fff'>Complaint is at &nbsp;<a style='color:#fff;'>Level"+level +" </a></div><div class='desc1' style='color:#fff'>Short Desc:&nbsp;<a style='color:#fff;'>"+str1+"</a></div><div class='desc2' style='color:#fff'><a style='color:#fff;'>"+str2+"</a></div></div>");
						out.print("<div class='scrollEl' id='"+temp.getComplaintId()+"'on' style='background-color:"+color+";visibility:hidden;'>"+page+"<div class='date' style='color:#fff'>Date:&nbsp;<a style='color:#fff;'>"+temp.getDate().toString().substring(0,10)+"</a></div><div class='place' style='color:#fff'>Place:&nbsp;<a style='color:#fff;font-size:14px'>"+temp.getStreet()+"</a></div><div class='complainee' style='color:#fff'>Complainee:&nbsp;<a style='color:#fff;'>"+temp.getCitizen().getFname()+" "+temp.getCitizen().getLname()+"</a></div><div class='level' style='color:#fff'>Complaint is at &nbsp;<a style='color:#fff;'>Level"+level +" </a></div><div class='desc1' style='color:#fff'>Short Desc:&nbsp;<a style='color:#fff;'>"+str1+"</a></div><div class='desc2' style='color:#fff'><a style='color:#fff;'>"+str2+"</a></div></div>");
						
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
					{
						out.print("0");
					}
			}
			else if(type.equals("complaint"))
			{
				int index=Integer.parseInt(request.getParameter("number"));
				Complaintdetail complaint=stub.getComplaintById(index);
				StringBuilder returnString=new StringBuilder();
				String street=complaint.getStreet();
				Date date=complaint.getDate();
				returnString.append(street+"  /  "+date.toString().substring(0,11));
				String area=complaint.getLocation().getZone()+" -- "+complaint.getLocation().getWard();
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
				if(complaint.getValidity()==1)
				returnString.append("&valid");
				else
					returnString.append("&invalid");
				out.print(returnString);
				
				
			}
			else if(type.equals("change"))
			{
				int index=Integer.parseInt(request.getParameter("number"));
				int level=Integer.parseInt(request.getParameter("level"));
				Complaintdetail complaint=stub.getComplaintById(index);
				stub.setLevel(complaint.getComplaintId(),level,authority);
				if(level == 3)
				{
					try{
					sendMail(complaint);
					request.setAttribute("emailmsg","Complaint copy has been <br/> mailed.");
					}
					catch(Exception ex)
					{
						request.setAttribute("emailmsg",null); 
					}
				}
			}
		}
		else
		{
			request.setAttribute("error","Please login to access the website!");
			RequestDispatcher view=request.getRequestDispatcher("index.jsp");
			view.forward(request, response);
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
	
	public void sendMail(Complaintdetail cd)
			throws Exception
			{
				
				String email = cd.getCitizen().getEmail();
				//String email = "civicsensetgmc@gmail.com";
				Properties props = new Properties();
		        props.put("mail.transport.protocol", "smtps");
		        props.put("mail.smtps.host", "smtp.gmail.com");
		        props.put("mail.smtps.auth", "true");
		            Session mailSession = Session.getDefaultInstance(props);
		            mailSession.setDebug(true);
		            Transport transport = mailSession.getTransport();
		            Message newMessage = new MimeMessage(mailSession);
		            newMessage.setFrom(new InternetAddress("civicsensetgmc@gmail.com"));
		            newMessage.setRecipient(Message.RecipientType.TO,new InternetAddress(email));
		            newMessage.setSubject("Complaint Posted Successfully");
		            newMessage.setSentDate(new Date());
		            newMessage.setText("Civic Sense");
		            String htmldoc = "<h2>Complaint Details</h2><table><tr><td>Complaint Id:</td><td>" +
		            cd.getComplaintId()+"</td></tr><tr>"+
		            "<td>Posted By:</td>" +
					"<td>"+cd.getCitizen().getFname()+" "+cd.getCitizen().getLname()+"</td>" +
					"</tr><tr>" +
					"<td>Posted On:</td>" +
					"<td>"+cd.getDate()+"</td>" +
					"</tr><tr>" +
					"<td>Complaint Department:</td>" +
					"<td>"+cd.getDept()+"</td>" +
					"</tr><tr>" +
					"<td>Complaint Type:</td>" +
					"<td>"+cd.getComplaint().getDesc()+"</td>" +
					"</tr><tr>" +
					"<td>Complaint Description:</td>" +
					"<td>"+cd.getComplaintDesc()+"</td></tr></table><br/>" +
					"<h2>Complaint  Location Details</h2>" +
		            "<table><tr><td>Zone:</td><td>"+cd.getCitizen().getLocation().getZone()+"</td>"+
					"</tr><tr><td>Ward:</td><td>"+cd.getCitizen().getLocation().getWard()+"</td></tr></table>"+
					"<h2>Complaint  Authority Details</h2>"+
		            "<table><tr><td>Responsible Authority:</td><td>"+cd.getAuthority().getFname()+" "+cd.getAuthority().getLname()+"</td>"+
					"</tr><tr><td>Authority's Phonenumber:</td><td>"+cd.getAuthority().getPhNo()+"</td>"+
					"</tr><tr><td>Authority's email:</td><td>"+cd.getAuthority().getEmail()+"</td></tr></table>";
		            newMessage.setContent("<html><body>"+htmldoc+"</body></html>", "text/html");
		            transport.connect("smtp.gmail.com", 465, "civicsensetgmc@gmail.com", "4megabytes");
		            transport.sendMessage(newMessage, newMessage.getRecipients(Message.RecipientType.TO));
			}

}
