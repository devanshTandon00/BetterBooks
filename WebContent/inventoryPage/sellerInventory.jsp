<%@ page import="java.sql.*"%>
<html>
	<body>
	<% 
	if(session.getAttribute("username") == null){
		response.sendRedirect("../loginPage/login.jsp");
	}
	%>
		
	<head>
	        <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@600&family=Work+Sans:ital@1&display=swap" rel="stylesheet">    
	        <link href = '../inventoryPage/inventory.css' rel = 'stylesheet' type="text/css">
	        <link href = '../landingPage/landingPage.css' rel = 'stylesheet' type="text/css">
	        
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
                        <li><a href="../sellerPage/editBook.jsp"> Edit Book </a></li> 
                        <li><a href="../sellerPage/delete.jsp"> Delete Book </a></li>                       
                    </ul>
                </nav>
            </div>
        </header>
		<h1 style = "font-size:24pt; font-style:italic">Welcome to Inventory!</h1>
		
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
            String queryString = 
            		"SELECT books.ISBN, books.title, numberOfBooks FROM books, inventory where books.ISBN = inventory.ISBN ";
            ResultSet rs = stmt.executeQuery(queryString);
            %>
            <table cellpadding = "20" style = "margin: 0px auto;">
            <tr>
					<td style = "font-style:italic;	font-weight: bold;font-size: 18pt;">ISBN</td>
					<td style = "font-style:italic;	font-weight: bold;font-size: 24pt;">Title</td>
					<td style = "font-style:italic;	font-weight: bold;font-size: 18pt;">Number of Books</td>
			</tr>
            <%
            while (rs.next()) 
            {
            %>	
	            	<tr>
		            	<td style = "font-size: 12pt;"><%=rs.getString(1)%></td>
		            	<td style = "font-size: 12pt;"><%=rs.getString(2)%></td>
		            	<td style = "font-size: 12pt;"><%=rs.getInt(3)%></td>
	            	</tr>    	
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
