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
		if(session.getAttribute("username") == null)
		{
			response.sendRedirect("../loginPage/login.jsp");
		}
	%>
	
	<a href = "../landingPage/customerLandingPage.jsp" class = "projectTitle"> BetterBooks </a>
	<h2>List:</h2>
	<select id="select" name="form" onchange="location = this.value">
		<option
			value="searchByPublisher.jsp?sortBy=default&searchByPublisher=<%=request.getParameter("searchByPublisher")%>">Sort By</option>
		<option
			value="searchByPublisher.jsp?sortBy=pubAsc&searchByPublisher=<%=request.getParameter("searchByPublisher")%>">Publisher: Asc to Desc</option>
		<option
			value="searchByPublisher.jsp?sortBy=pubDesc&searchByPublisher=<%=request.getParameter("searchByPublisher")%>">Publisher: Desc to Asc</option>
	</select>

	<div style="overflow-x: auto;">
		<table cellpadding = "20">
			<tr>
				<td class = "header">S.No.</td>
				<td class = "header">Publisher Title</td>
				<td class = "header">Book ISBN</td>
				<td class = "header">Book Title</td>
				<td class = "header">Price</td>
			</tr>
			<div>
				<%
					String search = request.getParameter("searchByPublisher");

					String sortBy = request.getParameter("sortBy");
					try (Connection con = ConnectDB.connect();) 
					{
						PreparedStatement statement = con
								.prepareStatement("SELECT * FROM team3bookshop.publishers JOIN books USING(ISBN) WHERE pub_title LIKE ?");
						switch (sortBy) 
						{
						case "pubAsc":
							statement = con.prepareStatement(
									"SELECT * FROM team3bookshop.publishers JOIN books USING(ISBN) WHERE pub_title LIKE ? ORDER BY pub_title ASC");
							statement.setString(1, "%" + search + "%");

							break;
						case "pubDesc":
							statement = con.prepareStatement(
									"SELECT * FROM team3bookshop.publishers JOIN books USING(ISBN) WHERE pub_title LIKE ? ORDER BY pub_title DESC");
							statement.setString(1, "%" + search + "%");
							
							break;
						default:
							statement = con.prepareStatement(
									"SELECT * FROM team3bookshop.publishers JOIN books USING(ISBN) WHERE pub_title LIKE ?");
							statement.setString(1, "%" + search + "%");

						}
						ResultSet rs = statement.executeQuery();
						int i = 1;
						System.out.println(statement);

						while (rs.next()) {
				%>
				<tr>
					<td><%=i++%></td>
					<td><%=rs.getString("pub_title")%></td>
					<td><%=rs.getString("ISBN")%></td>
					<td><%=rs.getString("title")%></td>
					<td>$<%=rs.getString("price")%></td>
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