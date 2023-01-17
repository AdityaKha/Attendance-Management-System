<%@ page import="java.sql.*" %>
<html><center>
<table>
  <tr>
      <th><font color=''>Course ID</font></th>
      <th><font >Course Name</font></th>
   
  </tr>
  <style>
            body{
              background-color: black;  
            }
table {
  border-collapse: collapse;
  width: 40%;
}

th, td,tr {
  text-align: left;
  padding: 15px;
  border:20px;
  border-color: black;
  font-size: 20px;
}

tr,td:nth-child(even){background-color: #f2f2f2
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
ResultSet rs=stmt.executeQuery("select *  from courses");
  while(rs.next())
  {
      String id=rs.getString("c_id");
      String name=rs.getString("c_name");
     
  
  %>

<tr>
<td><b><font color=''><%=id%></font></b></td>
<td><b><font color=''><%=name%></font></b></td></tr>


  <%
}
  %>
</table></center>
  </html>
