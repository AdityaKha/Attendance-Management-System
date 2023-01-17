<html>    
<head>  
 <title>ABES Web Portal</title>  
    <link rel="icon" type="image/png" href="a_logo.png">
</head>  
<img src="logo.png" width="322" height="150" alt="logo"/>
<body><h2>Forget Password</h2>
<div class="login">
    <form action="EmailSendingServlet" method="post"> <center>
 <label>
    <input type="radio" name="fable" value="student_info" checked="checked">
  <img src="sl1.jpg">
</label>&nbsp;
<label>
  <input type="radio" name="fable" value="staff_info">
  <img src="staff1.png">&nbsp;
</label>
<label>
  <input type="radio" name="fable" value="loginvalidation">
  <img src="adminl.jpg">
</label></span></center>
<pre id="b">         Student         Staff          Admin</pre>   
<label><b>Email:  
   </b>    
        </label>   
<input type="email" name="recipient" id="uname" />  
<br>  
<br>  
<input type="submit"  id="log"> 
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
h2{  
    text-align: center;  
    color: #277582;  
}  
label{  
    color: #08ffd1;  
    font-size: 17px;  
}  
#Uname{  
    width: 260px;
    margin-left: 10px;
    height: 30px;  
    border: none;  
    border-radius: 3px;  
    padding-left: 8px;  
}  
#Pass{  
    width: 260px;  
    height: 30px;  
    border: 1px;  
    border-radius: 3px;  
    padding-left: 8px;  
      
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
span{  
    color: white;  
    font-size: 17px;  
}  
a{  
    float: right;  
    background-color: grey;  
}  
[type=radio] { 
  position: absolute;
  opacity: 0;
  width: 0;
  height: 0;
}

/* IMAGE STYLES */
[type=radio] + img {
  cursor: pointer;
  width: 90px;
  height: 90px;
  border-radius: 50%;
}

/* CHECKED STYLES */
[type=radio]:checked + img {
    border-radius: 10px;
}
#b{
       font-family: 'Arial';
       font-size: 20px;
}
</style>
</html> 


</html>  