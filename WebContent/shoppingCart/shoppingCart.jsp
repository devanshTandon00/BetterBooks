<%@ page import="java.sql.*"%>
<%@page import="java.util.ArrayList"%> 
<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<%@page import="model.Book"%> 
<%@page import="connection.ConnectDB"%> 

<html>
	<body>
	<%	if(session.getAttribute("username") == null){
		response.sendRedirect("loginPage/login.jsp");
	}
 %>
	<head>
	        <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@600&family=Work+Sans:ital@1&display=swap" rel="stylesheet">    
	
	        <link href = 'landingPage/landingPage.css' rel = 'stylesheet' type="text/css">
	        <link href = 'shoppingCart/cart.css' rel = 'stylesheet' type="text/css">
	</head>
		<header> 
            <div class = "container">
                <img src = "images/icon-book.svg" class="book-icon">
                <h3 class = "projectTitle"><a href = "landingPage/customerLandingPage.jsp"> BetterBooks </a></h3>
                <nav class = "navbar fixed-top">
                    <ul>
                        <li><a href="DisplayItems">Bookstore</a></li>
                        <li><a href="../aboutPage/about.jsp">About</a></li>
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
					<td class = "header">ISBN</td>
					<td class = "header">Title</td>
					<td class = "header">Year</td>
					<td class = "header">Price</td>
			</tr>
		
		<%
		ArrayList<Book> bookList = (ArrayList<Book>)request.getAttribute("data");
		
		// we have to create a copy of the arraylist and send that .. since after setting the attribute we cannot do anyother changes 
		// and we were making changes on bookList OR pass it at the end
		ArrayList<Book> bookListCopy = new ArrayList<>(bookList);
// 		session.setAttribute("bookData", bookListCopy);

		Connection con = ConnectDB.connect();
		
		String q;
		PreparedStatement pst;
        ResultSet rs = null;
        double totalPrice = 0;

        if(bookList == null){
        	System.out.println("NULL arraylist");
        }
		if(bookList != null){
        	System.out.println("Not null arraylist");
		
        for(Book book: bookList){
        	System.out.println(book.getTitle() + " hello");
			totalPrice = totalPrice + book.getPrice();
        %> 
  			<tr> 
                <td class = "bookInfo"><%=book.getISBN()%></td> 
                <td class = "bookInfo"><%=book.getTitle()%></td> 
                <td class = "bookInfo" style = "text-align:center"><%=book.getYear()%></td> 
                <td class = "bookInfo" style = "text-align:center">$<%=book.getPrice()%></td>                 
                <td class = "bookInfo"><a href = 'ViewCartItems?ItemId=<%=book.getISBN()%>'><strong>Remove From Cart </strong></a></td>
             </tr>
        	<%} %>
        <% }%>	
        <tr>
		<td></td>
		<td></td>
		<td style = "font-size: 14pt">Total Price: </td>
        <td class = "bookInfo" style = "text-align:center">$<%=totalPrice%></td>
        </tr>
		<tr>
			<td></td>
			<td></td>
			<td></td>
			<td><a href = "checkoutPage/checkout.jsp" class = "checkoutBtn">Checkout</a></td>
		</tr>
       </table>
       <%
       session.setAttribute("totalPrice", totalPrice);
       session.setAttribute("bookData", bookList);
       %>
		</body>
		</html>