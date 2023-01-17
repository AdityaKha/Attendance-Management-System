<%@ page import="java.sql.*" %>

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
    padding: 5px;  
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
			margin-left:150px;
                        margin-top: 50px;
			padding: 0px;
			border: 5px solid grey;
			width: 1200px;  
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
                   padding:15px;
                    }
                    pre{
                       font-size: 40px; 
                       font-family: 'Arial'; 
                       font-weight: bold;
                    }

		</style>	
		
		<script>
		
			
		</script>
		
	</head>
	
<body bgcolor="">

	<div class="main">

	<form method="post" name="myform"  action="acc_update.jsp">
          
		<table>	
		   <%
		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","12345");		
				String fname,sname,pass,email,phone,address,dob,branch;
		                String fable="khandelwal.aditya5@gmail.com";
				PreparedStatement pstmt=null; // create statement
				
				pstmt=con.prepareStatement("select * from loginvalidation where email_id='"+fable+"'"); // sql select query
				ResultSet rs=pstmt.executeQuery(); // execute query store in resultset object rs.
				
				while(rs.next()) 
				{
					fname=rs.getString(3);
					sname=rs.getString(4);
                                        email=rs.getString(1);
                                        pass=rs.getString(2);
                                        phone=rs.getString(7);
                                        dob=rs.getString(5);
                                        
			%>
			<tr>
				<th>First Name:</th>
				<td><input type="text" id="a" name="txt_fname" value="<%=fname%>"></td>
			
				<th>Last Name:</th>
				<td><input type="text" id="a" name="txt_sname" value="<%=sname%>"></td>
			
				<th>Email ID:</th>
				<td><input type="text" id="a" name="txt_email" value="<%=email%>"></td>
			</tr>	
			<tr>
				<th>Password:</th>
				<td><input type="text" id="a" name="txt_pass" value="<%=pass%>"></td>
			
				<th>Phone:</th>
				<td><input type="text" id="a" name="txt_phone" value="<%=phone%>"></td>
			
				<th>Date of Birth:</th>
				<td><input type="text" id="a" name="txt_dob" value="<%=dob%>"></td>
			
			</tr>	
			
			
			<tr>
                            <th colspan="4"><br><input type="submit" id="log"  value="Update"></th>	
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
		
		<center>
                    <h1></h1>
		</center>
		
	</form>

	</div>
	
</body>

</html>
