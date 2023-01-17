package net.codejava.email;
 
import java.io.IOException;
import java.sql.Connection;
import java.sql.*; 
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/EmailSendingServlet")
public class EmailSendingServlet extends HttpServlet {
    private String host;
    private String port;
    private String user;
    private String pass;
    private String password;
 
    public void init() {
        ServletContext context = getServletContext();
        host = context.getInitParameter("host");
        port = context.getInitParameter("port");
        user = context.getInitParameter("user");
        pass = context.getInitParameter("pass");
    }
 
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        // reads form fields
        String recipient = request.getParameter("recipient");
        String subject="ABES Web Portal";
         String fable=request.getParameter("fable");
        String resultMessage = "";
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(EmailSendingServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
Connection con = null;
        try {
            con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","12345");
        } catch (SQLException ex) {
            Logger.getLogger(EmailSendingServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
Statement stmt = null;
        try {
            stmt = con.createStatement();
        } catch (SQLException ex) {
            Logger.getLogger(EmailSendingServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
ResultSet rs = null;
        try {
            rs = stmt.executeQuery("select *  from "+fable+"  where EMAIL_ID='"+recipient+"'");
        } catch (SQLException ex) {
            Logger.getLogger(EmailSendingServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        try {
            while(rs.next())
            {
                password=rs.getString("password");
            }   
          
            } catch (SQLException ex) {
            Logger.getLogger(EmailSendingServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        String content="Your Password is'"+password+"'";
        try {
            EmailUtility.sendEmail(host, port, user, pass, recipient, subject,
                    content);
            resultMessage = "The e-mail was sent to '"+recipient+"'";
        } catch (Exception ex) {
            ex.printStackTrace();
            resultMessage = "There were an error: " + ex.getMessage();
        } finally {
            request.setAttribute("Message", resultMessage);
            getServletContext().getRequestDispatcher("/Result.jsp").forward(
                    request, response);
        }
    }
}