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
			value="searchByAuthor.jsp?sortBy=default&searchByAuthor=<%=request.getParameter("searchByAuthor")%>">Sort
			By</option>
		<option
			value="searchByAuthor.jsp?sortBy=nameAsc&searchByAuthor=<%=request.getParameter("searchByAuthor")%>">Name: Asc to Desc</option>
		<option
			value="searchByAuthor.jsp?sortBy=nameDesc&searchByAuthor=<%=request.getParameter("searchByAuthor")%>">Name: Desc to Asc</option>
<!-- 		<option -->
<%-- 			value="searchByAuthor.jsp?sortBy=sortAscYear&searchByAuthor=<%=request.getParameter("searchByAuthor")%>">Year: --%>
<!-- 			Low to High</option> -->
<!-- 		<option -->
<%-- 			value="searchByAuthor.jsp?sortBy=sortDescYear&searchByAuthor=<%=request.getParameter("searchByAuthor")%>">Year: --%>
<!-- 			High to Low</option> -->
	</select>

	<div style="overflow-x: auto;">
		<table cellpadding = "20">
			<tr>
				<td class = "header">S.No.</td>
				<td class = "header">First Name</td>
				<td class = "header">Last Name</td>
			</tr>
			<div>
				<%
					String search = request.getParameter("searchByAuthor");

					String sortBy = request.getParameter("sortBy");
					try (Connection con = ConnectDB.connect();) {
						PreparedStatement statement = con
								.prepareStatement("SELECT * FROM team3bookshop.authors where first_name LIKE ?");
						switch (sortBy) {
						case "nameAsc":
							statement = con.prepareStatement(
									"SELECT * FROM team3bookshop.authors WHERE first_name LIKE ? ORDER BY last_name ASC");
							statement.setString(1, "%" + search + "%");

							break;
						case "nameDesc":
							statement = con.prepareStatement(
									"SELECT * FROM team3bookshop.authors WHERE first_name LIKE ? ORDER BY last_name DESC");
							statement.setString(1, "%" + search + "%");
							
							break;
						case "sortAscYear":
							statement = con.prepareStatement(
									"SELECT * FROM team3bookshop.books WHERE title LIKE ? ORDER BY year ASC");
							statement.setString(1, "%" + search + "%");
							
							break;

							
						case "sortDescYear":
							statement = con.prepareStatement(
									"SELECT * FROM team3bookshop.books WHERE title LIKE ? ORDER BY year DESC");
							statement.setString(1, "%" + search + "%");
							
							break;

						default:
							statement = con.prepareStatement(
									"SELECT * FROM team3bookshop.authors where first_name LIKE ?");
							statement.setString(1, "%" + search + "%");

						}
						ResultSet rs = statement.executeQuery();
						int i = 1;
						System.out.println(statement);

						while (rs.next()) {
				%>
				<tr>
					<td><%=i++%></td>
					<td><%=rs.getString("first_name")%></td>
					<td><%=rs.getString("last_name")%></td>	
<%-- 					<td><%=rs.getDouble("price")%></td> --%>
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