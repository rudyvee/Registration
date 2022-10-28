<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Options</title>
</head>
<body>
	<h1>Admin Home</h1>
	<br>
	<form action="addProfessors.jsp" method="get">
		<table>
			<tr>
				<td>ProfessorID</td>
				<td><input type="text" name="pid"></td>
			</tr>
			<tr>
				<td>DeptID</td>
				<td><input type="text" name="did"></td>
			</tr>
			<tr>
				<td>Name</td>
				<td><input type="text" name="name"></td>
			</tr>
			<tr>
				<td>Phone</td>
				<td><input type="text" name="phone"></td>
			</tr>
			<tr>
				<td>OfficeID</td>
				<td><input type="text" name="office_id"></td>
			</tr>
			<tr>
				<td>Password</td>
				<td><input type="text" name="password"></td>
			</tr>
		</table>
		<input type="submit" value="Add the new professor.">
	</form>
	<br>
	<form action="addStudents.jsp" method="get">
		<table>
			<tr>
				<td>StudentID</td>
				<td><input type="text" name="sid"></td>
			</tr>
			<tr>
				<td>Name</td>
				<td><input type="text" name="name"></td>
			</tr>
			<tr>
				<td>Phone</td>
				<td><input type="text" name="phone"></td>
			</tr>
			<tr>
				<td>Birthday</td>
				<td><input type="text" name="birthday"></td>
			</tr>
			<tr>
				<td>Password</td>
				<td><input type="text" name="password"></td>
			</tr>
		</table>
		<input type="submit" value="Add a new student.">
	</form>
	<br>
	<form action="addCourses.jsp" method="get">
		<table>
			<tr>
				<td>CourseID</td>
				<td><input type="text" name="cid"></td>
			</tr>
			<tr>
				<td>Name</td>
				<td><input type="text" name="course_name"></td>
			</tr>
			<tr>
				<td>Credits</td>
				<td><input type="text" name="number_of_credits"></td>
			</tr>
			<tr>
				<td>DeptID</td>
				<td><input type="text" name="did"></td>
			</tr>
			<tr>
				<td>PreReqs</td>
				<td><input type="text" name="prerequisites"></td>
			</tr>
			<tr>
				<td>Section</td>
				<td><input type="text" name="section_number"></td>
			</tr>
			<tr>
				<td>Time</td>
				<td><input type="text" name="meeting_times"></td>
			</tr>
			<tr>
				<td>Semester</td>
				<td><input type="text" name="semester"></td>
			</tr>
			<tr>
				<td>Professor</td>
				<td><input type="text" name="pid"></td>
			</tr>
		</table>
		<input type="submit" value="Add the new course.">
	</form>
</body>
</html>