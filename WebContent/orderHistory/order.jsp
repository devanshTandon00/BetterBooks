<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.Connection" %>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="connection.ConnectDB"%> 

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
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
                        <li><a href="../ViewCartItems">
                                <img src="../images/cart-icon.png" class="cart_icon" width="30" height="25">
                        </a></li>
                    </ul>
                </nav>
            </div>
    </header>    
    <h1 style = "text-align:center; padding-top: 25px;"> Order History</h1>
    <div style = "padding-top: 25px;">
    <table cellpadding = "20" style = "margin: 0px auto;">
            <tr>
					<td style = "font-style:italic;	font-weight: bold;font-size: 18pt;">Order ID</td>
					<td style = "font-style:italic;	font-weight: bold;font-size: 18pt;">Number of Books</td>
					<td style = "font-style:italic;	font-weight: bold;font-size: 18pt;">Total Price</td>
			</tr>
    <%
    
    String q = "SELECT * FROM team3bookshop.order";
    try (Connection con = ConnectDB.connect();) {
    	PreparedStatement preparedStatement = con.prepareStatement(q);
		ResultSet rs = preparedStatement.executeQuery();
		
		 while (rs.next()) 
         {
         %>	
	            	<tr>
		            	<td style = "font-size: 12pt;"><%=rs.getInt(1)%></td>
		            	<td style = "font-size: 12pt;"><%=rs.getInt(2)%></td>
		            	<td style = "font-size: 12pt;"><%=rs.getDouble(3)%></td>
	            	</tr>    	
         <% } 
    }
	%>
 	</table>
 	</div>
</body>
</html>