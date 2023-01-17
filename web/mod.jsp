
<%@ page import="java.sql.*" %>
<html>
<body>
     <a id="c" href="student_attendance.jsp"><img id="c" src="arrow.png"></a> 
  <table>
  <tr>
      <th><font color=''>ID</font></th>
      <th><font color=''>Email ID</font></th>
      <th><font color=''>Password </font></th>
      <th><font color=''>First name</font></th>
      <th><font color=''>Surname </font></th>
      <th><font color=''>Phone No.</font></th>
      <th><font color=''>Address</font></th>
      <th><font color=''>DOB</font></th>
      <th><font color=''>Branch</font></th>
  </tr>
  <style>
       #c{
         width: 40px;
         height: 40px;
         border-radius: 25px;
         left: 100px;
     }
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
  String fruit=request.getParameter("fruit");
ResultSet rs=stmt.executeQuery("select *  from users where email_id='"+fruit+"'");
  while(rs.next())
  {
      String id=rs.getString("id");
      String email_id=rs.getString("email_id");
      String password=rs.getString("password");
      String f_name=rs.getString("f_name");
      String s_name=rs.getString("s_name");
      String phone=rs.getString("phone");
      String address=rs.getString("address");
      String dob=rs.getString("dob");
      String branch=rs.getString("branch");

  %>
<tr>
<td><b><font color=''><%=id%></font></b></td>
<td><b><font color='green'><%=email_id%></font></b></td>
<td><b><font color=''><%=password%></font></b></td>
<td><b><font color=''><%=f_name%></font></b></td>
<td><b><font color=''><%=s_name%></font></b></td>
<td><b><font color=''><%=phone%></font></b></td>
<td><b><font color=''><%=address%></font></b></td>
<td><b><font color=''><%=dob%></font></b></td>
<td><b><font color=''><%=branch%></font></b></td>

</tr>
<%
  }
 %>
 </table>
     </body>
     <table>
  <tr>
      <th><font >Present</font></th>
    
  </tr>


<%
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con2=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","12345");
Statement stmt1=con.createStatement();
ResultSet rs2=stmt1.executeQuery("select *  from ATTENDANCE_STUDENT where email_id='"+fruit+"'");
  while(rs2.next())
  {
  %>
<tr>
    <td><%=rs2.getString(2)%></td>
				</tr>
  <%
}
  %>
</table></center>
  </html>

</html>
