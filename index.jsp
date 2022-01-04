<!DOCTYPE html>   
<html>   
<head>  
<meta name="viewport" content="width=device-width, initial-scale=1">  
<title> Login Page </title>  
<script>
		function login(){
			var password = document.getElementById("password").value
			var username = document.getElementById("username").value
			var result = document.getElementById("result")
			if( password == "" || username == "")
			{
				alert("Please enter username and password")
			}
			else 
			{
				result.style.display = "block"
				if (password == "admin" && username == "admin")
				{	
					result.style.backgroundColor = "green";
					result.innerHTML = "Success!"
				}
				else
				{
					result.innerHTML = "Login Failed!"
					result.style.backgroundColor = "red";
				}
			}
		}
		
		function clean(){
			var password = document.getElementById("password");
			var username = document.getElementById("username");
			var result = document.getElementById("result");
			password.value = "";
			username.value = "";
			result.style.display = "none";
		}
	</script>
<style>   
Body {  
  font-family: Calibri, Helvetica, sans-serif;   
}  
button {   
       background-color: #4CAF50;   
       width: 100%;  
        color: orange;   
        padding: 15px;   
        margin: 10px 0px;   
        border: none;   
        cursor: pointer;   
         }   
 form {   
        border: 3px solid #f1f1f1;   
    }   
 input[type=text], input[type=password] {   
        width: 100%;   
        margin: 8px 0;  
        padding: 12px 20px;   
        display: inline-block;   
        border: 2px solid green;   
        box-sizing: border-box;   
    }  
 button:hover {   
        opacity: 0.7;   
    }   
  .cancelbtn {   
        width: auto;   
        padding: 10px 18px;  
        margin: 10px 5px;  
    }   
        
     
 .container {
		margin: auto;
		width: 500px;
        padding: 25px; 
        background-color: lightblue;  
    }
	
  .result {
	  width: 200px;
	  padding: 10px;
	  margin: auto;
	  background-color: green;
	  text-align: center;
	  display: none;
	  font-size: 20px;
	  color: white;
  }
</style>   
</head>    
<body>    
    <center> <h1> Student Login Form </h1> </center>   
        <div class="container">   
            <label>Username : </label>   
            <input type="text" placeholder="Enter Username" name="username" id="username" required>  
            <label>Password : </label>   
            <input type="password" placeholder="Enter Password" name="password" id="password" required>  
            <button type="button" onclick="login()">Login</button>   
            <input type="checkbox" checked="checked"> Remember me   
            <button type="button" class="cancelbtn" onclick="clean()"> Cancel</button>   
            Forgot <a href="#"> password? </a>
			<div class="result" id="result"></div>
        </div>      
</body>     
</html>  