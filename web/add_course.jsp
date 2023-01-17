<%@ page import="java.sql.*" %>  

<%
try
{	
	Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","12345");
	if(request.getParameter("btn_add")!=null) //check button click event not null
	{
                int no;
		String name,owner;
		no=Integer.parseInt(request.getParameter("txt_no"));
		name=request.getParameter("txt_name"); 
		owner=request.getParameter("txt_owner"); 
		
		PreparedStatement pstmt=null; //create statement 
		
		pstmt=con.prepareStatement("insert into courses values(?,?,?)"); //sql insert query 
		pstmt.setInt(1,no);
                pstmt.setString(2,name); 
		pstmt.setString(3,owner);
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
				<h1>Add Course</h1>
			</center>
		
			
			<table>	
		
				<tr>
                                    <th>Serial No.:</th>
					<td><input id="a" type="text" name="txt_no"></td>
					<th>Course ID:</th>
					<td><input id="a" type="text" name="txt_name"></td>
					<th>Course Name:</th>
					<td><input id="a" type="text" name="txt_owner"></td>
				</tr>	
				
				<tr>
                                    <td colspan="6" ><br><center><input id="log" type="submit" name="btn_add" value="ADD"></center></td>	
				</tr>
				
			</table>
				
		</form>
		
		</div>

</body>

</html>