<%@page import="java.sql.*" %>

<%
try
{Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","12345");
	if(request.getParameter("delete")!=null)
	{
		int id=Integer.parseInt(request.getParameter("delete"));
		
		PreparedStatement pstmt=null; 
		
		pstmt=con.prepareStatement("delete from users where id=? "); 
		pstmt.setInt(1,id);
		pstmt.executeUpdate(); 
		
		con.close(); 
	}
}
catch(Exception e)
{
	out.println(e);
}
%>	
<html>

	<head>
		<style type="text/css">
                        #c{
         width: 30px;
         height: 30px;
         border-radius: 25px;
     }
	
      		.main
		{
                    font-family: Arial, Helvetica, sans-serif;
                     font-size: 18px;  
			width:100%;
			margin-left:0px;
			padding: 0px;
			border: 5px solid black;
			
		}
table {
  border-collapse: collapse;
  width: 100%;
}

th, td {
  text-align: center;
  padding: 8px;
    border: 1px solid black;

}

tr{background-color: #f2f2f2
}

th {
  background-color: #4CAF50;
  color: white;

}
</style>

	</head>	
	
<body>
		<div class="main">
		
		
		<table>
		
			<tr>
				<th>Roll Number</th>
				<th>First Name</th>
				<th>Last Name</th>
                                <th>Email</th>
                                <th>Password</th>
                                <th>phone</th>
                                <th>Address</th>
				<th>Date of Birth</th>
                                <th>Branch</th>
                                <th>Update</th>
				<th>Delete</th>
			</tr>
		<%
		
		try
		{	
			Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","12345"); 

			PreparedStatement pstmt=null; 
		
			pstmt=con.prepareStatement("select * from users");   
			
			ResultSet rs=pstmt.executeQuery();   
		
			while(rs.next())
			{	
		%>
				<tr>
					<td><%=rs.getInt(1)%></td>
					<td><%=rs.getString(2)%></td>
					<td><%=rs.getString(3)%></td>
                                        <td><%=rs.getString(4)%></td>
                                        <td><%=rs.getString(5)%></td>
                                        <td><%=rs.getString(6)%></td>
                                        <td><%=rs.getString(7)%></td>
                                        <td><%=rs.getString(8)%></td>
                                        <td><%=rs.getString(9)%></td>
                                        <td><a href="update.jsp?edit=<%=rs.getInt(1)%> "><img id="c" src="edit.jpg"></a></td>
                                        <td><a href="?delete=<%=rs.getInt(1)%> "><img id="c" src="delete.png"></a></td>
					
				</tr>
		<%
			}
			
		}
		catch(Exception e)
		{
			out.println(e);
		}
		
		%>
		
		</table>
		
		</div>
		
</body>

</html>