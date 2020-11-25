<%@ page import="java.sql.*"%>
<html>
	<body>
	<head>
	        <link href = '../inventoryPage/inventory.css' rel = 'stylesheet' type="text/css">
	        <link href = '../landingPage/landingPage.css' rel = 'stylesheet' type="text/css">
	        
	</head>
		<header> 
            <div class = "container">
                <img src = "../images/icon-book.svg" class="book-icon">
                <h3 class = "projectTitle"><a href = "landingPage/index.jsp"> BetterBooks </a></h3>
                <nav class = "navbar fixed-top">
                    <ul>
                        <li><a href = "loginPage/login.html">Register</a></li>
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
		<h1>Welcome to Inventory!</h1>
		
    <%
    	String db = "team3bookshop";
    	//note that the user and password needs to be changed for different SQL Workbenches
        String user = "root";
    	String password = "root";
        try {

            java.sql.Connection con;
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            // change BetterBooks in the url to name of schema to run
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/team3bookshop?serverTimezone=EST5EDT",user, password);

            //out.println("Initial entries in table hw1: <br/>");
            Statement stmt = con.createStatement();
            String queryString = "SELECT ISBN, numberOfBooks FROM team3bookshop.inventory";
            ResultSet rs = stmt.executeQuery(queryString);
            %>
            <table cellpadding = "20">
            <tr>
					<td>ISBN</td>
					<td>Number of Books</td>
			</tr>
            <%
            while (rs.next()) 
            {
            %>	
            	<tbody class = "info" style = "width: 100%;">
	            	<tr>
		            	<td><%=rs.getString(1)%></td>
		            	<td><%=rs.getInt(2)%></td>
	            	</tr>    
            	</tbody>   	
            <% } %>
<%      
            rs.close();
            stmt.close();
            con.close();
        } catch(SQLException e) {
            out.println("SQLException caught: " + e.getMessage() + db);
        }
 %>
   </table>
  </body>
</html>
