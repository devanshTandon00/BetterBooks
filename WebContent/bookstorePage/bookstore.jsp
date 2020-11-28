<%@ page import="java.sql.*"%>
<%@page import="java.util.ArrayList"%> 
<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<%@page import="model.Book"%> 
<%@page import="connection.ConnectDB"%> 


<html>
	<body>
	<head>
	        <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@600&family=Work+Sans:ital@1&display=swap" rel="stylesheet">    
	        <link href = 'landingPage/landingPage.css' rel = 'stylesheet' type="text/css">
	        <link href = 'bookstorePage/bookstore.css' rel = 'stylesheet' type="text/css">
	</head>
		<header> 
            <div class = "container">
                <img src = "images/icon-book.svg" class="book-icon">
                <h3 class = "projectTitle"><a href = "landingPage/index.jsp"> BetterBooks </a></h3>
                <nav class = "navbar fixed-top">
                    <ul>
                        <li><a href = "loginPage/login.html">Register</a></li>
                        <li><a href="DisplayItems">Bookstore</a></li>
                        <li><a href="#">About</a></li>
                        <li><a href="inventoryPage/inventory.jsp">Inventory</a></li>
                        <li><a href="ViewCartItems">
                                <img src="images/cart-icon.png" class="cart_icon" width="30" height="25">
                        </a></li>
                    </ul>
                </nav>
            </div>
        </header>
        
		<h1>Welcome to BookStore!</h1>
		
		<select id="mySelect" name="forma" onchange="location = this.value;">
			<option value="bookstore.jsp?sortBy=default">Sort By</option>
			<option value="bookstore.jsp?sortBy=costAsc">Cost: Low to High</option>
			<option value="bookstore.jsp?sortBy=costDes">Cost: High to Low</option>
		</select>
		
	      <table cellpadding = "20">
            <tr>
					<td class = "header">ISBN</td>
					<td class = "header">Title</td>
					<td class = "header">Year</td>
					<td class = "header">Price</td>
					<td class = "header">Author</td>
			</tr>
			<%
		ArrayList<Book> bookstore = (ArrayList<Book>)session.getAttribute("data"); 
		
		if(bookstore != null){
        for(Book book: bookstore){%> 
  			<tr> 
                <td class = "bookInfo"><%=book.getISBN()%></td> 
                <td class = "bookInfo"><%=book.getTitle()%></td> 
                <td class = "bookInfo" style = "text-align:center"><%=book.getYear()%></td> 
                <td class = "bookInfo" style = "text-align:center">$<%=book.getPrice()%></td> 
                <td class = "bookInfo"><%=book.getFirstName() + " "+ book.getLastName()%></td>
<%-- 				 <td class = "bookInfo"><a href = 'bookstore.jsp?ItemId=<%=book.getISBN()%>'><strong>Add to Cart </strong></a></td> --%>
                 
                <td class = "bookInfo"><a href = 'DisplayItems?ItemId=<%=book.getISBN()%>'><strong>Add to Cart </strong></a></td>
            </tr> 
        	<%} %>
        <% }%>	
   </table>
  </body>
</html>
