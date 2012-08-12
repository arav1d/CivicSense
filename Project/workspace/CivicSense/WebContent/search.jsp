<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page language="java" import="java.sql.*" %>
<% response.setContentType("text/html");%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
String str=request.getParameter("searchbox");
try {
String connectionURL = "jdbc:mysql://localhost:3306/cmp";
Connection con;
Class.forName("com.mysql.jdbc.Driver");
// Get a Connection to the database
con = DriverManager.getConnection(connectionURL, "root", "aswin"); 
//Add the data into the database
String sql = "SELECT complaint_desc FROM complaint WHERE complaint_desc LIKE '%"
+str+"%' LIMIT 6";
Statement stm = con.createStatement();
stm.executeQuery(sql);
ResultSet rs= stm.getResultSet();
while (rs.next ()){
out.println("<li onclick=\""+"fill('"+rs.getString("complaint_desc")+"');\">"+rs.getString("complaint_desc")+"</li>");
}
}catch(Exception e){
System.out.println("Exception is ;"+e);
}
%>