<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <html>  
    
<head>  
<title>ABES Login</title>  
</head>  
<img src="logo.png" width="322" height="150" alt="logo"/>
<body><h2>Forget Password</h2>
<div class="login">
<form action="login.html"> 
    <h3><%=request.getAttribute("Message")%></h3>
    <input type="submit" value="Login Again" id="log"/>
</form>  
</div>
</body>  
<style>  
body  
{  
    margin: 0;  
    padding: 0;  
    background-image:url(12.jpg);
    height: 500px;
  background-position: center;
  background-size: cover;
  position: relative;
    background-repeat: no-repeat, repeat;
    background-color: #cccccc;
    font-family: 'Arial';
}  
.login{  
        width: 382px;  
        overflow: hidden;  
        margin: auto;  
        padding: 60px;  
        background: #23463f;  
        border-radius: 15px ;  
          
}  
h2,h3{  
    text-align: center;  
    color: #277582;  
}  
 
a{  
    float: right;  
    background-color: grey;  
}  
#log{  
    width: 200px; 
    display: block;
    height: 30px;  
    border: none;  
    border-radius: 17px;  
    margin: auto;
    color: black;
    box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);
}   
</style>
</html> 