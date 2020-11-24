<%@ page import="java.sql.*"%>
<%@page import="java.util.ArrayList"%> 
<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<%@page import="model.Book"%> 
<%@page import="connection.ConnectDB"%> 

<html>
	<body>
	<head>
	        <link href = '../inventoryPage/inventory.css' rel = 'stylesheet' type="text/css">
	        <link href = 'landingPage.css' rel = 'stylesheet' type="text/css">
	</head>
		<header> 
            <div class = "container">
                <img src = "../images/icon-book.svg" class="book-icon">
                <h3 class = "projectTitle"><a href = "../landingPage/index.jsp"> BetterBooks </a></h3>
                <nav class = "navbar fixed-top">
                    <ul>
                        <li><a href = "../loginPage/login.html">Register</a></li>
                        <li><a href="../bookstorePage/bookstore.jsp">Bookstore</a></li>
                        <li><a href="#">About</a></li>
                        <li><a href="../inventoryPage/inventory.jsp">Inventory</a></li>
                        <li><a href="ViewCartItems">
                                <img src="../images/cart-icon.png" class="cart_icon" width="30" height="25">
                        </a></li>
                    </ul>
                </nav>
            </div>
        </header>
        <a href = 'ViewCartItems'>View Cart</a>
		<h1>Welcome to BookStore!</h1>
	      <table cellpadding = "20">
            <tr>
					<td>ISBN</td>
					<td>Title</td>
					<td>Year</td>
					<td>Price</td>
			</tr>
			<%
		ArrayList<Book> bookstore =  (ArrayList<Book>)request.getAttribute("data"); 
		Connection con = ConnectDB.connect();
			
		String q = "select * from books";
		PreparedStatement pst = con.prepareStatement(q);
        ResultSet rs = pst.executeQuery();
		
		if(bookstore != null){
        for(Book book: bookstore){%> 
  			<tr> 
                <td><%=book.getISBN()%></td> 
                <td><%=book.getTitle()%></td> 
                <td><%=book.getYear()%></td> 
                <td><%=book.getPrice()%></td> 
                <td><a href = 'DisplayItems?ItemId=<%=book.getISBN()%>'><strong>Add to Cart </strong></a></td>
            </tr> 
        	<%} %>
        <% }%>	
<%-- <%-- 			<% --%> 
<!-- // 			Connection con = ConnectDB.connect(); -->

<!-- // 			String q = "select * from books"; -->
<!-- // 			PreparedStatement pst = con.prepareStatement(q); -->
<!-- //             ResultSet rs = pst.executeQuery(); -->
            
<!-- // 			while (rs.next())  -->
<!-- //             {	 -->
<!-- //             	out.println("<tr>\r\n" -->
<!-- //             			+ "		            	<td>" + rs.getString(1) + "</td>\r\n" -->
<!-- //             			+ "		            	<td>" + rs.getString(2)+ "</td>\r\n" -->
<!-- //             			+ "		            	<td>" + rs.getInt(3) + "</td>\r\n" -->
<!-- //             			+ "		            	<td>" + rs.getDouble(4)+ "</td>\r\n" -->
<!-- //             			+"						<td><a href = 'DisplayItems?ItemId="+ rs.getString(1) + "'><strong>Add To Cart </strong></a></td>" -->
<!-- //             			+ "	            	</tr><br>" -->
<!-- //             			);	 -->
<!-- //             } -->
<%-- <%-- 			%> --%> 
   </table>
  </body>
</html>
