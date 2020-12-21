<%@ page import="java.sql.*" %>
<%@ page import = "java.io.*,java.util.*" %>

<!DOCTYPE html>
<html>
<head>
	<title>details</title>
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="stys.css">
</head>
<body class="" style="background-color: #7350ea;">
<h1 style="text-align: center; font-family: sans-serif; margin-top: 100px;">Customers Details</h1>
<table border="1" align="center" cellpadding="4" cellspacing="4">
<tr>
<th style="color: white;">Name</th>
<th style="color: white;">Email id</th>
<th style="color: white;">Balance</th>
</tr>

<%
String t1=request.getParameter("rahul");
try{
Statement statement;
ResultSet rs ;
Class.forName("oracle.jdbc.driver.OracleDriver");  
Connection con=DriverManager.getConnection(  
"jdbc:oracle:thin:@localhost:1521:xe","system","rahul");  
  
statement=con.createStatement();

String sql ="select * from customer where name='"+t1+"'";
rs = statement.executeQuery(sql); 
  


while(rs.next()){
%>
<tr>
<td style="color: white;"><%=rs.getString("name") %></td><br>
<td style="color: white;"><%=rs.getString("email") %></td><br>
<td style="color: white;"><%=rs.getInt("balance") %></td><br>




</tr>
<%
}
con.close();
} catch (Exception e) {
out.print("e");
}
      

%>
<br><br><br><br>
</table>
<form action="venue.html" method="post"><br><br>
<button class="btn" style="margin-left: 46%; padding: 10px;">Money Tranfer</button>
</form>
</body>
</html>
  
