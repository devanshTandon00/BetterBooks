<%@page import="dao.LoginDao"%>

<!DOCTYPE html>
<html>
	<head>
		<link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@600&family=Work+Sans:ital@1&display=swap" rel="stylesheet">    
	
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
			</label><br> <br> <label> Password : </label> <label> <input
				type="password" name="password"
				placeholder="">
			</label><br> <br> <input type="submit" class="button" name="submit"
				value="Sign in">
			<span id='create_account'>
				<a href="../registrationPage/registration.jsp">Create Customer account! </a>
            	<a href="../registrationPage/sellerRegistration.jsp">Create Seller account! </a>
			</span>
		</form>
	</div>	
	</body>
</html>