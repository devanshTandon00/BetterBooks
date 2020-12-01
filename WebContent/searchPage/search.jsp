<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="connection.ConnectDB"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Search</title>
</head>
<body>
	<div id="label"></div>
	<select id="select" name="form" onchange="location = this.value">
		<option
			value="searchByTitle.jsp?sortBy=default&search=<%=request.getParameter("search")%>">Sort
			By</option>
		<option
			value="searchByTitle.jsp?sortBy=costAsc&search=<%=request.getParameter("search")%>">Cost:
			Low to High</option>
	</select>


	<h2>List:</h2>
	<div style="overflow-x: auto;">
		<table>
			<tr>
				<th>IBSN</th>
				<th>Title</th>
			</tr>
			<div>
				<%
					String search = request.getParameter("search");
					String sortBy = request.getParameter("sortBy");
					try (Connection con = ConnectDB.connect();) {
						PreparedStatement statement = con
								.prepareStatement("SELECT * FROM team3bookshop.books");
						switch (sortBy) {
						case "costAsc":
							statement = con.prepareStatement(
									"SELECT * FROM team3bookshop.books WHERE ISBN LIKE ?");
							break;
						case "costDes":
							statement = con.prepareStatement(
									"SELECT * FROM team3bookshop.books WHERE title LIKE");

						default:
							statement = con.prepareStatement("SELECT * FROM team3bookshop.books");
						}
						statement.setString(1, "%" + search + "%");
						ResultSet rs = statement.executeQuery();
						int i = 1;
						while (rs.next()) {
				%>
				<tr>
					<td><%=i++%></td>
					<td><%=rs.getInt(2)%></td>
					<td><%=rs.getString(3)%></td>
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