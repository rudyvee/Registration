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
		String newStudentID = (String) session.getAttribute("username");
		String newCid = request.getParameter("cid");
		String newSection_number = request.getParameter("section_number");
		String newSemester = request.getParameter("semester");

		Statement st = con.createStatement();

		String insert = "INSERT INTO enrollment(sid, cid, section_number, semester) VALUES (?, ?, ?, ?)";
		PreparedStatement ps = con.prepareStatement(insert);
		//Add parameters of the query.
		ps.setString(1, newStudentID);
		ps.setString(2, newCid);
		ps.setString(3, newSection_number);
		ps.setString(4, newSemester);

		//Run the query against the DB
		ps.executeUpdate();
		//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
		con.close();
		response.sendRedirect("courses.jsp");
	} catch (Exception ex) {
/* 		out.print(ex);
 */		out.print("Insert failed, course already exists :(");
	}
	%>
</body>
</html>