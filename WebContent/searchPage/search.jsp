<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="connection.ConnectDB"%>
<!DOCTYPE html>
<html>
<head>
	<link href = "searchPage.css" rel = "stylesheet">
</head>
<body>
	<div id="label"></div>
	<h2>List:</h2>
	<select id="select" name="form" onchange="location = this.value">
		<option
			value="search.jsp?sortBy=default&search=<%=request.getParameter("search")%>">Sort
			By</option>
		<option
			value="search.jsp?sortBy=costAsc&search=<%=request.getParameter("search")%>">Cost:
			Low to High</option>
		<option
			value="search.jsp?sortBy=costDesc&search=<%=request.getParameter("search")%>">Cost:
			High to Low</option>
		<option
			value="search.jsp?sortBy=sortAscYear&search=<%=request.getParameter("search")%>">Year:
			Low to High</option>
		<option
			value="search.jsp?sortBy=sortDescYear&search=<%=request.getParameter("search")%>">Year:
			High to Low</option>
	</select>

	<div style="overflow-x: auto;">
		<table cellpadding = "20">
			<tr>
				<td class = "header">S.No.</td>
				<td class = "header">Title</td>
				<td class = "header">Year</td>
				<td class = "header">Price</td>
			</tr>
			<div>
				<%
					String search = request.getParameter("search");

					String sortBy = request.getParameter("sortBy");
					try (Connection con = ConnectDB.connect();) {
						PreparedStatement statement = con
								.prepareStatement("SELECT * FROM team3bookshop.books where title LIKE ?");
						switch (sortBy) {
						case "costAsc":
							statement = con.prepareStatement(
									"SELECT * FROM team3bookshop.books WHERE title LIKE ? ORDER BY price ASC");
							statement.setString(1, "%" + search + "%");

							break;
						case "costDesc":
							statement = con.prepareStatement(
									"SELECT * FROM team3bookshop.books WHERE title LIKE ? ORDER BY price DESC");
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
									"SELECT * FROM team3bookshop.books WHERE title LIKE ?");
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