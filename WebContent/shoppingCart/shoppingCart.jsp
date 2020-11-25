<%@ page import="java.sql.*"%>
<%@page import="java.util.ArrayList"%> 
<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<%@page import="model.Book"%> 
<%@page import="connection.ConnectDB"%> 

<html>
	<body>
	<head>
	        <link href = 'landingPage/landingPage.css' rel = 'stylesheet' type="text/css">
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
        
		<h1>Welcome to Shopping Cart!</h1>
	      <table cellpadding = "20">
            <tr>
					<td>ISBN</td>
					<td>Title</td>
					<td>Year</td>
					<td>Price</td>
			</tr>
		
		<%
		ArrayList<Book> bookList = (ArrayList<Book>)request.getAttribute("data"); 
		Connection con = ConnectDB.connect();
		
		String q;
		PreparedStatement pst;
        ResultSet rs = null;
        
		if(bookList != null){
        for(Book book: bookList){%> 
  			<tr> 
                <td><%=book.getISBN()%></td> 
                <td><%=book.getTitle()%></td> 
                <td><%=book.getYear()%></td> 
                <td><%=book.getPrice()%></td>                 
                <td><a href = 'ViewCartItems?ItemId=<%=book.getISBN()%>'><strong>Remove From Cart </strong></a></td>
            </tr> 
        	<%} %>
        <% }%>	
		</table>
		</body>
		</html>