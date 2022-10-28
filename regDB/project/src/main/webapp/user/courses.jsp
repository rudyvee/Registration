<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Courses Available</title>
</head>
<body>
	<br>

	<form method="post" action="userHome.jsp">

		Click here to return. <input type="submit" value="submit" />
	</form>
	<br>

	<form action="enroll.jsp" method="post">

		<table align="center" cellpadding="5" cellspacing="5" border="1">
			<tr>

			</tr>
			<tr bgcolor="#A52A2A">
				<td><b>cid</b></td>
				<td><b>course_name</b></td>
				<td><b>number_of_credits</b></td>
				<td><b>did</b></td>
				<td><b>prerequisites</b></td>
				<td><b>section_number</b></td>
				<td><b>meeting_times</b></td>
				<td><b>semester</b></td>
				<td><b>pid</b></td>
				<td><b>enroll</b></td>
			</tr>
			<%
			try {
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/database", "root", "pancakes");
				Statement smt = con.createStatement();

				String sql = "SELECT * FROM courses";

				ResultSet rs = smt.executeQuery(sql);
				while (rs.next()) {
					String newCID = rs.getString("cid");
					String newSection = rs.getString("section_number");
					String newSemester = rs.getString("semester");
			%>
			<tr bgcolor="DEB887">

				<td><%=newCID%> <input type="hidden" name="cid"
					value=<%=newCID%>></td>
				<td><%=rs.getString("course_name")%></td>
				<td><%=rs.getInt("number_of_credits")%></td>
				<td><%=rs.getString("did")%></td>
				<td><%=rs.getString("prerequisites")%></td>
				<td><%=newSection%> <input type="hidden" name="section_number"
					value=<%=newSection%>></td>
				<td><%=rs.getString("meeting_times")%></td>
				<td><%=newSemester%> <input type="hidden" name="semester"
					value=<%=newSemester%>></td>
				<td><%=rs.getString("pid")%></td>

				<td>

					<button>Enroll</button>
				</td>
			</tr>
			<%
			}

			} catch (Exception ex) {
			out.print(ex);
			out.print("Insert Failed");
			}
			%>

		</table>
	</form>

</body>
</html>