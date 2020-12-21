<%@ page import="java.sql.*" %>
<%@ page import = "java.io.*,java.util.*" %>
<%
String e=request.getParameter("userEmail");
String p=request.getParameter("userName");
  
String c=request.getParameter("userCountry");
int n=Integer.parseInt(request.getParameter("userPass"));
int l=Integer.parseInt(request.getParameter("obile")); 
           
Class.forName("oracle.jdbc.driver.OracleDriver");  
Connection con=DriverManager.getConnection(  
"jdbc:oracle:thin:@localhost:1521:xe","system","rahul");  
    

PreparedStatement ps=con.prepareStatement(  
"insert into emp1 values(?,?,?,?,?)");  
  
  
ps.setString(1,e);  
ps.setString(2,p);  
ps.setString(3,c);
ps.setInt(4,n);  
ps.setInt(5,l);        
int i=ps.executeUpdate();  
if(i>0) 
{
session.setAttribute(e,n); 
out.println("record  successfully added..."); 
out.println("<br><br><html>");
out.println("<body bgcolor=>");
out.println("<a href=signin.html>go for signin</a>");
out.println("</body>");
out.println("</html>");
}
else
{
out.print("un");     
}         
  
%>



