<html>  
<head>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <title>ABES Web Portal</title>  
    <link rel="icon" type="image/png" href="a_logo.png">
    <%String fable=request.getParameter("fable");
    String username=request.getParameter("username");
    %>
<style>
    body{
        
        font-family: Arial, Helvetica, sans-serif;
        font-size: 18px;
    }
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
  min-width: 135px;
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
	height: 530px;
        background-color: black;
	}
 
</style>
</head>
<body bgcolor="black">
<img src="logo2.png" id="b">
<img src="kin2.PNG">
<ul id="a">
  <li><a href="" class="active" target="myframe" >Home</a></li>
  <li class="dropdown">
    <a href="javascriptoi:vd(0)" class="dropbtn">Attendance <i class="fa fa-caret-down"></i></a>
    <div class="dropdown-content">
      <a href="student_attendance.jsp" target="myframe">Student Attendance</a>
      <a href="attendance_staff.jsp" target="myframe">Faculty Attendance</a>
     </li>
  <li><a href="https://www.abes.ac.in">ABES Official Website</a></li>
  <li class="dropdown">
    <a href="javascriptoi:vd(0)" class="dropbtn">Students <i class="fa fa-caret-down"></i></a>
    <div class="dropdown-content">
      <a href="student_info.jsp" target="myframe">View Students</a>
      <a href="register.jsp" target="myframe">Add Student</a>
      <a href="modify_students.jsp" target="myframe">Modify Student</a></li>
        <li class="dropdown">
    <a href="javascriptoi:vd(0)" class="dropbtn">Courses <i class="fa fa-caret-down"></i></a>
    <div class="dropdown-content">
      <a href="courses.jsp" target="myframe">View Courses</a>
      <a href="add_course.jsp" target="myframe">Add Course</a>
      <a href="modify_courses.jsp" target="myframe">Modify Course</a></li>
      <li class="dropdown">
    <a href="javascriptoi:vd(0)" class="dropbtn">Staff <i class="fa fa-caret-down"></i></a>
    <div class="dropdown-content">
      <a href="staff_info.jsp" target="myframe">View Staff</a>
      <a href="add_staff.jsp" target="myframe">Add Staff</a>
      <a href="modify_staff.jsp" target="myframe">Modify Staff</a></li>
   <li style="float:right" class="dropdown">
       <a href="javascriptoi:vd(0)" class="dropbtn">Your Account <i class="fa fa-caret-down"></i></a>
       <div class="dropdown-content">
             <%
            session.setAttribute("userId",fable);
             session.setAttribute("username",username);
            %>
            <a href="admin_info.jsp" target="myframe">Account info</a>
                <a href="edit_acc.jsp" target="myframe">Edit Account</a>
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
      String first_name=rs.getString("f_name");
      String last_name=rs.getString("s_name");
      

  %>
  <iframe id="FileFrame" name="myframe" src="about:blank"></iframe>

<script type="text/javascript">
   var doc = document.getElementById('FileFrame').contentWindow.document;
   doc.open();
   doc.write('<html><head><title></title></head><body><div class="container"><img src="12.jpg" width="100%" height="100%"><div class="top-left"><h1>Hello <%=first_name%> <%=last_name%></h1></div></div></body><style>.top-left{position:absolute;top:8px;left:16px;}</html>');
   doc.close();
</script>
                <h1></h1>
                <%
  }
  %>
  

</body>
</html>  