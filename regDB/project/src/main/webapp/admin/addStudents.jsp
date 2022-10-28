<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.ApplicationDB"%>
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
		String newSid = request.getParameter("sid");
		String newName = request.getParameter("name");
		String newPhone = request.getParameter("phone");
		String newBday = request.getParameter("birthday");
		String newPassword = request.getParameter("password");
		Statement st = con.createStatement();

		String insert = "INSERT INTO students(sid, name, phone, birthday, password) VALUES (?, ?, ?, ?, ?)";
		PreparedStatement ps = con.prepareStatement(insert);
		//Add parameters of the query.
		ps.setString(1, newSid);
		ps.setString(2, newName);
		ps.setString(3, newPhone);
		ps.setString(4, newBday);
		ps.setString(5, newPassword);
		//Run the query against the DB
		ps.executeUpdate();
		//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
		con.close();
		response.sendRedirect("adminHome.jsp");

	} catch (Exception ex) {
/* 		out.print(ex);
 */		out.print("Insert failed, go back a page and try again :(");
	}
	%>
</body>
</html>