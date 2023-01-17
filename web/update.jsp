<%@ page import="java.sql.*" %>

<%
try
{
	Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","12345");
	if(request.getParameter("btn_update")!=null) //check button click event not null
	{
		int hide; 
		
		String fname,sname,email,phone,pass,address,dob,branch;
		
		hide=Integer.parseInt(request.getParameter("txt_hide")); 
		fname=request.getParameter("txt_fname"); 
		sname=request.getParameter("txt_sname"); 
		email=request.getParameter("txt_email");
                pass=request.getParameter("txt_pass");
                phone=request.getParameter("txt_phone"); 
                address=request.getParameter("txt_address");
                dob=request.getParameter("txt_dob");
                branch=request.getParameter("txt_branch");
		PreparedStatement pstmt=null; //create statement  
		
		pstmt=con.prepareStatement("update users set f_name=?, s_name=?,email_id=?,password=?,phone=?,address=?,dob=?,branch=? where id=?"); //sql update query 
		pstmt.setString(1,fname);
		pstmt.setString(2,sname);
                pstmt.setString(3,email);
                pstmt.setString(4,pass);
                pstmt.setString(5,phone);
                pstmt.setString(6,address);
                pstmt.setString(7,dob);
                pstmt.setString(8,branch);
		pstmt.setInt(9,hide);
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
		
		<script>
		
			function validate()
			{
				var name = document.myform.txt_name;
				var owner = document.myform.txt_owner;
				
				if (name.value == "")
				{
					window.alert("please enter name ?");
					name.focus();
					return false;
				}
				if (owner.value == "")
				{
					window.alert("please enter owner ?");
					owner.focus();
					return false;
				}
			}
			
		</script>
		
	</head>
	
<body bgcolor="">

	<div class="main">

	<form method="post" name="myform"  onsubmit="return validate();">
            <pre>   <a id="c" href="modify_students.jsp"><img id="c" src="arrow.png"></a>                                   Update Record</pre>
		
		<table>	
		   <%
		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","12345");
			if(request.getParameter("edit")!=null) 
			{
				int id=Integer.parseInt(request.getParameter("edit"));
		
				String fname,sname,pass,email,phone,address,dob,branch;
		
				PreparedStatement pstmt=null; // create statement
				
				pstmt=con.prepareStatement("select * from users where id=?"); // sql select query
				pstmt.setInt(1,id);
				ResultSet rs=pstmt.executeQuery(); // execute query store in resultset object rs.
				
				while(rs.next()) 
				{
					id=rs.getInt(1);
					fname=rs.getString(2);
					sname=rs.getString(3);
                                        email=rs.getString(4);
                                        pass=rs.getString(5);
                                        phone=rs.getString(6);
                                        address=rs.getString(7);
                                        dob=rs.getString(8);
                                        branch=rs.getString(9);
                                        
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
			
				<th>Address:</th>
				<td><input type="text" id="a" name="txt_address" value="<%=address%>"></td>
			</tr>	
                        <tr>
				<th>Date of Birth:</th>
				<td><input type="text" id="a" name="txt_dob" value="<%=dob%>"></td>
			
				<th>Branch:</th>
				<td><input type="text" id="a" name="txt_branch" value="<%=branch%>"></td>
			</tr>	
			
			
			<tr>
                            <th colspan="4"><br><input type="submit" id="log" name="btn_update" value="Update"></th>	
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
		
		<center>
                    <h1></h1>
		</center>
		
	</form>

	</div>
	
</body>

</html>