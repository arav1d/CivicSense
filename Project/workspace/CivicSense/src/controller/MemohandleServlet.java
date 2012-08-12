package controller;

import java.io.IOException;
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

import session.Complaint;
import session.MemoInterface;

import entity.Administrator;
import entity.Complaintdetail;
import entity.Memo;

/**
 * Servlet implementation class MemohandleServlet
 * @author 4MB
 * @version 1.0
 */
@WebServlet("/Memo")
public class MemohandleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemohandleServlet() {
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
    private MemoInterface stub;
    @EJB
    private Complaint stub1;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session=request.getSession(false);
		if(session!=null)
		{//adminid authid dept zone ward
			int memoId=Integer.parseInt(request.getParameter("value"));
			Memo memo=stub.getMemo(memoId);
			if(memo!=null)
			{
			request.setAttribute("memo",memo);
			}
			else
			request.setAttribute("no post","zero posts");
			RequestDispatcher view=request.getRequestDispatcher("memo.jsp");
			view.forward(request,response);
		}
		else
		{
			request.setAttribute("error","login to access the website");
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
		String dept=request.getParameter("dept");
		String desc=request.getParameter("desc");
		int id=Integer.parseInt(request.getParameter("compId"));
		Complaintdetail complaint=stub1.getComplaintById(id);
		//Complaintdetail complaint=(Complaintdetail)request.getAttribute("complaint");
		Administrator administrator=(Administrator)session.getAttribute("user");//input admin id
		//Authority authority; get from complaint input auth id
		//zone dept ward
		Memo memo=new Memo();
		memo.setAdministrator(administrator);
		memo.setCompDesc(complaint.getComplaintDesc());
		memo.setDesc(complaint.getDesc());
		memo.setAuthority(complaint.getAuthority());
		//memo.setAuthority(authority);
		memo.setDate(new Date());
		memo.setDept(dept);
		memo.setDesc(desc);
		stub.issueMemo(memo,id);
		try{
		sendMail(memo);
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		request.setAttribute("memmsg","Memo has been<br/>sent and Memo copy has<br/> been mailed.");
		RequestDispatcher view=request.getRequestDispatcher("adminHome.jsp");
		view.forward(request,response);
		}
		else
		{
			request.setAttribute("error","Please login to access the website!");
			RequestDispatcher view=request.getRequestDispatcher("index.jsp");
			view.forward(request,response);
		}
	}
	public void sendMail(Memo mem)
			throws Exception
			{
				
				//String email = mem.getAuthority().getEmail();
				String email = "civicsensetgmc@gmail.com";
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
		            newMessage.setSubject("Memo Received");
		            newMessage.setSentDate(new Date());
		            newMessage.setText("Civic Sense");
		            String htmldoc = "<h2>Memo Details</h2><table><tr><td>Memo Id:</td><td>" +
		            mem.getMemoId()+"</td></tr><tr>"+
		            "<td>Issued By(Administrator):</td>" +
					"<td>"+mem.getAdministrator().getFname()+" "+mem.getAdministrator().getLname()+"</td>" +
					"</tr><tr>" +
					"<td>Posted On:</td>" +
					"<td>"+mem.getDate()+"</td>" +
					"</tr><tr>" +
					"<td>Responsible Authority:</td>" +
					"<td>"+mem.getAuthority().getFname()+" "+mem.getAuthority().getLname()+"</td>" +
					"</tr><tr>" +
					"<td>Department:</td>" +
					"<td>"+mem.getDept()+"</td>" +
					"</tr><tr>" +
					"<td>Authority Credits:</td>" +
					"<td>"+mem.getAuthority().getCredits()+"</td></tr>" +
		            "<tr><td>Description:</td><td>"+mem.getDesc()+"</td></tr></table><br/>"+
		            "<h2>Location Details</h2>" +
		            "<table><tr><td>Zone:</td><td>"+mem.getAuthority().getZone()+"</td>"+
					"</tr><tr><td>Ward:</td><td>"+mem.getAuthority().getWard()+"</td></tr></table>";
		            newMessage.setContent("<html><body>"+htmldoc+"</body></html>", "text/html");
		            transport.connect("smtp.gmail.com", 465, "civicsensetgmc@gmail.com", "4megabytes");
		            transport.sendMessage(newMessage, newMessage.getRecipients(Message.RecipientType.TO));
			}

}
