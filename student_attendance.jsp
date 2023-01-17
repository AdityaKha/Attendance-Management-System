<%@ page import="java.sql.*" %>
<html><center>
<table>
  <tr>
       <th><font color=''>Name</font></th>
      <th><font >Branch</font></th>
    
  </tr>
  <style>
           body{
              background-color: black;  
            }
table {
  border-collapse: collapse;
  width: 100%;
}

th, td,tr {
  text-align: left;
  padding: 15px;
  border:20px;
  border-color: black;
  font-size: 20px;
}

tr,td:nth-child(even){background-color: #f2f2f2;
}
tr,td,th{
   border: 2px solid black; 
    
}
th {
  background-color: #4CAF50;
  color: black;
}
</style>

<%
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","12345");
Statement stmt=con.createStatement();
String email_id;
ResultSet rs=stmt.executeQuery("select *  from users");
  while(rs.next())
  {
  %>
<tr>
    <td><a href="mod.jsp?fruit=<%=rs.getString(4)%> "><%=rs.getString(2)%> <%=rs.getString(3)%></a></td>
					<td><%=rs.getString(9)%></td>
				</tr>
  <%
}
  %>
</table></center>
  </html>
