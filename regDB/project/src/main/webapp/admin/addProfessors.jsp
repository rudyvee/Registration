<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
	try {
		//Get the database connection
		ApplicationDB db = new ApplicationDB();
		Connection con = db.getConnection();
		//Create a SQL statement
		Statement stmt = con.createStatement();
		String newPid = request.getParameter("pid");
		String newDid = request.getParameter("did");
		String newName = request.getParameter("name");
		String newPhone = request.getParameter("phone");
		String newOffice_id = request.getParameter("office_id");
		String newPassword = request.getParameter("password");
		Statement st = con.createStatement();

		String insert = "INSERT INTO professors(pid, did, name, phone, office_id, password) VALUES (?, ?, ?, ?, ?, ?)";
		PreparedStatement ps = con.prepareStatement(insert);
		//Add parameters of the query.
		ps.setString(1, newPid);
		ps.setString(2, newDid);
		ps.setString(3, newName);
		ps.setString(4, newPhone);
		ps.setString(5, newOffice_id);
		ps.setString(6, newPassword);
		//Run the query against the DB
		ps.executeUpdate();
		//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
		con.close();
		response.sendRedirect("adminHome.jsp");
	} catch (Exception ex) {
/* 		out.print(ex);
 */		out.print("Insert failed, go  back and try again :(");
	}
	%>

</body>
</html>