import static com.sun.corba.se.spi.presentation.rmi.StubAdapter.request;
import java.io.IOException;  
import java.io.PrintWriter;  
import java.sql.*;  
import javax.servlet.RequestDispatcher;  
import javax.servlet.ServletConfig;  
import javax.servlet.ServletException;  
import javax.servlet.http.HttpServlet;  
import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletResponse;  
import java.text.DateFormat;  
import java.text.SimpleDateFormat;  
import java.util.Date;  
import java.util.Calendar;  
public class SerExam extends HttpServlet   
{  
      Connection con;  
      PreparedStatement ps;  
      ResultSet rs; 
      public void init(ServletConfig config)throws ServletException  
      {   
            try   
               {  
                        Class.forName("oracle.jdbc.driver.OracleDriver");  
                        con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","12345");   
               }   
                  catch (ClassNotFoundException e)  
                     {  
                        System.out.println(e);  
                     }   
                  catch (SQLException e)   
                     {  
                        System.out.println(e);  
                     }  
      }  
      public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException   
      {  
            doPost(request, response);  
      }  
      public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException   
      {  
            Date date = Calendar.getInstance().getTime();  
            DateFormat dateFormat = new SimpleDateFormat("yyyy-mm-dd hh:mm");  
            String strDate = dateFormat.format(date); 
            response.setContentType("text/html");  
            PrintWriter pw=response.getWriter();  
            String username=request.getParameter("username");  
            String f_name=request.getParameter("f_name"); 
            String password=request.getParameter("password");
            String fable=request.getParameter("fable");
            int id;
            pw.println("<html><body>");  
            try   
            {  
                  ps=con.prepareStatement("select * from "+fable+" where EMAIL_ID=? and password=?");  
                  ps.setString(1, username);  
                  ps.setString(2, password); 
                  rs=ps.executeQuery();  
                  if(rs.next())  
                  {  
                
                     
                      // pw.println("<h3>Welcome Admin" +" " + f_name +"</h3>");
                      if("loginvalidation".equals(fable))
                      {
          
                      RequestDispatcher rd1=request.getRequestDispatcher("./home.jsp");
                      rd1.include(request,response);
                      pw.println("<h3>Welcome Admin" +" " + strDate +"</h3>");
                      }
                      else if("users".equals(fable))
                      {
                      ps=con.prepareStatement("insert into ATTENDANCE_STUDENT(email_id,present) values('"+username+"','"+strDate+"')");  
                      rs=ps.executeQuery();
                      RequestDispatcher rd1=request.getRequestDispatcher("./home2.jsp");
                      rd1.include(request,response); 
                      }
                       else if("staff_info".equals(fable))
                      {
                      ps=con.prepareStatement("insert into ATTENDANCE_STAFF(email_id,present) values('"+username+"','"+strDate+"')");  
                      rs=ps.executeQuery();
                      RequestDispatcher rd1=request.getRequestDispatcher("./home3.jsp");
                      rd1.include(request,response); 
                      }
                        //pw.println("<form method=\"post\" action=\"login.html\">");  
                        //pw.println("<input type=\"submit\" name=\"logout\" " + "value=\"Logout\">");  
                        //pw.println("</form>");  
                          
                  }  
                  else  
                  {              
                       RequestDispatcher rd2=request.getRequestDispatcher("./login.html");
                        pw.println("<form method=\"post\"><h2>invalid username or password</h2></form>");  

                        rd2.include(request,response);  
                        //or  
                        //response.sendRedirect("./Login.html");  
                  }  
            }  
            catch (SQLException e)   
                  {  
                  e.printStackTrace();  
                  }  
      }  
}  