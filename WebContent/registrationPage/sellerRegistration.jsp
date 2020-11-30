<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<!-- SELLER REGISTER -->
<html>
	<body>
		<head>
			<link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@600&family=Work+Sans:ital@1&display=swap" rel="stylesheet">    
	        <link href = 'registration.css' rel = 'stylesheet' type="text/css">
		</head>
		<header> 
            <div class = "container">
                <img src = "../images/icon-book.svg" class="book-icon">
                <h3 class = "projectTitle"><a href = "../landingPage/index.jsp"> BetterBooks </a></h3>
                <nav class = "navbar fixed-top">
                    <ul>
                        <li><a href = ../loginPage/login.jsp">Register</a></li>
                        <li><a href="DisplayItems">Bookstore</a></li>
                        <li><a href="../aboutPage/about.jsp">About</a></li>
                        <li><a href="../inventoryPage/inventory.jsp">Inventory</a></li>
                        <li><a href="ViewCartItems">
                                <img src="../images/cart-icon.png" class="cart_icon" width="30" height="25">
                        </a></li>
                    </ul>
                </nav>
            </div>
        </header>
		<div class = "form">
			<h1>Seller Register Form</h1>
			<form action="<%= request.getContextPath() %>/registerSeller" method="post">
				<table style="with: 80%">
					<tr>
						<td>Username: </td>
						<td><label> <input type="text" name="username" class = "textfield"/>
						</label></td>
					</tr>
					<tr>
						<td>First Name: </td>
						<td><input type="text" name="firstName" class = "textfield"/></td>
					</tr>
					<tr>
						<td>Last Name: </td>
						<td><input type="text" name="lastName" class = "textfield"/></td>
					</tr>
			 		<tr>
						<td>Address: </td>
						<td><input type="text" name="address" class = "textfield"/></td>
					</tr>
				</table>
				<br/>
				<input type="submit" value="Submit" class = "button"/>
			</form>
							
			
		</div>
	</body>
</html>