<%@ page import="java.sql.*" %>

<%
try
{
	Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","12345");
	
		String fname,sname,email,phone,pass,address,dob,branch;
		 
		fname=request.getParameter("txt_fname"); 
		sname=request.getParameter("txt_sname"); 
		email=request.getParameter("txt_email");
                pass=request.getParameter("txt_pass");
                phone=request.getParameter("txt_phone"); 
                dob=request.getParameter("txt_dob");
		PreparedStatement pstmt=null; //create statement  
		
		pstmt=con.prepareStatement("update LOGINVALIDATION set f_name=?, s_name=?,phone=?,dob=?,password=?,email_id=?"); //sql update query 
		pstmt.setString(1,fname);
		pstmt.setString(2,sname);
                pstmt.setString(3,phone);
                pstmt.setString(4,dob);
                pstmt.setString(5,pass);
                pstmt.setString(6,email);

      
		pstmt.executeUpdate(); //execute query
		
		con.close(); //connection close

		out.println("<body text="+"black"+">Updated Successfully."); //after update record successfully message
	}	
	
catch(Exception e)
{
	out.println(e);
}

%>
