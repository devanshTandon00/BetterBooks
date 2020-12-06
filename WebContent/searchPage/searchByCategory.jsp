<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="connection.ConnectDB"%>
<!DOCTYPE html>
<html>
<head>
	<link href = "searchPage.css" rel = "stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@600&family=Work+Sans:ital@1&display=swap" rel="stylesheet">    

</head>
<body>
	<%
		if(session.getAttribute("username") == null){
			response.sendRedirect("../loginPage/login.jsp");
		}
	%>
	
	<a href = "../landingPage/customerLandingPage.jsp" class = "projectTitle"> BetterBooks </a>
	<h2>List:</h2>
	<select id="select" name="form" onchange="location = this.value">
		<option
			value="searchByCategory.jsp?sortBy=default&searchByCategory=<%=request.getParameter("searchByCategory")%>">Sort
			By</option>
		<option
			value="searchByCategory.jsp?sortBy=nameAsc&searchByCategory=<%=request.getParameter("searchByCategory")%>">Name:
			Low to High</option>
		<option
			value="searchByCategory.jsp?sortBy=nameDesc&searchByCategory=<%=request.getParameter("searchByCategory")%>">Name:
			High to Low</option>
		<option
			value="searchByCategory.jsp?sortBy=sortAscYear&searchByCategory=<%=request.getParameter("searchByCategory")%>">Year:
			Low to High</option>
		<option
			value="searchByCategory.jsp?sortBy=sortDescYear&searchByCategory=<%=request.getParameter("searchByCategory")%>">Year:
			High to Low</option>
	</select>

	<div style="overflow-x: auto;">
		<table cellpadding = "20">
			<tr>
				<td class = "header">S.No.</td>
				<td class = "header">Title</td>
				<td class = "header">Year</td>
				<td class = "header">Price</td>
				<td class = "header">Category Name</td>
			</tr>
			<div>
				<%
					String search = request.getParameter("searchByCategory");

					String sortBy = request.getParameter("sortBy");
					try (Connection con = ConnectDB.connect();) {
						PreparedStatement statement = con
								.prepareStatement("SELECT * FROM team3bookshop.books join team3bookshop.book_category using(ISBN) join category using(category_id) where category_name like ?");
						switch (sortBy) {
						case "nameAsc":
							statement = con.prepareStatement(
									"SELECT * FROM team3bookshop.books join book_category using(ISBN) join category using(category_id) where category_name like ? ORDER BY title ASC;");
							statement.setString(1, "%" + search + "%");

							break;
						case "nameDesc":
							statement = con.prepareStatement(
									"SELECT * FROM team3bookshop.books join book_category using(ISBN) join category using(category_id) where category_name like ? ORDER BY title DESC;");
							statement.setString(1, "%" + search + "%");
							
							break;
						case "sortAscYear":
							statement = con.prepareStatement(
									"SELECT * FROM team3bookshop.books join book_category using(ISBN) join category using(category_id) where category_name like ? ORDER BY year ASC;");
							statement.setString(1, "%" + search + "%");
							
							break;

							
						case "sortDescYear":
							statement = con.prepareStatement(
									"SELECT * FROM team3bookshop.books join book_category using(ISBN) join category using(category_id) where category_name like ? ORDER BY year DESC;");
							statement.setString(1, "%" + search + "%");
							
							break;

						default:
							statement = con.prepareStatement(
									"SELECT * FROM team3bookshop.books join team3bookshop.book_category using(ISBN) join category using(category_id) where category_name like ?");
							statement.setString(1, "%" + search + "%");

						}

						ResultSet rs = statement.executeQuery();
						int i = 1;
						System.out.println(statement);

						while (rs.next()) {
				%>
				<tr>
					<td><%=i++%></td>
					<td><%=rs.getString("title")%></td>
					<td><%=rs.getString("year")%></td>	
					<td><%=rs.getDouble("price")%></td>
					<td><%=rs.getString("category_name")%></td>
				</tr>
				<%
					}
						rs.close();
					} catch (SQLException e) {
						out.println("SQLException caught: " + e.getMessage());
					}
				%>

			</div>
		</table>
	</div>

</body>
</html>