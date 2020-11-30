<%@page import="dao.LoginDao"%>

<!DOCTYPE html>
<html>
	<head>
		<link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@600&family=Work+Sans:ital@1&display=swap" rel="stylesheet">    
			        <link href = 'loginPage.css' rel = 'stylesheet' type="text/css">
		
		<style>
			div{
				text-align:center;
				padding: 170px;
			}	
		</style>	
	</head>
	<body>
        
		<div class="sign_up">
		<form method="post" id="login" action="<%=request.getContextPath()%>/login">
			<h1>Login</h1>
			<label> Username: </label> <label> <input name="username"
				placeholder="">
			</label><br> 
			<br> <label> Password : </label> <label> <input
				type="password" name="password"
				placeholder="">
			</label><br> 
			<br> <input type="submit" class="buttonA" name="submit"
				value="Sign in">
			<span id='create_account'>
				 <button class = "buttonA"><a href="../registrationPage/registration.jsp">Customer Registration -> </a></button>
            	<button class = "buttonA"><a href="../registrationPage/sellerRegistration.jsp">Seller Registration -></a> </button>
			</span>
		</form>
	</div>	
	</body>
</html>