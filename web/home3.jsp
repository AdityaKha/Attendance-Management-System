<html>  
<head>
    <title>ABES Web Portal</title>  
    <link rel="icon" type="image/png" href="a_logo.png">
    <%String fable=request.getParameter("fable");
    String username=request.getParameter("username");
    %>
<style>
ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
  overflow: hidden;
  background-color: #333;
}

li {
  float: left;
}

li a, .dropbtn {
  display: inline-block;
  color: #4CAF50;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
}

li a:hover, .dropdown:hover .dropbtn {
  background-color: #ddd;
}

li.dropdown {
  display: inline-block;
}

.dropdown-content {
  display: none;
  position: absolute;
  background-color: #4CAF50;
  min-width: 125px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}

.dropdown-content a {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
  text-align: left;
}

.dropdown-content a:hover {background-color: #ddd;}

.dropdown:hover .dropdown-content {
  display: block;
}
li a:hover:not(.active) {
  background-color: #ddd;
}

li a.active {
  color: greenyellow;
  background-color: #4CAF50;
}
iframe {
        width: 100%;
	height: 520px;
	}
 
</style>
</head>
<body bgcolor="black">
<img src="logo2.png" id="b">
<img src="kin2.PNG">
<ul id="a">
  <li><a href="myframe" class="active" target="myframe" >Home</a></li>
  <li><a href="student_attendance.jsp" target="myframe">Student Attendance</a></li>
  <li><a href="https://www.abes.ac.in">ABES Official Website</a></li>
  <!--<li class="dropdown">
    <a href="javascriptoi:vd(0)" class="dropbtn">Student</a>
    <div class="dropdown-content">
      <a href="student_info.jsp" target="myframe">View Students</a>
      <a href="register.jsp" target="myframe">Add Student</a>
      <a href="modify_students.jsp" target="myframe">Modify Student</a>-->
   <li style="float:right" class="dropdown">
       <a href="javascriptoi:vd(0)" class="dropbtn">Your Account</a>
       <div class="dropdown-content">
             <%
            session.setAttribute("userId",fable);
             session.setAttribute("username",username);
            %>
                <a href="admin_info.jsp" target="myframe">Account info</a>
       <a href="login.html">Logout</a>         
       </div>
   </li>
    </div>
</ul>
                <%@ page import="java.sql.*" %>
<%
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","12345");
Statement stmt=con.createStatement();
ResultSet rs=stmt.executeQuery("select *  from "+fable+"  where EMAIL_ID='"+username+"'");
  while(rs.next())
  {
      String f_name=rs.getString("f_name");
      String l_name=rs.getString("s_name");
      

  %>
  <iframe id="FileFrame" name="myframe" src="about:blank"></iframe>

<script type="text/javascript">
   var doc = document.getElementById('FileFrame').contentWindow.document;
   doc.open();
   doc.write('<html><head><title></title></head><body><div class="container"><img src="12.jpg" width="100%" height="100%"><div class="top-left"><h1>Hello <%=f_name%> <%=l_name%></h1></div></div></body><style>.top-left{position:absolute;top:8px;left:16px;}</html>');
   doc.close();
</script>
                <h1></h1>
                <%
  }
  %>
  

</body>
</html>  