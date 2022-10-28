<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Student options</title>
</head>
<body>
	<h1>Student Home</h1>
	<br>
	<form action="courses.jsp" method="get">
		<button>View courses for enrollment.</button>
	</form>

	<br>
	<form action="courseHistory.jsp" method="get">
		<button>View course history.</button>
	</form>

	<br>
	<form action="../logout.jsp" method="get">
		<button>Logout</button>
	</form>
</body>
</html>