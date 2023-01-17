<%@ page import="java.sql.*" %>
<html>
<body bgcolor="black">
 
  <style>
table {
  border-collapse: collapse;
  width: 40%;
}

th, td {
  text-align: left;
  padding: 15px;
  border:20px;
  border-color: black;
  font-size: 20px;
}

tr,td:nth-child(even){background-color: #f2f2f2
}
tr,td{
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
String fable=session.getAttribute("userId").toString();
String username=session.getAttribute("username").toString();
ResultSet rs=stmt.executeQuery("select * from "+fable+" where email_id='"+username+"'");
  while(rs.next())
  {
      String email_id=rs.getString("email_id");
      String password=rs.getString("password");
      String f_name=rs.getString("f_name");
      String s_name=rs.getString("s_name");
      String dob=rs.getString("dob");
      String phone=rs.getString("phone");
  %>
<center><table>
  <tr><th><font >Email ID</font></th>
      <td><b><font color=''><%=email_id%></font></b></td></tr>
  <tr><th><font color=''>Password </font></th>
      <td><b><font color=''><%=password%></font></b></td></tr>
  <tr><th><font color=''>First name</font></th>
      <td><b><font color=''><%=f_name%></font></b></td></tr>
  <tr><th><font color=''>Surname </font></th>
  <td><b><font color=''><%=s_name%></font></b></td> </tr>
  <tr><th><font color=''>Date of Birth</font></th>
     <td><b><font color=''><%=dob%></font></b></td>
      <tr><th><font color=''>Phone Number</font></th>
     <td><b><font color=''><%=phone%></font></b></td>
   </tr>
<%
 }
 %>
    </table></center>
     </body>
</html>
