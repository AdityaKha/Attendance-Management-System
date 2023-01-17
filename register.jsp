<br><h2>New Student Registration</h2>
<div class="register">
<form action="process.jsp"> 
    <table id="b">
        <br><br> <tr>
            <th><label>ID:</label></th>
            <td><input type="number" name="uid" value="" id="a" onclick="this.value=''"/> 
            </td>
       
            <th>
                <label>Email*:</label></th>
            <td><input type="text" name="uemail" value="" id="a" onclick="this.value=''"/> 
            </td>
        <th><label>Password*:</label></th>
            <td><input type="password" name="upass"  value="" id="a" onclick="this.value=''"/>
            </td></tr>
        <tr><th><label>First name*:</label></th>
            <td><input type="text" name="ufname"  value="" id="a" onclick="this.value=''"/></td> 
<th><label>Surname:</label></th>
    <td><input type="text" name="usname"  value="" id="a" onclick="this.value=''"/></td>
<th><label>Phone number:</label></th>
<td><input type="number" name="uphone"  value="" id="a" onclick="this.value=''"/></td></tr>
<tr><th><label>Address:</label></th>
<td><input type="textarea" name="uaddress"  value="" id="a" onclick="this.value=''"/></td>
<th><label>DOB:</label></th>
    <td><input type="text" name="udob"  value="DD-MMM-YY" id="a" onclick="this.value=''"/></td>
<th><label>Branch:</label></th>
<td><input type="text" name="ubranch"  value="" id="a" onclick="this.value=''"/></td></tr>
<tr><th colspan="6"><center><br><input type="submit" value="Register" id="log"/></center></th></tr>
    
    </table>
</form>
</div>
<style>
    label{  
    color: black;  
    font-size: 20px;
}  

 #a{  
    width: 200px;
    margin-left: 0px;
    height: 30px;  
    border-radius: 3px;  
    padding-left: 0px;  
    border:2px solid black;

}  
body  
{  
    margin: 0;  
    padding: 0;  
    height: 500px;
  background-position: center;
  background-size: cover;
  position: relative;
    background-repeat: no-repeat, repeat;
    background-color: black;
    font-family: 'Arial';
}  

th{
  padding: 10px;
  text-align: right;
}
td{
   padding:10px;
}

h2{  
    text-align: center;  
    color: #4CAF50; 
}  
.register{  
        width: 1200px;  
        overflow: hidden;  
        margin: auto;  
        padding: 0px;  
        background: #4CAF50;  
        border-radius: 15px 50px 30px; 
          
}  
#log{  
    width: 300px;  
    height: 30px;  
    background-color: black;
    border-radius: 17px; 
    color: white;
    padding-left: 7px;  
    border:3px solid black;
}   
</style>