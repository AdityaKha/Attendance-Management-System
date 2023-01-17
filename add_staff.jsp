<%@ page import="java.sql.*" %>  

<%
try
{	
	Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","12345");
	if(request.getParameter("btn_add")!=null) 
	{
                int no;
		String fname,sname,email,pass,phone,dob;
		no=Integer.parseInt(request.getParameter("txt_no"));
		fname=request.getParameter("txt_fname"); 
		sname=request.getParameter("txt_sname"); 
		email=request.getParameter("txt_email"); 
                pass=request.getParameter("txt_pass"); 
                phone=request.getParameter("txt_phone");
                dob=request.getParameter("txt_dob"); 
		PreparedStatement pstmt=null; 
		
		pstmt=con.prepareStatement("insert into staff_info values(?,?,?,?,?,?,?)"); //sql insert query 
                pstmt.setString(1,email); 
		pstmt.setString(2,pass);
                pstmt.setString(3,fname);
                pstmt.setString(4,sname);
                pstmt.setString(5,phone);
                pstmt.setInt(6,no);
                pstmt.setString(7,dob);
                
		pstmt.executeUpdate(); //execute query
		
		con.close();  //close connection 
		
		out.println("<font color="+"white"+"><h2>Added Successfully.</h2></font>");// after insert record successfully message
		
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
		#a{  
    width: 200px;
    margin-left: 0px;
    height: 30px;  
    border-radius: 3px;  
    padding-left: 0px;  
    border:2px solid black;
 font-size: 15px;
}
#log{  
    width: 300px;  
    height: 30px;  
    background-color: black;
    border-radius: 17px; 
    color: white;
    padding-left: 25px;  
    border:3px solid black;
}   
		.main
		{
			width: 1200px;  
        overflow: hidden;
        top:40px;
        left: 120px;
        position: absolute;  
        padding: 0px;  
        background: #4CAF50;  
        border-radius: 15px 50px 30px; 
          
		}
		table
		{
			font-family: arial, sans-serif;
			border-collapse: collapse;
			width: 1000px;
                        margin: auto;
		}
	th{
  padding: 10px;
  text-align: right;

}
td{
   padding:10px;

}

		</style>
		
		
		
	</head>
	
	<body>

		<div class="main">

		<form method="post" name="myform"  onsubmit="return validate();">
                  
			<center>
				<h1>New Staff Member</h1>
			</center>
		
			
			<table>	
		
				<tr>
                                    <th>Id:</th>
					<td><input id="a" type="text" name="txt_no"></td>
					<th>First Name:</th>
					<td><input id="a" type="text" name="txt_fname"></td>
					<th>last name:</th>
					<td><input id="a" type="text" name="txt_sname"></td>
				</tr>	
				
				<tr>
                                     <th> Email:</th>
					<td><input id="a" type="text" name="txt_email"></td>
                                        <th>Password:</th>
					<td><input id="a" type="text" name="txt_pass"></td>
                                        <th>Phone:</th>
					<td><input id="a" type="text" name="txt_phone"></td>
                                 </tr>
                                    <tr>
                                    <th>Date of Birth:</th>
                                    <td><input id="a" type="text" name="txt_dob" value="DD-MMM-YY"></td>
              
                                    <td colspan="6" ><br><center><input id="log" type="submit" name="btn_add" value="ADD"></center></td>	
				</tr>
				
			</table>
				
		</form>
		
		</div>

</body>

</html>