<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="model.Book"%> 
<%@page import="connection.ConnectDB"%> 
<%@page import="java.util.ArrayList"%> 
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
    
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
                <h3 class = "projectTitle"><a href = "../landingPage/customerLandingPage.jsp"> BetterBooks </a></h3>
                <nav class = "navbar fixed-top">
                    <ul>
                        <li><a href="../DisplayItems">Bookstore</a></li>
                        <li><a href="../aboutPage/about.jsp">About</a></li>
                        <li><a href="../inventoryPage/inventory.jsp">Inventory</a></li>
                        <li><a href = "../orderHistory/order.jsp">Orders</a></li>
                        <li><a href="../ViewCartItems">
                                <img src="../images/cart-icon.png" class="cart_icon" width="30" height="25">
                        </a></li>
                    </ul>
                </nav>
            </div>
    </header>    
    
   <h1>RECEIPT</h1>
   <div class = "table">
	      <table cellpadding = "10">
            <tr>
					<td class = "header">Title</td>
					<td class = "header">Price</td>
			</tr>
	
		<%
		int result = 0;
		
		Connection con = ConnectDB.connect();
		ArrayList<Book> bookstore = (ArrayList<Book>)session.getAttribute("bookData");
		double totalPrice = (double)session.getAttribute("totalPrice"); 
		
// 		String q = "UPDATE inventory SET numberOfBooks=0 WHERE ISBN=0000000000001";
// 		PreparedStatement pst = con.prepareStatement(q);
//         ResultSet rs = pst.executeQuery();

        String q = "INSERT INTO `order`(num_books, total_price) VALUES(?, ?)";
        PreparedStatement preparedStatement = con.prepareStatement(q);
    	preparedStatement.setInt(1, bookstore.size());
    	preparedStatement.setDouble(2, totalPrice);
        result = preparedStatement.executeUpdate();
        
        System.out.println(preparedStatement);
		
		if(bookstore != null){
			for(Book book: bookstore){%> 
  			<tr> 
                <td class = "bookInfo"><%=book.getTitle()%></td> 
                <td class = "bookInfo" style = "text-align:center">$<%=book.getPrice()%></td> 
            </tr> 
        	<%
			}
		}%>
			<tr>
			<td style = "font-size: 14pt; text-align:right;">Total Price: </td>
	        <td class = "bookInfo" style = "text-align:center">$<%=totalPrice%></td>
        </tr>
		</table>
		
		</div>
	</body>
</html>