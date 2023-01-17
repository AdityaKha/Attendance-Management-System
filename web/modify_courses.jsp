<%@page import="java.sql.*" %>

<%
try
{Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","12345");
	if(request.getParameter("delete")!=null)
	{
		int id=Integer.parseInt(request.getParameter("delete"));
		
		PreparedStatement pstmt=null; 
		
		pstmt=con.prepareStatement("delete from courses where sr_no=? "); 
		pstmt.setInt(1,id);
		pstmt.executeUpdate(); 
		
		con.close(); 
                out.println("<body text="+"white"+">Deleted Successfully.");
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
                                <th>Sr No.</th>
				<th>Course ID</th>
				<th>Course Name</th>
			
                                <th>Edit</th>
				<th>Delete</th>
			</tr>
		<%
		
		try
		{	
			Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","12345"); 

			PreparedStatement pstmt=null; 
		
			pstmt=con.prepareStatement("select * from courses");   
			
			ResultSet rs=pstmt.executeQuery();   
		
			while(rs.next())
			{	
		%>
				<tr>
                                       <td><%=rs.getInt(1)%></td>
					<td><%=rs.getString(2)%></td>
					<td><%=rs.getString(3)%></td>
                                      
                                        <td><a href="update_course.jsp?edit=<%=rs.getInt(1)%> "><img id="c" src="edit.jpg"></a></td>
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