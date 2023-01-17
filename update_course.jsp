<%@ page import="java.sql.*" %>

<%
try
{
	Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","12345");
	if(request.getParameter("btn_update")!=null) //check button click event not null
	{
		int hide; 
		
		String c_name,c_id;
		
		hide=Integer.parseInt(request.getParameter("txt_hide")); 
		c_name=request.getParameter("txt_fname"); 
		c_id=request.getParameter("txt_sname"); 
		
		PreparedStatement pstmt=null; //create statement  
		
		pstmt=con.prepareStatement("update courses set c_id=?, c_name=? where sr_no=?");
		pstmt.setString(1,c_name);
		pstmt.setString(2,c_id);
		pstmt.setInt(3,hide);
		pstmt.executeUpdate(); //execute query
		
		con.close(); //connection close

		out.println("<body text="+"white"+">Updated Successfully."); //after update record successfully message
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
            #b{
               color: black; 
                
            }
            
 #a{  
    width: 220px;
    margin-left: 0px;
    height: 30px;  
    border-radius: 3px;  
    padding-left: 0px;  
    border:3px solid black;
     font-size: 16px;
     }  
     #c{
         width: 40px;
         height: 40px;
         border-radius: 25px;
         left: 100px;
     }
		.main
		{
                     font-family: 'Arial';
			width:700px;;
			margin-left:250px;
			padding: 0px;
			border: 5px solid grey;
			width: 1200px;  
                        margin: auto;  
                        background: #4CAF50;  
                        border-radius: 15px 50px 30px;
		}
                #log{  
                 width: 300px;  
                 height: 30px;  
                 background-color: black;
                 border-radius: 17px; 
                 color: white;
                 padding-left: 7px;  
                 border:3px solid black;
                }
		th{
                   padding: 10px;
                    text-align: right;
                    font-size: 18px;
                    
                    }
                   td,th{
                   padding:10px;
                    }
                    pre{
                       font-size: 40px; 
                       font-family: 'Arial'; 
                       font-weight: bold;
                    }

		</style>	
		
		
		
	</head>
	
<body bgcolor="">

	<div class="main">

	<form method="post" name="myform"  onsubmit="return validate();">
            <pre>   <a id="c" href="modify_courses.jsp"><img id="c" src="arrow.png"></a>                                   Update Record</pre>
            <center>
		<table>	
		   <%
		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","12345");
			if(request.getParameter("edit")!=null) 
			{
				int id=Integer.parseInt(request.getParameter("edit"));
		
				String fname,sname;
		
				PreparedStatement pstmt=null; // create statement
				
				pstmt=con.prepareStatement("select * from courses where sr_no=?"); // sql select query
				pstmt.setInt(1,id);
				ResultSet rs=pstmt.executeQuery(); // execute query store in resultset object rs.
				
				while(rs.next()) 
				{
					id=rs.getInt(1);
					fname=rs.getString(2);
					sname=rs.getString(3);
                                    
                                        
			%>
			<tr>
				<th>Course ID:</th>
				<td><input type="text" id="a" name="txt_fname" value="<%=fname%>"></td>
			
				<th>Course Name:</th>
				<td><input type="text" id="a" name="txt_sname" value="<%=sname%>"></td>
		</tr>	
		
			<tr>
                            <th colspan="3"><br><input type="submit" id="log" name="btn_update" value="Update"></th>	
			</tr>
				
				<input type="hidden" name="txt_hide" value="<%=id%>">
		<%
				}
			}
		}
		catch(Exception e)
		{
			out.println(e);
		}
		%>	
		</table>
		</center>
		
	</form>

	</div>
	
</body>

</html>