package controller;

import java.io.IOException;

//import java.io.PrintWriter;
import java.util.Date;
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
import javax.servlet.http.HttpSession;


import session.Authority;
import entity.Citizen;
import entity.Complaint;
import entity.Complaintdetail;
import entity.Location;

/**
 * Servlet implementation class CitizenComplaintServlet
 * @author 4MB
 * @version 1.0
 */
@WebServlet("/CitizenComplaint")
public class CitizenComplaintServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CitizenComplaintServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    
    @EJB
    private Authority stub;
    @EJB
    private session.Complaint stub1;
	/**
	 * Method to dispatch the complaint form
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
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
			Citizen citizen=(Citizen)session.getAttribute("user");
			Location location=citizen.getLocation();
			//System.out.println(location.getCitizens().get(0).getAge());
		request.setAttribute("zone",location.getZone());
		request.setAttribute("ward",location.getWard());
		RequestDispatcher view =request.getRequestDispatcher("complaintForm.jsp");
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
	 * 
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 * @param request
	 * @param response
	 * @throws IOException
	 * @throws ServletException
	 */
	 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//PrintWriter out=response.getWriter(); 
		HttpSession session=request.getSession(false);
		if(session!=null)
		{
		String complaintDesc=request.getParameter("compdesc");
		Date date=new Date();
		String desc=request.getParameter("complaint_type");
		String feedback="";
		int feedbackType=0;
		int level1status=0;
		int level2status=0;
		int level3status=0;
		int support=0;
		int validity=1;
		String zone=request.getParameter("zone");
		String ward=request.getParameter("ward");
		String dept=request.getParameter("complaint_category");
		String street=request.getParameter("sploc");
		entity.Authority authority=stub.getAuthority(zone,ward,dept);
		Citizen citizen=(Citizen)session.getAttribute("user");
		Location location=citizen.getLocation();
		
		Complaint complaint=(Complaint)stub1.getComplaintType(desc);
		Complaintdetail complaint1=new Complaintdetail();
		complaint1.setAuthority(authority);
		complaint1.setCitizen(citizen);
		complaint1.setComplaint(complaint);
		complaint1.setComplaintDesc(desc);
		complaint1.setDate(date);
		complaint1.setDept(dept);
		complaint1.setDesc(complaintDesc);
		complaint1.setFeedback(feedback);
		complaint1.setFeedbackType(feedbackType);
		complaint1.setLevel1status(level1status);
		complaint1.setLevel2status(level2status);
		complaint1.setLevel3status(level3status);
		complaint1.setLocation(location);
		complaint1.setSupport(support);
		complaint1.setValidity(validity);
		complaint1.setStreet(street);
		
		
		// Here's the content of the image...
		//byte [] image = output.toByteArray();
		
		
		stub1.insertComplaint(complaint1);
		//List<Complaintdetail> complaints=new ArrayList<Complaintdetail>();
		//complaints.add(complaint1);
		//location.setComplaintdetails(complaints); 
		//System.out.println(location.getComplaintdetails().get(0).getComplaintDesc());
		request.setAttribute("complaint", complaint1);
		try{
		sendMail(citizen,complaint1);
		request.setAttribute("emailmsg","Complaint copy has been <br/> mailed.");
		}
		catch(Exception ex)
		{
			request.setAttribute("emailmsg",null);
		}
		RequestDispatcher view=request.getRequestDispatcher("complaintView.jsp");
		view.forward(request, response);
		}
		else
		{
				request.setAttribute("error","Please login to access the website!");
				RequestDispatcher view=request.getRequestDispatcher("index.jsp");
				view.forward(request,response);
		}
	}
	
	public void sendMail(Citizen ctzn,Complaintdetail cd)
	throws Exception
	{
		
		String email = ctzn.getEmail();
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
			"<td>"+ctzn.getFname()+" "+ctzn.getLname()+"</td>" +
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
            "<table><tr><td>Zone:</td><td>"+ctzn.getLocation().getZone()+"</td>"+
			"</tr><tr><td>Ward:</td><td>"+ctzn.getLocation().getWard()+"</td></tr></table>"+
			"<h2>Complaint  Authority Details</h2>"+
            "<table><tr><td>Responsible Authority:</td><td>"+cd.getAuthority().getFname()+" "+cd.getAuthority().getLname()+"</td>"+
			"</tr><tr><td>Authority's Phonenumber:</td><td>"+cd.getAuthority().getPhNo()+"</td>"+
			"</tr><tr><td>Authority's email:</td><td>"+cd.getAuthority().getEmail()+"</td></tr></table>";
            newMessage.setContent("<html><body>"+htmldoc+"</body></html>", "text/html");
            transport.connect("smtp.gmail.com", 465, "civicsensetgmc@gmail.com", "4megabytes");
            transport.sendMessage(newMessage, newMessage.getRecipients(Message.RecipientType.TO));
	}
}

