<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<body>
   	<b>Login</b>
    <form action="checkLoginDetails.jsp" method="POST">
	    Username: <input type="text" name="username"/> <br/>
	    Password:<input type="password" name="password"/> <br/>
	    <input type="submit" value="Submit"/>
    </form>
    <!-- <br>
    <form action="createAccountPage.jsp" method="get">
   		<input type="submit" value="Create Account" name="Submit"/>
	</form> -->
</body>
</html>