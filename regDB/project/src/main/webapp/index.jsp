<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>
</head>
<body>
	<%
		String userType = (String)session.getAttribute("userType");
		int userTypeNum = 0;
		
		if (userType != null) {
			if (userType.equals("admin")) {
				userTypeNum = 1;
			} else if (userType.equals("professors")) {
				userTypeNum = 2;
			} else if (userType.equals("students")) {
				userTypeNum = 3;
			}
		}
		
		if ((session.getAttribute("username") == null)) {
			%>
				You are not logged in<br/>
				<form action="login.jsp" method="get">
	    			<button>Login</button>
				</form>
			<%
		} else {
			%>
				Welcome <%=session.getAttribute("username")%><br/>
				<a href='logout.jsp'>Log out</a> <br/>
			<%
			switch (userTypeNum) {
				case 1:
					%>
						<form action="admin/adminHome.jsp" method="get">
							<button>Admin Options Page</button>
						</form>
						<br>
					<%
				case 2:
					%>
						<form action="prof/profHome.jsp" method="get">
							<button>Professors Options Page</button>
						</form>
						<br>
					<%
				case 3:
					%>
						<form action="user/userHome.jsp" method="get">
							<button>Students Options Page</button>
						</form>
					<%
				default:
					break;
			}	
		}
	%>
</body>
</html>