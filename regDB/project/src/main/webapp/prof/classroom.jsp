<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Classrooms</title>
</head>
<body>
	<br>

	<form method="get" action="profHome.jsp">
	
		Click here to return. <input type="submit" value="submit" />
	</form>
	<br>

	<form action="grades.jsp" method="POST">

		<table align="center" cellpadding="5" cellspacing="5" border="1">
			<tr>

			</tr>
			<tr bgcolor="#A52A2A">
				<td><b>sid</b></td>
				<td><b>course_name</b></td>
				<td><b>cid</b></td>
				<td><b>pid</b></td>
				<td><b>section_number</b></td>
				<td><b>semester</b></td>
				<td><b>grade</b></td>
			</tr>
			<%
			try {
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/database", "root", "pancakes");
				Statement smt = con.createStatement();

				String newPID = (String) session.getAttribute("username");

				String sql = "SELECT * FROM enrollment,courses WHERE enrollment.cid = courses.cid AND pid ='" + newPID + "'";

				ResultSet rs = smt.executeQuery(sql);
				while (rs.next()) {
					String newSID = rs.getString("sid");
					String newCourse = rs.getString("course_name");
					String newCID = rs.getString("cid");
					String newSection = rs.getString("section_number");
					String newSemester = rs.getString("semester");
			%>
			<tr bgcolor="DEB887">

				<td><%=newSID%><input type="hidden" name="sid"
					value=<%=newSID%>></td>
				<td><%=newCourse%></td>
				<td><%=newCID%> <input type="hidden" name="cid"
					value=<%=newCID%>></td>
				<td><%=newPID%></td>
				<td><%=newSection%> <input type="hidden" name="section_number"
					value=<%=newSection%>></td>
				<td><%=newSemester%> <input type="hidden" name="semester"
					value=<%=newSemester%>></td>
				<td>Grade: <input type="text" name="grade" /> <input
					type="submit" value="Update" /></td>

			</tr>
			<%
			}
			} catch (Exception ex) {
/* 			out.print(ex);
 */			out.print("Insert failed, go  back and try again :(");
			}
			%>

		</table>
	</form>
</body>
</html>