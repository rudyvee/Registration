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
		String newCid = request.getParameter("cid");
		String newCourse_name = request.getParameter("course_name");
		String newCredits = request.getParameter("number_of_credits");
		String newDid = request.getParameter("did");
		String newPrerequisites = request.getParameter("prerequisites");
		String newSection_number = request.getParameter("section_number");
		String newMeeting_times = request.getParameter("meeting_times");
		String newSemester = request.getParameter("semester");
		String newTeacher = request.getParameter("pid");
		Statement st = con.createStatement();
		String insert = "INSERT INTO courses(cid, course_name, number_of_credits, did, prerequisites, section_number, meeting_times, semester, pid) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
		PreparedStatement ps = con.prepareStatement(insert);
		//Add parameters of the query.
		ps.setString(1, newCid);
		ps.setString(2, newCourse_name);
		ps.setString(3, newCredits);
		ps.setString(4, newDid);
		ps.setString(5, newPrerequisites);
		ps.setString(6, newSection_number);
		ps.setString(7, newMeeting_times);
		ps.setString(8, newSemester);
		ps.setString(9, newTeacher);

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