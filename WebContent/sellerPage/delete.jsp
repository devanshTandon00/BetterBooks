<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="connection.ConnectDB"%> 
<%@page import="java.util.ArrayList"%> 
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.PreparedStatement"%>
<!DOCTYPE html>
<html>
<body>
		<head>
			<link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@600&family=Work+Sans:ital@1&display=swap" rel="stylesheet">    
	        <link href = 'delete.css' rel = 'stylesheet' type="text/css">
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
                        <li><a href="delete.jsp"> Delete Book </a></li>                                  
                    </ul>
                </nav>
            </div>
        </header>
        
        <div class="search">
	        <form onSubmit="myFunction()">
	        		<input type="text" placeholder="Enter ISBN" name="search" class = "searchBox" style = "width:100%">
	        </form>
        </div>
        <%
        	int result = 0;
        	if(request.getParameter("search") != null){
	        	int isbn = Integer.parseInt(request.getParameter("search"));
	       		String q = "DELETE FROM books where ISBN = ?";
	       		
	       		try (Connection con = ConnectDB.connect();) {
	       	    	PreparedStatement preparedStatement = con.prepareStatement(q);
	       	    	preparedStatement.setInt(1, isbn);
	       	        result = preparedStatement.executeUpdate();
	       	        System.out.println(preparedStatement);
	       		}
	       		catch(Exception e){
	       			
	       		}
        	}
        		
        %>
        <script>
		function myFunction() {
			alert("Deleted the book!");
		}		
		</script>
</body>
</html>