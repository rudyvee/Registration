<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Courses History</title>
</head>
<body>
	<br>

	<form method="post" action="userHome.jsp">

		Click here to return. <input type="submit" value="submit" />
	</form>
	<br>

	<!-- 	<form action="enroll.jsp" method="post">
 -->
	<table align="center" cellpadding="5" cellspacing="5" border="1">
		<tr>

		</tr>
		<tr bgcolor="#A52A2A">
			<td><b>sid</b></td>
			<td><b>cid</b></td>
			<td><b>section_number</b></td>
			<td><b>semester</b></td>
			<td><b>grade</b></td>

		</tr>
		<%
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/database", "root", "pancakes");
			Statement smt = con.createStatement();
			String newStudentID = (String) session.getAttribute("username");

			String sql = "SELECT * FROM enrollment where sid='" + newStudentID + "'";

			ResultSet rs = smt.executeQuery(sql);
			while (rs.next()) {
				String newCID = rs.getString("cid");
				String newSection = rs.getString("section_number");
				String newSemester = rs.getString("semester");
				String newGrade = rs.getString("grade");
		%>
		<tr bgcolor="DEB887">

			<td><%=newStudentID%></td>
			<td><%=newCID%></td>
			<td><%=newSection%></td>
			<td><%=newSemester%></td>
			<td>newGrade</td>


		</tr>
		<%
		}
		} catch (Exception ex) {
		out.print(ex);
		out.print("Insert Failed");
		}
		%>

	</table>

</body>
</html>