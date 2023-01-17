package bean;  
  
import java.sql.*;  
  
public class RegisterDao {  
  
public static int register(User u){  
int status=0;  
try{  
Connection con=ConnectionProvider.getCon();  
PreparedStatement ps=con.prepareStatement("insert into users values(?,?,?,?,?,?,?,?,?)");  
ps.setString(1,u.getUid());  
ps.setString(2,u.getUfname());  
ps.setString(3,u.getUsname());  
ps.setString(4,u.getUemail());  
ps.setString(5,u.getUpass()); 
ps.setString(6,u.getUphone()); 
ps.setString(7,u.getUaddress());  
ps.setString(8,u.getUdob());  
ps.setString(9,u.getUbranch()); 
              
status=ps.executeUpdate();  
}catch(Exception e){}  
      
return status;  
}  
  
}  