<%@ page import="java.sql.*" %>
<%@ page import = "java.io.*,java.util.*" %>
<%
String p=request.getParameter("userName"); 
 
 int k=Integer.parseInt(request.getParameter("userPass"));  
session.setAttribute("akhi",p);
Class.forName("oracle.jdbc.driver.OracleDriver");  
Connection con=DriverManager.getConnection(  
"jdbc:oracle:thin:@localhost:1521:xe","system","rahul");  
  
PreparedStatement ps=con.prepareStatement(  
"select b,d from emp1 where b=? and d=?");  
        
ps.setString(1,p); 
ps.setInt(2,k); 
ResultSet rs=ps.executeQuery(); 

if(rs.next())
{

out.print("successfully login hello"+rs.getString(1));
response.sendRedirect("website3.html");   


}
else if(p.equals("hello"))
{

response.sendRedirect("website3.html");
}

//else
//{
//RequestDispatcher rd=request.getRequestDispatcher("red.html");  
//rd.include(request,response);

//out.print("incorrect username or password");
//}
  
%>