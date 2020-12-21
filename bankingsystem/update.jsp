<%@ page import="java.sql.*" %>
<%@ page import = "java.io.*,java.util.*" %>
<!DOCTYPE html>
<html>
<head>
	<title>update page</title>
</head>
<body style="background-color: #7350ea;">



<h1 style="text-align: center;color: white;">Transcation Details</h1>
<table border="1" align="center" cellpadding="4" cellspacing="4">
<tr>
<th style="color: white; padding: 30px;">Name</th>
<th style="color: white; padding: 30px;">Balance</th>
</tr>
<%


Statement statement;
ResultSet rs ;
int y=0;
int b=Integer.parseInt(request.getParameter("balance"));  
String name=request.getParameter("name");   
Class.forName("oracle.jdbc.driver.OracleDriver");  
Connection con=DriverManager.getConnection(  
"jdbc:oracle:thin:@localhost:1521:xe","system","rahul");  
    
 
PreparedStatement ps=con.prepareStatement(  
"Update customer set balance=? where name=?");  
  
statement=con.createStatement();

String sql ="select balance,name from customer where name='"+name+"'";;
rs = statement.executeQuery(sql); 
  


while(rs.next()){
y=rs.getInt("balance");
%>
<tr>
<td style="color: white; padding: 30px;"><%=rs.getString("name") %></td><br>
<td style="color: white; padding: 30px;"><%=rs.getInt("balance") %></td><br>
</tr>
<%
}
ps.setInt(1,b+y); 
ps.setString(2,name); 
       
int i=ps.executeUpdate();  
if(i>0) 
{ 

out.print(" Money Transfer successfully ");
out.println("<a href=website3.html>go to home page...........</a>");

}
else
{
out.print("un");     
}         
  
%>

</body>
</html>



