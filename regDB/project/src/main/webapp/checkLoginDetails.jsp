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
			String userid = request.getParameter("username");   
		    String pwd = request.getParameter("password");
		    Class.forName("com.mysql.jdbc.Driver");
		    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/database","root", "pancakes");
		    Statement st = con.createStatement();
		    ResultSet rs;
		    
		    rs = st.executeQuery("SELECT * FROM admin WHERE username='" + userid + "' and password='" + pwd + "'");
		    
		    if (rs.next()) {
		    	session.setAttribute("userType", "admin");
		        session.setAttribute("username", userid);
		        response.sendRedirect("success.jsp");
		    } else {
		    	rs = st.executeQuery("SELECT * FROM professors WHERE pid='" + userid + "' and password='" + pwd + "'");
			    if (rs.next()) {
			    	session.setAttribute("userType", "professors");
			        session.setAttribute("username", userid);
			        response.sendRedirect("success.jsp");
			    } else {
			    	rs = st.executeQuery("SELECT * FROM students WHERE sid='" + userid + "' and password='" + pwd + "'");
				    if (rs.next()) {
				    	session.setAttribute("userType", "students");
				        session.setAttribute("username", userid);
				        response.sendRedirect("success.jsp");
				    } else {
				    	out.println("Invalid password <a href='index.jsp'>try again</a>");
				    }
			    }
		    }
		    
		    con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
	%>
</body>