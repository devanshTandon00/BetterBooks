<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<!-- SELLER BOOK FORM -->
<html>
	<body>
		<head>
			<link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@600&family=Work+Sans:ital@1&display=swap" rel="stylesheet">    
	        <link href = 'sellBookForm.css' rel = 'stylesheet' type="text/css">
		</head>
		<header> 
            <div class = "container">
                <img src = "../images/icon-book.svg" class="book-icon">
                <h3 class = "projectTitle"><a href = "../landingPage/sellerLandingPage.jsp"> BetterBooks </a></h3>
                <nav class = "navbar fixed-top">
                    <ul>
                        <li><a href="../aboutPage/aboutSeller.jsp">About</a></li>
                        <li><a href="../inventoryPage/sellerInventory.jsp">Inventory</a></li>
                        <li><a href="../sellerPage/sellBookForm.jsp"> Add Book </a></li>                      
                        
                    </ul>
                </nav>
            </div>
        </header>
		<div class = "form">
			<h1>Seller Book Selling Form</h1>
			<form action="<%= request.getContextPath() %>/bookForm" method="post">
				<table style="with: 80%">
					<tr>
						<td>Book Title: </td>
						<td><label> <input type="text" name="title" class = "textfield"/>
						</label></td>
					</tr>
					<tr>
						<td>Author First Name: </td>
						<td><input type="text" name="firstName" class = "textfield"/></td>
					</tr>
					<tr>
						<td>Author First Name: </td>
						<td><input type="text" name="lastName" class = "textfield"/></td>
					</tr>
			 		<tr>
						<td>Year Book Published: </td>
						<td><input type="text" name="year" class = "textfield"/></td>
					</tr>
					<tr>
						<td>Book ISBN Number: </td>
						<td><input type="text" name="ISBN" class = "textfield"/></td>
					</tr>
					<tr>
						<td>Book Price: </td>
						<td><input type="text" name="price" class = "textfield"/></td>
					</tr>
				</table>
				<br/>
				<input type="submit" value="Submit" class = "button"/>
			</form>
							
			
		</div>
	</body>
</html>