<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ page import="connection.ConnectDB" %>
<!DOCTYPE html>
<html>
<head>
<title>Search Page</title>
</head>
<body>

	<h1>Search Books</h1>
	
	<div class="row">
		<div class="col-md-4">
			<form action="" method="get">
				<input type="text" class="form-control" name="q"
					placeholder="Search here..." />
			</form>
		</div>
	</div>

	<%
		try (Connection con = ConnectDB.connect();) {
			String queryString = request.getParameter("q");
	
			PreparedStatement preparedStatement = null;
			
			if (queryString != null) {
				//query will search through ISBN and book titles for now
				preparedStatement = con.prepareStatement(
						"SELECT * FROM team3bookshop.books WHERE ISBN LIKE ? OR title LIKE ? ");
			}
// 			else {
// 				preparedStatement = con.prepareStatement("SELECT * FROM team3bookshop.books");
// 			}
			
			if(queryString != null){
				preparedStatement.setString(1, queryString);
				preparedStatement.setString(2, queryString);
				ResultSet rs = preparedStatement.executeQuery();
			}
			System.out.println(preparedStatement);
			
			
			System.out.println(queryString);
			String data;

			/* if (queryString != null) {
				//query will search through ISBN and book titles for now
				data = "SELECT * FROM team3bookshop.books WHERE ISBN LIKE \'queryString%\' OR title LIKE \'queryString%\'";
			}
			else {
				data = "SELECT * FROM team3bookshop.books";
			} */

// 			ResultSet rs = stmt.executeQuery(data);
			%>
				<table class="table table-bordered table-striped table-hover">
		<thead>
			<tr>
				<th>ISBN</th>
				<th>Title</th>
			</tr>
		</thead>
		<%
			while (rs.next()) {	%>
		<tbody>
			<tr>
				<td><%=rs.getString(1)%></td>
				<td><%=rs.getString(2)%></td>
			</tr>
		</tbody>
	</table>
	 <% } %>
<%      
            rs.close();
//             stmt.close();
            con.close();
        } catch(SQLException e) {
            out.println("SQLException caught: " + e.getMessage());
        }
%>
	</table>
</body>
</html>