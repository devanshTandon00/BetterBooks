<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="model.Book"%> 
<%@page import="java.util.ArrayList"%> 
    
<!DOCTYPE html>
<html>
<body>
	<head>
			<link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@600&family=Work+Sans:ital@1&display=swap" rel="stylesheet">    
	        <link href = '../checkoutPage/checkout.css' rel = 'stylesheet' type="text/css">
	</head>
	<header> 
            <div class = "container">
                <img src = "../images/icon-book.svg" class="book-icon">
                <h3 class = "projectTitle"><a href = "../landingPage/index.jsp"> BetterBooks </a></h3>
                <nav class = "navbar fixed-top">
                    <ul>
                        <li><a href = "../loginPage/login.html">Register</a></li>
                        <li><a href="../DisplayItems">Bookstore</a></li>
                        <li><a href="#">About</a></li>
                        <li><a href="../inventoryPage/inventory.jsp">Inventory</a></li>
                        <li><a href="../ViewCartItems">
                                <img src="../images/cart-icon.png" class="cart_icon" width="30" height="25">
                        </a></li>
                    </ul>
                </nav>
            </div>
    </header>    
    
   <h1>RECEIPT</h1>
	      <table cellpadding = "20">
            <tr>
					<td class = "header">ISBN</td>
					<td class = "header">Title</td>
					<td class = "header">Year</td>
					<td class = "header">Price</td>
			</tr>
	
		<%ArrayList<Book> bookstore = (ArrayList<Book>)session.getAttribute("bookData");%>
		<p> You Purchased the following books: </p>
		
		<% 
		if(bookstore == null){
			System.out.println("Arraylist is empty");
		}
		if(bookstore != null){
			for(Book book: bookstore){%> 
  			<tr> 
  			
                <td class = "bookInfo"><%=book.getISBN()%></td> 
                <td class = "bookInfo"><%=book.getTitle()%></td> 
                <td class = "bookInfo" style = "text-align:center"><%=book.getYear()%></td> 
                <td class = "bookInfo" style = "text-align:center">$<%=book.getPrice()%></td> 
            </tr> 
        	<%}
		}%>
		</table>
	</body>
</html>