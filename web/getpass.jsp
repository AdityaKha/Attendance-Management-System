<%@ page import="java.sql.*" %>
<%
    String recipient="khandelwal.aditya5@gmail.com";
    String fable="loginvalidation";
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","12345");
Statement stmt=con.createStatement();
ResultSet rs=stmt.executeQuery("select *  from "+fable+"  where EMAIL_ID='"+recipient+"'");
  while(rs.next())
  {
      String password=rs.getString("password");
     

  %>
  
Password is-<%=password%>
 

<%
}
 %>
     </body>
</html>
