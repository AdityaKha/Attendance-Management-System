<%@page import="bean.RegisterDao"%>  
<jsp:useBean id="obj" class="bean.User"/>  
  
<jsp:setProperty property="*" name="obj"/>  
  
<%  
int status=RegisterDao.register(obj);  
if(status>0)  
out.print("<body bgcolor="+"black"+"><br><br><h1>Student is successfully registered</h1></body>");  
  
%>  
<style>
    
    
    h1{  
    text-align: center;  
    color: #277582;  
} 
</style>