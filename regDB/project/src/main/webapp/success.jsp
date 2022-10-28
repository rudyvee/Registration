<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Logged In</title>
</head>
<body>
	<%
		if ((session.getAttribute("userType") == null)) {
			%>
				You are not logged in<br/>
				<a href="index.jsp">Please Login</a>
			<%
		} else if ((session.getAttribute("userType") == "admin")) {
			%>
				Welcome admin <%=session.getAttribute("username")%> <a href='logout.jsp'>Log out</a>
			<%
		} else if ((session.getAttribute("userType") == "professors")) {
			%>
				Welcome Professor <%=session.getAttribute("username")%> <a href='logout.jsp'>Log out</a>
			<%
		} else if ((session.getAttribute("userType") == "students")) {
			%>
				Welcome <%=session.getAttribute("username")%> <a href='logout.jsp'>Log out</a>
			<%
		}
	%>
	
	<form action="index.jsp" method="get">
    	<button>Home</button>
	</form>
</body>
</html>